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
