# 传入的存储为 qiq2i_sl:main PlayerData[{UUID:$(UUID)}]
# 宏$(width) $(height) $(total_mines) $(flags_remaining) $(game_over) $(victory) $(mode) $(first_click) $(board) $(visible)

execute store result storage qiq2i_sl:main temp1.calculate_numbers_x int 1 run scoreboard players get #temp_calculate_numbers_x qiq2i_sl_temp1
execute store result storage qiq2i_sl:main temp1.calculate_numbers_y int 1 run scoreboard players get #temp_calculate_numbers_y qiq2i_sl_temp1

$data modify storage qiq2i_sl:main temp1.UUID set value $(UUID)
$data modify storage qiq2i_sl:main temp1.width set value $(width)
$data modify storage qiq2i_sl:main temp1.height set value $(height)
function qiq2i_sl:minesweeper/calculate_numbers/set_count with storage qiq2i_sl:main temp1

# 继续循环？
scoreboard players add #temp_calculate_numbers_x qiq2i_sl_temp1 1
$execute unless score #temp_calculate_numbers_x qiq2i_sl_temp1 matches $(width).. run function qiq2i_sl:minesweeper/calculate_numbers/x with storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}]