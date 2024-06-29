execute unless data entity @s SelectedItem.tag.SpecialItemIdentify run return 0
execute store result score @s type_detected run data get entity @s SelectedItem.tag.SpecialItemIdentify
return 1