data modify storage qiq2i_sl:main temp1.visible_inside append value ' '
scoreboard players remove #temp1 qiq2i_sl_temp1 1
execute if score #temp1 qiq2i_sl_temp1 matches 1.. run function qiq2i_sl:minesweeper/__init__/visible/a
