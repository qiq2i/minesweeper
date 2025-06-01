# 玩家执行
# 宏 $(UUID)
$data modify storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}].dialog set value {}
$function qiq2i_sl:minesweeper/generate_dialog_data with storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}]
$function qiq2i_sl:minesweeper/print_dialog_data/dialog with storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}]