# 関数返答
# 0: エラー (取り出しできなかった)
# 1: 通常終了A (XPを保存)
# 2: 通常終了B (XPを取り出し)
# スニークでXP全保存/通常ならXPを1レベル取り出し
execute if score @s sneek_time matches 1.. run execute store result score @s calcs_temp run xp query @s points
execute if score @s sneek_time matches 1.. run xp set @s 0
execute if score @s sneek_time matches 1.. run scoreboard players operation @s strstc_storedata_xp += @s calcs_temp
execute if score @s sneek_time matches 1.. run tellraw @s ["",{"text":"- "},{"text":"経験値を保存しました | Your all exp is stored ","color":"yellow"},{"text":"\n- "},{"text":"XP Store: ","color":"gray"},{"score":{"name":"@s","objective":"strstc_storedata_xp"},"color":"white"},{"text":" ( ","color":"gray"},{"text":"+","color":"green"},{"score":{"name":"@s","objective":"calcs_temp"},"color":"green"},{"text":" )","color":"gray"}]
execute if score @s sneek_time matches 1.. run return 1

execute if score @s strstc_xp matches 0..15
execute if score @s strstc_xp matches 16..30
execute if score @s strstc_xp matches 31..45

tellraw @s ["",{"text":"- "},{"text":"XP Store: ","color":"gray"},{"score":{"name":"@s","objective":"strstc_storedata_xp"},"color":"white"},{"text":" ( ","color":"gray"},{"text":"-","color":"red"},{"score":{"name":"@s","objective":"culcs_temp"},"color":"red"},{"text":" )","color":"gray"}]
tellraw @s ["",{"text":"- "},{"text":"XP Store: ","color":"gray"},{"text":"0","color":"yellow"},{"text":" ( ","color":"gray"},{"text":"Empty","color":"red"},{"text":" )","color":"gray"},{"text":"\n- "},{"text":"Insufficient stored XP","color":"gold"},{"text":"\n- "},{"text":"保存されたXPがレベル必要分に達していません","color":"gold"}]