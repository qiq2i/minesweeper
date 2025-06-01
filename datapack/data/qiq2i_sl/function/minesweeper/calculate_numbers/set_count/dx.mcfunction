# 宏$(width) $(height) $(UUID) $(calculate_numbers_x) $(calculate_numbers_y)
scoreboard players set #temp_calculate_numbers_dy qiq2i_sl_temp1 -1
function qiq2i_sl:minesweeper/calculate_numbers/set_count/dy with storage qiq2i_sl:main temp1

# 继续循环？
scoreboard players add #temp_calculate_numbers_dx qiq2i_sl_temp1 1
execute if score #temp_calculate_numbers_dx qiq2i_sl_temp1 matches -1..1 run function qiq2i_sl:minesweeper/calculate_numbers/set_count/dx with storage qiq2i_sl:main temp1