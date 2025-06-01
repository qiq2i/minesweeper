# 传入的存储为 qiq2i_sl:main PlayerData[{UUID:$(UUID)}]
# 宏$(width) $(height) $(total_mines) $(flags_remaining) $(game_over) $(victory) $(mode) $(first_click) $(board) $(visible) $(x) $(y) $(x_remove_1) $(x_add_1) $(y_remove_1) $(y_add_1)
#$me $(x), $(y) | $(x_remove_1) $(x_add_1) $(y_remove_1) $(y_add_1)
$data modify storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}].x set value $(x_remove_1)
$data modify storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}].y set value $(y_remove_1)
$function qiq2i_sl:minesweeper/reveal with storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}]

$data modify storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}].x set value $(x)
$data modify storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}].y set value $(y_remove_1)
$function qiq2i_sl:minesweeper/reveal with storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}]

$data modify storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}].x set value $(x_add_1)
$data modify storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}].y set value $(y_remove_1)
$function qiq2i_sl:minesweeper/reveal with storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}]

$data modify storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}].x set value $(x_remove_1)
$data modify storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}].y set value $(y)
$function qiq2i_sl:minesweeper/reveal with storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}]

$data modify storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}].x set value $(x_add_1)
$data modify storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}].y set value $(y)
$function qiq2i_sl:minesweeper/reveal with storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}]

$data modify storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}].x set value $(x_remove_1)
$data modify storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}].y set value $(y_add_1)
$function qiq2i_sl:minesweeper/reveal with storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}]

$data modify storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}].x set value $(x)
$data modify storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}].y set value $(y_add_1)
$function qiq2i_sl:minesweeper/reveal with storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}]

$data modify storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}].x set value $(x_add_1)
$data modify storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}].y set value $(y_add_1)
$function qiq2i_sl:minesweeper/reveal with storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}]