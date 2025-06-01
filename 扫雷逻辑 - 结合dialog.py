# coding=utf-8
import random
import json

class Minesweeper:
    def __init__(self, width=10, height=8, mines=15):
        # 初始化游戏参数
        # 存储位置：qiq2i_sl:main PlayerData[{UUID:$(玩家UUID)}]
        self.width = width
        self.height = height
        self.total_mines = mines
        self.flags_remaining = mines
        self.game_over = False
        self.victory = False
        self.mode = "dig"  # 新增模式状态：dig-挖掘 / flag-标记
        self.first_click = True  # 新增首次点击标志

        # 创建游戏板（二维列表）
        self.board = [[0 for _ in range(width)] for _ in range(height)]
        self.visible = [[' ' for _ in range(width)] for _ in range(height)]
        # self.generate_mines() # 第一次点击后，再生成地雷
        # self.calculate_numbers()

    def generate_mines(self):
        # 随机生成地雷（不安全的）
        positions = random.sample(
            [(x, y) for x in range(self.width) for y in range(self.height)],
            self.total_mines
        )
        for x, y in positions:
            self.board[y][x] = -1  # -1 表示地雷

    def calculate_numbers(self):
        # 计算每个格子周围的地雷数量
        for y in range(self.height):
            for x in range(self.width):
                if self.board[y][x] != -1:
                    count = 0
                    for dx in [-1, 0, 1]:
                        for dy in [-1, 0, 1]:
                            if 0 <= x + dx < self.width and 0 <= y + dy < self.height:
                                if self.board[y + dy][x + dx] == -1:
                                    count += 1
                    self.board[y][x] = count

    def safe_generate_mines(self, safe_x, safe_y):
        """在首次点击后生成地雷（排除安全区域）"""
        # 数据包中改用marker的随机选择来实现。
        # 计算需要排除的区域（3x3）
        exclude = set()
        for dx in [-1, 0, 1]:
            for dy in [-1, 0, 1]:
                x = safe_x + dx
                y = safe_y + dy
                if 0 <= x < self.width and 0 <= y < self.height:
                    exclude.add((x, y))
        # 生成候选位置（排除安全区）
        candidates = [(x, y) for x in range(self.width) for y in range(self.height)
                      if (x, y) not in exclude]

        # 检查地雷数量是否合法
        max_mines = len(candidates)
        if self.total_mines > max_mines:
            raise ValueError(f"地雷数量过多，最多可放置 {max_mines} 个")
        # 随机选择地雷位置
        positions = random.sample(candidates, self.total_mines)
        for x, y in positions:
            self.board[y][x] = -1
        self.calculate_numbers()

    def reveal(self, x, y):
        # 揭开格子（DFS算法展开空白区域）

        # 如果玩家揭开的格子不处于游戏场景之内，则返回False。
        if not (0 <= x < self.width and 0 <= y < self.height):
            return False

        # 首次揭开格子时生成地雷，生成点排除点击位置为中心3x3的区域。
        if self.first_click:
            self.safe_generate_mines(x, y)
            self.first_click = False

        # 点开的是已经可见的区域，返回true
        if self.visible[y][x] != ' ':
            return True

        # 点到雷，返回False
        if self.board[y][x] == -1:  # 踩到地雷
            self.game_over = True
            return False

        # 点到的格子为中心9格内存在雷，则将该格子转变为可见，并返回True
        if self.board[y][x] > 0:
            self.visible[y][x] = str(self.board[y][x])
            return True

        # 点到的格子为中心9格内不存在雷，则将该格子转变为可见，并揭开周围8个格子，并返回True。
        self.visible[y][x] = '0'
        for dx in [-1, 0, 1]:
            for dy in [-1, 0, 1]:
                if dx == 0 and dy == 0:
                    continue
                self.reveal(x + dx, y + dy)
        return True

    def toggle_flag(self, x, y):
        # 标记/取消标记旗帜

        if self.visible[y][x] == 'F':  # 若点击的位置已经标记了
            self.visible[y][x] = ' '
            self.flags_remaining += 1
        elif self.visible[y][x] == ' ' and self.flags_remaining > 0:  # 若点击的位置没有标记，且标记数小于雷的数量。
            self.visible[y][x] = 'F'
            self.flags_remaining -= 1

    def check_victory(self):
        # 检查胜利条件
        uncovered = 0
        for y in range(self.height):
            for x in range(self.width):
                if self.visible[y][x] not in ['F', ' ']:
                    uncovered += 1
        return uncovered + self.total_mines == self.width * self.height

    def print_board(self, show_mines=False):
        # 打印当前游戏状态（调试用）
        for y in range(self.height):
            row = []
            for x in range(self.width):
                if show_mines and self.board[y][x] == -1:
                    row.append('*')
                else:
                    row.append(str(self.visible[y][x]))
            print(' '.join(row))

    def generate_dialog_data(self):
        """生成符合Minecraft dialog格式的存储数据"""
        dialog = {
            "type": "minecraft:multi_action",
            "title": "§e扫雷游戏",
            "body": [{
                "type": "minecraft:plain_message",
                "contents": f"剩余旗帜: {self.flags_remaining} 模式: {self.mode}"
            }],
            "columns": 10,
            "actions": []
        }
        # 修改为动态适应游戏尺寸
        for y in range(self.height):  # 使用self.height代替固定10
            for x in range(self.width):  # 使用self.width代替固定10
                cell_index = y * self.width + x  # 动态计算索引
                cell_state = self.visible[y][x]

                # 根据单元格状态设置显示标签
                label = " "
                if cell_state == 'F':
                    label = "§cF"
                elif cell_state.isdigit():
                    label = f"§{self.get_color_code(int(cell_state))}{cell_state}"
                elif cell_state == '0':
                    label = " "
                dialog["actions"].append({
                    "label": label,
                    "width": 20,
                    "on_click": {
                        "action": "run_command",
                        "command": f"trigger ms.click set {cell_index}"
                    }
                }
                )
        # 添加功能按钮（从第101个位置开始）
        dialog["actions"].extend([
            self._create_mode_button("§a挖掘模式", "dig", 100),
            self._create_mode_button("§c标记模式", "flag", 101),
            self._create_function_button("§l重新开始", "restart", 102),
            self._create_function_button("§4退出游戏", "exit", 103)
        ]
        )

        return dialog

    def get_color_code(self, num):
        """根据数字返回颜色代码"""
        color_map = {
            0: "f",
            1: "9",  # 蓝色
            2: "2",  # 绿色
            3: "c",  # 红色
            4: "5",  # 紫色
            5: "6",  # 金色
            6: "e",  # 黄色
            7: "8",  # 深灰
            8: "0"  # 黑色
        }
        return color_map.get(num, "f")

    def _create_mode_button(self, label, mode, index):
        """创建模式切换按钮"""
        return {
            "label": f"{label} §7[当前]" if self.mode == mode else label,
            "width": 40,
            "on_click": {
                "action": "run_command",
                "command": f"trigger ms.mode set {index}"
            }
        }

    def _create_function_button(self, label, action, index):
        """创建功能按钮"""
        return {
            "label": label,
            "width": 40,
            "on_click": {
                "action": "run_command",
                "command": f"trigger ms.{action} set {index}"
            }
        }

    def print_dialog_data(self):
        """打印生成的dialog存储数据"""
        # 存储位置qiq2i_sl:main PlayerData[{UUID:$(玩家UUID)}].dialog
        data = self.generate_dialog_data()
        # print(json.dumps(data, indent=2, ensure_ascii=False))
        print(data)


# 使用示例
if __name__ == "__main__":
    # 初始化 qiq2i_sl:main/player_init
    game = Minesweeper()

    # 若游戏没结束且没胜利
    # qiq2i_sl:main/tick，当玩家使用trigger进行操作时会触发。
    while not game.game_over and not game.victory:
        # 游戏新增，若玩家没初始化过游戏，则执行 qiq2i_sl:main/player_init
        # 打印当前游戏状态
        game.print_board()
        # dialog显示的设置
        game.print_dialog_data()
        # 玩家将作出的操作，扫雷还是标雷？游戏中使用trigger来实现，改为前面的检测。
        action = input("输入操作（例如 'r 3 4' 或 'f 5 5'）：").split()
        if action[0] == 'r':
            # 点击的位置x, y
            x, y = int(action[1]), int(action[2])
            # 解开格子的逻辑，第一次点击时还包含地雷生成的逻辑。
            success = game.reveal(x, y)
            # 挖到地雷了！
            if not success:
                print("游戏结束！")
                game.print_board(show_mines=True)
                break
        elif action[0] == 'f':
            # 点击的位置
            x, y = int(action[1]), int(action[2])
            # 标雷逻辑
            game.toggle_flag(x, y)

        if game.check_victory():
            print("恭喜你赢了！")
            game.victory = True
            game.print_board(show_mines=True)
