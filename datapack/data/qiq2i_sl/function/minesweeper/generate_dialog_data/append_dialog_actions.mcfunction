# 传入的存储为  with storage qiq2i_sl:main temp1
# 宏$(UUID) $(cell_index_1000) $(label)
$data modify storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}].dialog.actions append value {\
    "label": "$(label)",\
    "width": 20,\
    "action": {\
        "type": "run_command",\
        "command": "trigger qiq2i_sl_trigger set $(cell_index_1000)"\
    }\
}