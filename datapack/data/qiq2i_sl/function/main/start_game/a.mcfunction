# 宏 $(UUID)
# 如果没有信息，则初始化
$execute unless data storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}] run function qiq2i_sl:main/player_init

# 给玩家显示dialog
$function qiq2i_sl:minesweeper/print_dialog_data with storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}]