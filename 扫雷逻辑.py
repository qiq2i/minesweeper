# coding=utf-8
import random


class Minesweeper:
    def __init__(self, width=8, height=8, mines=10):
        # 初始化游戏参数
        self.width = width
        self.height = height
        self.total_mines = mines
        self.flags_remaining = mines
        self.game_over = False
        self.victory = False

        # 创建游戏板（二维列表）
        self.board = [[0 for _ in range(width)] for _ in range(height)]
        self.visible = [[' ' for _ in range(width)] for _ in range(height)]
        self.generate_mines()
        self.calculate_numbers()

    def generate_mines(self):
        # 随机生成地雷（排除第一个点击的位置）
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

    def reveal(self, x, y):
        # 揭开格子（DFS算法展开空白区域）
        if not (0 <= x < self.width and 0 <= y < self.height):
            return False

        if self.visible[y][x] != ' ':
            return True

        if self.board[y][x] == -1:  # 踩到地雷
            self.game_over = True
            return False

        if self.board[y][x] > 0:
            self.visible[y][x] = str(self.board[y][x])
            return True

        # 展开空白区域
        self.visible[y][x] = '0'
        for dx in [-1, 0, 1]:
            for dy in [-1, 0, 1]:
                if dx == 0 and dy == 0:
                    continue
                self.reveal(x + dx, y + dy)
        return True

    def toggle_flag(self, x, y):
        # 标记/取消标记旗帜
        if self.visible[y][x] == 'F':
            self.visible[y][x] = ' '
            self.flags_remaining += 1
        elif self.visible[y][x] == ' ' and self.flags_remaining > 0:
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


# 使用示例
if __name__ == "__main__":
    game = Minesweeper()
    while not game.game_over and not game.victory:
        game.print_board()
        action = input("输入操作（例如 'r 3 4' 或 'f 5 5'）：").split()
        if action[0] == 'r':
            x, y = int(action[1]), int(action[2])
            success = game.reveal(x, y)
            if not success:
                print("游戏结束！")
                game.print_board(show_mines=True)
                break
        elif action[0] == 'f':
            x, y = int(action[1]), int(action[2])
            game.toggle_flag(x, y)

        if game.check_victory():
            print("恭喜你赢了！")
            game.victory = True
            game.print_board(show_mines=True)
