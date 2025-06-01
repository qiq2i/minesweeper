# 传入的存储为 qiq2i_sl:main PlayerData[{UUID:$(UUID)}]
# 宏$(UUID) $(width) $(height) $(total_mines) $(flags_remaining) $(game_over) $(victory) $(mode) $(first_click) $(board) $(visible)
$scoreboard players set #temp_cell_index qiq2i_sl_temp1 $(width)
scoreboard players operation #temp_cell_index qiq2i_sl_temp1 *= #temp_y qiq2i_sl_temp1
scoreboard players operation #temp_cell_index qiq2i_sl_temp1 += #temp_x qiq2i_sl_temp1
execute store result storage qiq2i_sl:main temp1.cell_index int 1 run scoreboard players get #temp_cell_index qiq2i_sl_temp1

execute store result storage qiq2i_sl:main temp1.x int 1 run scoreboard players get #temp_x qiq2i_sl_temp1 
execute store result storage qiq2i_sl:main temp1.y int 1 run scoreboard players get #temp_y qiq2i_sl_temp1
$data modify storage qiq2i_sl:main temp1.UUID set value $(UUID)
function qiq2i_sl:minesweeper/generate_dialog_data/cell_state with storage qiq2i_sl:main temp1

data modify storage qiq2i_sl:main temp1.label set value " "
execute if data storage qiq2i_sl:main temp1{cell_state:"F"} run data modify storage qiq2i_sl:main temp1.label set value "F"
execute unless data storage qiq2i_sl:main temp1{cell_state:" "} unless data storage qiq2i_sl:main temp1{cell_state:"F"} run function qiq2i_sl:minesweeper/generate_dialog_data/get_color_code
execute if data storage qiq2i_sl:main temp1{cell_state:"*"} run data modify storage qiq2i_sl:main temp1.label set value "§4§lTNT"

scoreboard players set #temp_cell_index_1000 qiq2i_sl_temp1 1000
scoreboard players operation #temp_cell_index_1000 qiq2i_sl_temp1 += #temp_cell_index qiq2i_sl_temp1
execute store result storage qiq2i_sl:main temp1.cell_index_1000 int 1 run scoreboard players get #temp_cell_index_1000 qiq2i_sl_temp1
function qiq2i_sl:minesweeper/generate_dialog_data/append_dialog_actions with storage qiq2i_sl:main temp1

# 继续循环？
scoreboard players add #temp_x qiq2i_sl_temp1 1
$execute unless score #temp_x qiq2i_sl_temp1 matches $(width).. run function qiq2i_sl:minesweeper/generate_dialog_data/x with storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}]