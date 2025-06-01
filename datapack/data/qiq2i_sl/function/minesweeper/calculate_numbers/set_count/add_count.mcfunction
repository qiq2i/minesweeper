# 宏$(width) $(height) $(UUID) $(calculate_numbers_x) $(calculate_numbers_y) $(calculate_numbers_x_dx) $(calculate_numbers_y_dy)
data remove storage qiq2i_sl:main temp1.check_mine
$data modify storage qiq2i_sl:main temp1.check_mine set from storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}].board[$(calculate_numbers_y_dy)][$(calculate_numbers_x_dx)]
execute if data storage qiq2i_sl:main temp1{check_mine:-1} run scoreboard players add #temp_calculate_numbers_count qiq2i_sl_temp1 1