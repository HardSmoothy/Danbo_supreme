attribute @s generic.armor modifier add a0806d2e-2d53-4a43-951b-3920e7a5da5a "dopings" 10 add
attribute @s generic.max_health modifier add aaf98513-35c2-481e-a45a-45e00d77c6bc "dopings" 10 add
attribute @s generic.attack_speed modifier add 8e15d6c6-a2bd-4c56-89e3-42ec24339603 "dopings" 10 add
item replace entity @s weapon.mainhand with air
playsound ui.stonecutter.take_result player @s ~ ~ ~ 0.5 1.4
execute as @s run schedule function util:func/00/undrug 2400t append
