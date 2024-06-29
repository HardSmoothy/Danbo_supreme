# 関数返答
# 0: エラー (保存・取り出しできなかった)
# 1: 通常終了A (アイテムを保存)
# 2: 通常終了B (アイテムを取り出し)
# スニークで1st保存/通常ならアイテムを1st取り出し
execute if score @s sneek_time matches 1.. run execute store result score @s calcs_temp run clear @s #oak_logs 0
execute if score @s sneek_time matches 1.. run execute if score @s calcs_temp matches ..63 run return 0
execute if score @s sneek_time matches 1.. run scoreboard players add @s strstc_storedata_oak 1
execute if score @s sneek_time matches 1.. run clear @s #oak_logs 64
execute if score @s sneek_time matches 1.. run tellraw @s ["",{"text":"- "},{"text":"オークの原木を 1st 保存しました | Your 64x oak is stored ","color":"yellow"},{"text":"\n- "},{"text":"Oak Store: ","color":"gray"},{"score":{"name":"@s","objective":"strstc_storedata_oak"},"color":"white"},{"text":"x64 ( ","color":"gray"},{"text":"+ 1 x64","color":"green"},{"text":" )","color":"gray"}]
execute if score @s sneek_time matches 1.. run playsound entity.armor_stand.break player @s ~ ~ ~ 1.0 1.0
execute if score @s sneek_time matches 1.. run return 1

execute if score @s strstc_storedata_xp matches ..0 run tellraw @s ["",{"text":"- "},{"text":"Oak Store: ","color":"gray"},{"text":"0","color":"yellow"},{"text":" ( ","color":"gray"},{"text":"Empty","color":"red"},{"text":" )","color":"gray"},{"text":"\n- ","color":"white"},{"text":"Insufficient stored oak","color":"gold"},{"text":"\n- "},{"text":"オークの原木の在庫がありません","color":"gold"}]
execute if score @s strstc_storedata_xp matches ..0 run return 0
scoreboard players remove @s strstc_storedata_oak 1
tellraw @s ["",{"text":"- "},{"text":"Oak Store: ","color":"gray"},{"score":{"name":"@s","objective":"strstc_storedata_oak"},"color":"white"},{"text":"x64 ( ","color":"gray"},{"text":"- 1x64","color":"red"},{"text":" )","color":"gray"}]
give @s oak_log 64
return 1

