# 宏$(width) $(height) $(UUID) $(calculate_numbers_x) $(calculate_numbers_y)
#tellraw @a [{score:{name:"#temp_calculate_numbers_dx",objective:"qiq2i_sl_temp1"}},",",{score:{name:"#temp_calculate_numbers_dy",objective:"qiq2i_sl_temp1"}}]
$scoreboard players set #temp_calculate_numbers_x+dx qiq2i_sl_temp1 $(calculate_numbers_x)
scoreboard players operation #temp_calculate_numbers_x+dx qiq2i_sl_temp1 += #temp_calculate_numbers_dx qiq2i_sl_temp1
$scoreboard players set #temp_calculate_numbers_y+dy qiq2i_sl_temp1 $(calculate_numbers_y)
scoreboard players operation #temp_calculate_numbers_y+dy qiq2i_sl_temp1 += #temp_calculate_numbers_dy qiq2i_sl_temp1
execute store result storage qiq2i_sl:main temp1.calculate_numbers_x_dx int 1 run scoreboard players get #temp_calculate_numbers_x+dx qiq2i_sl_temp1
execute store result storage qiq2i_sl:main temp1.calculate_numbers_y_dy int 1 run scoreboard players get #temp_calculate_numbers_y+dy qiq2i_sl_temp1

$execute if score #temp_calculate_numbers_x+dx qiq2i_sl_temp1 matches 0..$(width) if score #temp_calculate_numbers_y+dy qiq2i_sl_temp1 matches 0..$(height) run function qiq2i_sl:minesweeper/calculate_numbers/set_count/add_count with storage qiq2i_sl:main temp1

# 继续循环？
scoreboard players add #temp_calculate_numbers_dy qiq2i_sl_temp1 1
execute if score #temp_calculate_numbers_dy qiq2i_sl_temp1 matches -1..1 run function qiq2i_sl:minesweeper/calculate_numbers/set_count/dy with storage qiq2i_sl:main temp1