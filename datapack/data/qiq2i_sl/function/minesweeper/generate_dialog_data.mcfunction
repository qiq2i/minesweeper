# 生成符合Minecraft dialog格式的存储数据
# 传入的存储为 qiq2i_sl:main PlayerData[{UUID:$(UUID)}]
# 宏$(width) $(height) $(total_mines) $(flags_remaining) $(game_over) $(victory) $(mode) $(first_click) $(board) $(visible)
$data modify storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}].dialog set value {\
    "type": "minecraft:multi_action",\
    "after_action": "wait_for_response",\
    "pause": false,\
    "title": "§e§l扫雷游戏 §c§l总雷数$(total_mines) §f§l模式: $(mode)",\
    "columns": 10,\
    "actions": []\
}

scoreboard players set #temp_y qiq2i_sl_temp1 0
$function qiq2i_sl:minesweeper/generate_dialog_data/y with storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}]

# 切换标雷与扫雷
$execute if data storage qiq2i_sl:main PlayerData[{UUID:$(UUID),mode:"dig"}] run data modify storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}].dialog.actions append value {\
    "label": "§e§l扫雷模式",\
    "width": 80,\
    "action": {\
        "type": "run_command",\
        "command": "trigger qiq2i_sl_trigger set 1"\
    }\
}
$execute if data storage qiq2i_sl:main PlayerData[{UUID:$(UUID),mode:"flag"}] run data modify storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}].dialog.actions append value {\
    "label": "§f§l标雷模式",\
    "width": 80,\
    "action": {\
        "type": "run_command",\
        "command": "trigger qiq2i_sl_trigger set 2"\
    }\
}

$data modify storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}].dialog.actions append value {\
    "label": "§b§l重置游戏",\
    "width": 80,\
    "action": {\
        "type": "run_command",\
        "command": "trigger qiq2i_sl_trigger set 3"\
    }\
}