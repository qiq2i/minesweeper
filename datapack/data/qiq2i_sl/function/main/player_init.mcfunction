# 初始化玩家扫雷存储
# 执行者为玩家
data remove storage qiq2i_sl:main temp1
data modify storage qiq2i_sl:main temp1.UUID set from entity @s UUID
data modify storage qiq2i_sl:main temp1.width set value 10
data modify storage qiq2i_sl:main temp1.height set value 8
data modify storage qiq2i_sl:main temp1.mines set value 15
function qiq2i_sl:minesweeper/__init__ with storage qiq2i_sl:main temp1