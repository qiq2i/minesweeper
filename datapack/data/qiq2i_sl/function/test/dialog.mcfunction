data modify storage qiq2i_sl:test dialogs.dialog set value {\
    type:"minecraft:multi_action", \
    title:"§e主将降临", \
    "columns":10,\
    "actions":[\
        {\
            "label":"1",\
            "width":20,\
            "on_click": {\
                "action": "run_command",\
                "command": "me 233"\
            }\
        },\
        {\
            "label":"hahahahahahaha",\
            "width":20,\
            "on_click": {\
                "action": "run_command",\
                "command": "me 233"\
            }\
        },\
    ]\
}

function qiq2i_sl:test/dialog_show with storage qiq2i_sl:test dialogs