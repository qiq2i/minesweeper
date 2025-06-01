# 传入的存储为 qiq2i_sl:main PlayerData[{UUID:$(UUID)}]
# 宏$(width) $(height) $(total_mines) $(flags_remaining) $(game_over) $(victory) $(mode) $(first_click) $(board) $(visible)
# 计分板qiq2i_sl_temp1的 #temp_x 和 #temp_y 为格子坐标
execute store result storage qiq2i_sl:main temp1.marker_x int 1 run scoreboard players get #temp_marker_x qiq2i_sl_temp1
execute store result storage qiq2i_sl:main temp1.marker_y int 1 run scoreboard players get #temp_marker_y qiq2i_sl_temp1
execute at @s run function qiq2i_sl:minesweeper/safe_generate_mines/summon_marker with storage qiq2i_sl:main temp1

# 继续循环？
scoreboard players add #temp_marker_x qiq2i_sl_temp1 1
$execute unless score #temp_marker_x qiq2i_sl_temp1 matches $(width).. run function qiq2i_sl:minesweeper/safe_generate_mines/summon_x with storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}]