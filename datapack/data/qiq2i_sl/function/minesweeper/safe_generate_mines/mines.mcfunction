# 传入的存储为 qiq2i_sl:main PlayerData[{UUID:$(UUID)}]
# 宏$(width) $(height) $(total_mines) $(flags_remaining) $(game_over) $(victory) $(mode) $(first_click) $(board) $(visible)
# 计分板qiq2i_sl_temp1的 #temp_x 和 #temp_y 为格子坐标
data modify storage qiq2i_sl:main temp1.mine_x set from entity @s data.x
data modify storage qiq2i_sl:main temp1.mine_y set from entity @s data.y
$data modify storage qiq2i_sl:main temp1.UUID set value $(UUID)
#tellraw @a [{storage:"qiq2i_sl:main",nbt:"temp1.mine_x"},",",{storage:"qiq2i_sl:main",nbt:"temp1.mine_y"}]
function qiq2i_sl:minesweeper/safe_generate_mines/mines/board_set with storage qiq2i_sl:main temp1