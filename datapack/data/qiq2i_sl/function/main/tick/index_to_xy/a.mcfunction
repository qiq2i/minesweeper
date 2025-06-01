# 传入的存储为 qiq2i_sl:main PlayerData[{UUID:$(UUID)}]
# 宏$(width) $(height) $(total_mines) $(flags_remaining) $(game_over) $(victory) $(mode) $(first_click) $(board) $(visible)
$execute if score #temp1 qiq2i_sl_temp1 matches $(width).. run scoreboard players add #temp_y qiq2i_sl_temp1 1
$execute if score #temp1 qiq2i_sl_temp1 matches $(width).. run scoreboard players remove #temp1 qiq2i_sl_temp1 $(width)
$execute if score #temp1 qiq2i_sl_temp1 matches $(width).. run function qiq2i_sl:main/tick/index_to_xy/a with storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}]