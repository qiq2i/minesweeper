$data modify storage qiq2i_sl:main PlayerData[{UUID:$(UUID)}].game_over set value True
execute at @s run playsound minecraft:entity.generic.explode ambient @s ~ ~ ~
#me 点到雷了！