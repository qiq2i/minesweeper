# 传入的存储为 qiq2i_sl:main PlayerData[{UUID:$(UUID)}]
# 宏$(width) $(height) $(total_mines) $(flags_remaining) $(game_over) $(victory) $(mode) $(first_click) $(board) $(visible)

# 玩家扫雷的具体坐标转化
scoreboard players set #temp_x qiq2i_sl_temp1 0
scoreboard players set #temp_y qiq2i_sl_temp1 0
scoreboard players operation #temp1 qiq2i_sl_temp1 = @s qiq2i_sl_trigger
scoreboard players remove #temp1 qiq2i_sl_temp1 1000

$function qiq2i_sl:main/tick/index_to_xy/a with storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}]
scoreboard players operation #temp_x qiq2i_sl_temp1 = #temp1 qiq2i_sl_temp1
tellraw @s [{score:{name:"#temp_x", objective:"qiq2i_sl_temp1"}}, ",", {score:{name:"#temp_y", objective:"qiq2i_sl_temp1"}}]

# temp_x temp_y
$execute store result storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}].x int 1 run scoreboard players get #temp_x qiq2i_sl_temp1
$execute store result storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}].y int 1 run scoreboard players get #temp_y qiq2i_sl_temp1

# 揭开格子
$execute if data storage qiq2i_sl:main PlayerData[{UUID:$(UUID),mode:"dig"}] run function qiq2i_sl:minesweeper/reveal with storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}]

# 标雷模式
$execute if data storage qiq2i_sl:main PlayerData[{UUID:$(UUID),mode:"flag"}] run function qiq2i_sl:minesweeper/toggle_flag with storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}]

