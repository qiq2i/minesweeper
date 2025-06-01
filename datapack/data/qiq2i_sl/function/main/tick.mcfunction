# 给予玩家操作权限
scoreboard players enable @a qiq2i_sl_trigger

# 玩家进行了操作！
execute as @a if score @s qiq2i_sl_trigger matches 1.. run function qiq2i_sl:main/tick/a
execute as @a if score @s qiq2i_sl_trigger matches -1 run function qiq2i_sl:main/start_game
execute as @a if score @s qiq2i_sl_trigger matches -1 run scoreboard players reset @s qiq2i_sl_trigger