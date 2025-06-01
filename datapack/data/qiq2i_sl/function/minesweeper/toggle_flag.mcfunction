# 传入的存储为 qiq2i_sl:main PlayerData[{UUID:$(UUID)}]
# 宏$(width) $(height) $(total_mines) $(flags_remaining) $(game_over) $(victory) $(mode) $(first_click) $(board) $(visible) $(x) $(y)

$data modify storage qiq2i_sl:main temp1.visible set from storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}].visible[$(y)][$(x)]

$execute if data storage qiq2i_sl:main temp1{visible:"F"} run data modify storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}].visible[$(y)][$(x)] set value " "
$execute if data storage qiq2i_sl:main temp1{visible:" "} run data modify storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}].visible[$(y)][$(x)] set value "F"