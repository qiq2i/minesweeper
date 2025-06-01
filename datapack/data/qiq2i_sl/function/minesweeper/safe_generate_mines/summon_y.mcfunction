# 传入的存储为 qiq2i_sl:main PlayerData[{UUID:$(UUID)}]
# 宏$(width) $(height) $(total_mines) $(flags_remaining) $(game_over) $(victory) $(mode) $(first_click) $(board) $(visible)
# 计分板qiq2i_sl_temp1的 #temp_x 和 #temp_y 为格子坐标
scoreboard players set #temp_marker_x qiq2i_sl_temp1 0
$function qiq2i_sl:minesweeper/safe_generate_mines/summon_x with storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}]

# 继续循环？
scoreboard players add #temp_marker_y qiq2i_sl_temp1 1
$execute unless score #temp_marker_y qiq2i_sl_temp1 matches $(height).. run function qiq2i_sl:minesweeper/safe_generate_mines/summon_y with storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}]