# 若玩家没初始化过扫雷，则初始化
$execute unless data storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}] run function qiq2i_sl:main/player_init

# 分数大于1000
$execute if score @s qiq2i_sl_trigger matches 1000.. run function qiq2i_sl:main/tick/b with storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}]

# 分数为1 切换为标雷模式
$execute if score @s qiq2i_sl_trigger matches 1 run data modify storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}].mode set value "flag"

# 分数为2 切换为扫雷模式
$execute if score @s qiq2i_sl_trigger matches 2 run data modify storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}].mode set value "dig"

# dialog
$function qiq2i_sl:minesweeper/print_dialog_data with storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}]
scoreboard players reset @s qiq2i_sl_trigger