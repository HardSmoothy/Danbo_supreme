# 関数返答
# 0: エラー (保存・取り出しできなかった)
# 1: 通常終了A (XPを保存)
# 2: 通常終了B (XPを取り出し)
# スニークでXP全保存/通常ならXPを1レベル取り出し
execute if score @s sneek_time matches 1.. run execute store result score @s calcs_temp run xp query @s points
execute if score @s sneek_time matches 1.. run xp set @s 0
execute if score @s sneek_time matches 1.. run scoreboard players operation @s strstc_storedata_xp += @s calcs_temp
execute if score @s sneek_time matches 1.. run tellraw @s ["",{"text":"- "},{"text":"経験値を保存しました | Your all exp is stored ","color":"yellow"},{"text":"\n- "},{"text":"XP Store: ","color":"gray"},{"score":{"name":"@s","objective":"strstc_storedata_xp"},"color":"white"},{"text":" ( ","color":"gray"},{"text":"+","color":"green"},{"score":{"name":"@s","objective":"calcs_temp"},"color":"green"},{"text":" )","color":"gray"}]
execute if score @s sneek_time matches 1.. run playsound entity.armor_stand.break player @s ~ ~ ~ 1.0 1.0
execute if score @s sneek_time matches 1.. run return 1

# 必要経験値の計算
scoreboard players operation @s calcs_temp = @s strstc_xp
# 0～15 Lv では Lv*2 + 7 で計算可能
execute if score @s strstc_xp matches 0..15 run scoreboard players operation @s calcs_temp *= 2 calcs_temp
execute if score @s strstc_xp matches 0..15 run scoreboard players add @s calcs_temp 7
# 16～30 Lv では Lv*5 - 6 で計算可能
execute if score @s strstc_xp matches 16..30 run scoreboard players operation @s calcs_temp *= 5 calcs_temp
execute if score @s strstc_xp matches 16..30 run scoreboard players remove @s calcs_temp 6
# 31 Lv 以上では Lv*9 - 158 で計算可能
execute if score @s strstc_xp matches 31..79 run scoreboard players operation @s calcs_temp *= 9 calcs_temp
execute if score @s strstc_xp matches 31..79 run scoreboard players remove @s calcs_temp 158

# 80以上はやりませーん
execute if score @s strstc_xp matches 80.. run tellraw @s ["",{"text":"- "},{"text":"XP Store: ","color":"gray"},{"score":{"name":"@s","objective":"strstc_storedata_xp"},"color":"green"},{"text":" \n- ","color":"white"},{"text":"Sneek+Use to store XP","color":"yellow"},{"text":" \n- ","color":"white"},{"text":"Sneek+使用キーで経験値を保存できます","color":"yellow"}]
execute if score @s strstc_xp matches 80.. run return 0

# この時点でcalcs_tempには次のレベルへの必要経験値が入っていることになる ...そして唐突にファイル操作が始まる
execute if score @s calcs_temp > @s strstc_storedata_xp run tellraw @s ["",{"text":"- "},{"text":"XP Store: ","color":"gray"},{"text":"0","color":"yellow"},{"text":" ( ","color":"gray"},{"text":"Empty","color":"red"},{"text":" )","color":"gray"},{"text":"\n- ","color":"white"},{"text":"Insufficient stored XP","color":"gold"},{"text":"\n- "},{"text":"保存されたXPがレベル必要分に達していません","color":"gold"}]
execute if score @s calcs_temp > @s strstc_storedata_xp run execute store result storage hardsmoothy xp_temp int 1 run scoreboard players get @s strstc_storedata_xp 
execute if score @s calcs_temp <= @s strstc_storedata_xp run tellraw @s ["",{"text":"- "},{"text":"XP Store: ","color":"gray"},{"score":{"name":"@s","objective":"strstc_storedata_xp"},"color":"white"},{"text":" ( ","color":"gray"},{"text":"-","color":"red"},{"score":{"name":"@s","objective":"calcs_temp"},"color":"red"},{"text":" )","color":"gray"}]
execute if score @s calcs_temp > @s strstc_storedata_xp run execute store result storage hardsmoothy xp_temp int 1 run scoreboard players get @s calcs_temp

# ここからは共通
execute if score @s calcs_temp matches 1.. run function util:func/00/givexp with storage hardsmoothy:xp_temp

# 忘れずお帰りください
data remove storage hardsmoothy xp_temp
playsound entity.player.levelup player @s ~ ~ ~ 0.8 0.7

return 1
# XP補充
# tellraw @s ["",{"text":"- "},{"text":"XP Store: ","color":"gray"},{"score":{"name":"@s","objective":"strstc_storedata_xp"},"color":"white"},{"text":" ( ","color":"gray"},{"text":"-","color":"red"},{"score":{"name":"@s","objective":"calcs_temp"},"color":"red"},{"text":" )","color":"gray"}]

# XP不足
# tellraw @s ["",{"text":"- "},{"text":"XP Store: ","color":"gray"},{"text":"0","color":"yellow"},{"text":" ( ","color":"gray"},{"text":"Empty","color":"red"},{"text":" )","color":"gray"},{"text":"\n- ","color":"white"},{"text":"Insufficient stored XP","color":"gold"},{"text":"\n- "},{"text":"保存されたXPがレベル必要分に達していません","color":"gold"}]

# XP過剰
# tellraw @s ["",{"text":"- "},{"text":"XP Store: ","color":"gray"},{"score":{"name":"@s","objective":"strstc_storedata_xp"},"color":"green"},{"text":" \n- ","color":"white"},{"text":"Sneek+Use to store XP","color":"yellow"},{"text":" \n- ","color":"white"},{"text":"Sneek+使用キーで経験値を保存できます","color":"yellow"}]