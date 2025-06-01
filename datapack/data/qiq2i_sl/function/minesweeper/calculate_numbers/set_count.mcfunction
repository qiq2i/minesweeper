# 宏$(width) $(height) $(UUID) $(calculate_numbers_x) $(calculate_numbers_y)

# 若是地雷则不算了
$data modify storage qiq2i_sl:main temp1.calculate_numbers_board set from storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}].board[$(calculate_numbers_y)][$(calculate_numbers_x)]
execute if data storage qiq2i_sl:main temp1{calculate_numbers_board:-1} run return 1
#$me $(calculate_numbers_x) $(calculate_numbers_y)
# 统计雷
scoreboard players set #temp_calculate_numbers_count qiq2i_sl_temp1 0
scoreboard players set #temp_calculate_numbers_dx qiq2i_sl_temp1 -1
function qiq2i_sl:minesweeper/calculate_numbers/set_count/dx with storage qiq2i_sl:main temp1
execute store result storage qiq2i_sl:main temp1.calculate_numbers_count int 1 run scoreboard players get #temp_calculate_numbers_count qiq2i_sl_temp1
$data modify storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}].board[$(calculate_numbers_y)][$(calculate_numbers_x)] set from storage qiq2i_sl:main temp1.calculate_numbers_count