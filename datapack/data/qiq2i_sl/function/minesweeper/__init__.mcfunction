# 初始化扫雷游戏（或者重新开始）
# 执行者为玩家
# 宏 $(UUID),$(width),$(height),$(mines)
$data modify storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}].width set value $(width)
$data modify storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}].height set value $(height)
$data modify storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}].total_mines set value $(mines)
$data modify storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}].flags_remaining set value $(mines)
$data modify storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}].game_over set value False
$data modify storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}].victory set value False
$data modify storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}].mode set value "dig"
$data modify storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}].first_click set value True

$data modify storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}].board set value []
data modify storage qiq2i_sl:main temp1.board_inside set value []
$scoreboard players set #temp1 qiq2i_sl_temp1 $(width)
execute if score #temp1 qiq2i_sl_temp1 matches 1.. run function qiq2i_sl:minesweeper/__init__/board/a
$scoreboard players set #temp1 qiq2i_sl_temp1 $(height)
execute if score #temp1 qiq2i_sl_temp1 matches 1.. run function qiq2i_sl:minesweeper/__init__/board/b with storage qiq2i_sl:main temp1

$data modify storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}].visible set value []
data modify storage qiq2i_sl:main temp1.visible_inside set value []
$scoreboard players set #temp1 qiq2i_sl_temp1 $(width)
execute if score #temp1 qiq2i_sl_temp1 matches 1.. run function qiq2i_sl:minesweeper/__init__/visible/a
$scoreboard players set #temp1 qiq2i_sl_temp1 $(height)
execute if score #temp1 qiq2i_sl_temp1 matches 1.. run function qiq2i_sl:minesweeper/__init__/visible/b with storage qiq2i_sl:main temp1
