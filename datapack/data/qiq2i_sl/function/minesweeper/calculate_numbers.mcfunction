# 传入的存储为 qiq2i_sl:main PlayerData[{UUID:$(UUID)}]
# 宏$(width) $(height) $(total_mines) $(flags_remaining) $(game_over) $(victory) $(mode) $(first_click) $(board) $(visible)
me calculate_numbers
scoreboard players set #temp_calculate_numbers_y qiq2i_sl_temp1 0
$function qiq2i_sl:minesweeper/calculate_numbers/y with storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}]