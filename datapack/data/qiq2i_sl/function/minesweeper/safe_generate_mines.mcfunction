# 传入的存储为 qiq2i_sl:main PlayerData[{UUID:$(UUID)}]
# 宏$(width) $(height) $(total_mines) $(flags_remaining) $(game_over) $(victory) $(mode) $(first_click) $(board) $(visible)
# 计分板qiq2i_sl_temp1的 #temp_x 和 #temp_y 为格子坐标

# 生成标记marker_total_mines
kill @e[type=marker,tag=qiq2i_ls_marker_mines1]
scoreboard players set #temp_marker_y qiq2i_sl_temp1 0
$function qiq2i_sl:minesweeper/safe_generate_mines/summon_y with storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}]
$execute as @e[type=marker,limit=$(total_mines),sort=random] run function qiq2i_sl:minesweeper/safe_generate_mines/mines with storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}]

# 计算附近地雷的数量
$function qiq2i_sl:minesweeper/calculate_numbers with storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}]