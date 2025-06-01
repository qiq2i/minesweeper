# 传入的存储为 qiq2i_sl:main PlayerData[{UUID:$(UUID)}]
# 宏$(width) $(height) $(total_mines) $(flags_remaining) $(game_over) $(victory) $(mode) $(first_click) $(board) $(visible) $(x) $(y)
# 计分板qiq2i_sl_temp1的 #temp_x 和 #temp_y 为格子坐标
$scoreboard players set #temp_x qiq2i_sl_temp1 $(x)
$scoreboard players set #temp_y qiq2i_sl_temp1 $(y)
$execute if score #temp_x qiq2i_sl_temp1 matches $(width).. run return 0
execute if score #temp_x qiq2i_sl_temp1 matches ..-1 run return 0
$execute if score #temp_y qiq2i_sl_temp1 matches $(height).. run return 0
execute if score #temp_y qiq2i_sl_temp1 matches ..-1 run return 0

# 首次揭开格子时生成地雷，生成点排除点击位置为中心3x3的区域。
$execute if data storage qiq2i_sl:main PlayerData[{UUID:$(UUID),first_click:True}] run function qiq2i_sl:minesweeper/safe_generate_mines with storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}]
$execute if data storage qiq2i_sl:main PlayerData[{UUID:$(UUID),first_click:True}] run data modify storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}].first_click set value False

# 点开的是已经可见的区域
$data modify storage qiq2i_sl:main temp1.point_visible set from storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}].visible[$(y)][$(x)]
execute unless data storage qiq2i_sl:main temp1{point_visible:" "} run return 1

# 点到雷，fail
$data modify storage qiq2i_sl:main temp1.point_board set from storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}].board[$(y)][$(x)]
$execute if data storage qiq2i_sl:main temp1{point_board:-1} run data modify storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}].visible[$(y)][$(x)] set value "*"
$execute if data storage qiq2i_sl:main temp1{point_board:-1} run function qiq2i_sl:minesweeper/fail with storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}]
execute if data storage qiq2i_sl:main temp1{point_board:-1} run return fail

# 点到的格子为中心9格内存在雷，则将该格子转变为可见，并返回True
$execute store result score #temp1_point_board qiq2i_sl_temp1 run data get storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}].board[$(y)][$(x)]
$execute if score #temp1_point_board qiq2i_sl_temp1 matches 0.. run data modify storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}].visible[$(y)][$(x)] set from storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}].board[$(y)][$(x)]
execute if score #temp1_point_board qiq2i_sl_temp1 matches 1.. run return 1

# 点到的格子为中心9格内不存在雷，则将该格子转变为可见，并揭开周围8个格子，并返回True。
$data modify storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}].visible[$(y)][$(x)] set value 0

# 遍历周围一圈，更新$(x) $(y)和temp_x和temp_y后，再执行本函数。
$scoreboard players set #temp1_x_remove_1 qiq2i_sl_temp1 $(x)
scoreboard players remove #temp1_x_remove_1 qiq2i_sl_temp1 1
$scoreboard players set #temp1_x_add_1 qiq2i_sl_temp1 $(x)
scoreboard players add #temp1_x_add_1 qiq2i_sl_temp1 1
$scoreboard players set #temp1_y_remove_1 qiq2i_sl_temp1 $(y)
scoreboard players remove #temp1_y_remove_1 qiq2i_sl_temp1 1
$scoreboard players set #temp1_y_add_1 qiq2i_sl_temp1 $(y)
scoreboard players add #temp1_y_add_1 qiq2i_sl_temp1 1
$execute store result storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}].x_remove_1 int 1 run scoreboard players get #temp1_x_remove_1 qiq2i_sl_temp1
$execute store result storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}].x_add_1 int 1 run scoreboard players get #temp1_x_add_1 qiq2i_sl_temp1
$execute store result storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}].y_remove_1 int 1 run scoreboard players get #temp1_y_remove_1 qiq2i_sl_temp1
$execute store result storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}].y_add_1 int 1 run scoreboard players get #temp1_y_add_1 qiq2i_sl_temp1
$function qiq2i_sl:minesweeper/reveal/cycle with storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}]
return 1