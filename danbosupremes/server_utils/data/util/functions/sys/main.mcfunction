##
 # main.mcfunction
 # util
 #
 # Created by HardSmoothy_MC.
##

# 1: 使用アイテムの断定
scoreboard players reset @s type_detected
execute as @a at @s run execute if score @s carrot_detect matches 1.. run function util:sys/main_derection_carrot
execute as @a at @s run execute if score @s fungus_detect matches 1.. run function util:sys/main_derection_fungus

# 2: 使用アイテムそれぞれの処理
# Type値
# - 001..010 旧鍛冶キット
# - 011 Cosmotrain目的地変更ロッド
scoreboard players reset @a calcs_temp
execute as @a at @s run execute if score @s type_detected matches 1..10 run function util:func/00_stick_main
execute as @a at @s run execute if score @s type_detected matches 11..20 run function util:func/01_cs_rodswitcher

# 6: リセット
# スニークはここでリセットする
scoreboard players reset @a sneek_time