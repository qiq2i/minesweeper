# 宏 $(marker_x) $(marker_y)
# 计分板qiq2i_sl_temp1的 #temp_x 和 #temp_y 为格子坐标
# 计分板qiq2i_sl_temp1的 #temp_marker_x 和 #temp_marker_y 为标记坐标
$scoreboard players set #temp_safe_dx qiq2i_sl_temp1 $(marker_x)
$scoreboard players set #temp_safe_dy qiq2i_sl_temp1 $(marker_y)
scoreboard players operation #temp_safe_dx qiq2i_sl_temp1 -= #temp_x qiq2i_sl_temp1
scoreboard players operation #temp_safe_dy qiq2i_sl_temp1 -= #temp_y qiq2i_sl_temp1
#tellraw @s [{score:{name:"#temp_x",objective:"qiq2i_sl_temp1"}},",",{score:{name:"#temp_y",objective:"qiq2i_sl_temp1"}}]
execute if score #temp_safe_dx qiq2i_sl_temp1 matches -1..1 if score #temp_safe_dy qiq2i_sl_temp1 matches -1..1 run return fail
$summon marker ~ ~ ~ {Tags:["qiq2i_ls_marker_mines1"],data:{x:$(marker_x),y:$(marker_y)}}