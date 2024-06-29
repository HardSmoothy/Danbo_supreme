##
 # reset.mcfunction
 # util
 #
 # Created by HardSmoothy_MC.
##

# 計算用
scoreboard objectives add calcs_temp dummy

# 検知用一括
scoreboard objectives add carrot_detect used:carrot_on_a_stick
scoreboard objectives add fungus_detect used:warped_fungus_on_a_stick
scoreboard objectives add type_detected dummy
scoreboard objectives add sneek_time custom:sneak_time

# ストアスティック用 SToRe STiCks
scoreboard objectives add strstc_xp level
scoreboard objectives add strstc_storedata_xp dummy
scoreboard objectives add strstc_storedata_wheet dummy
scoreboard objectives add strstc_storedata_cobble dummy
scoreboard objectives add strstc_storedata_oak dummy

# 列車用 CoSmo TRaiNS
scoreboard objectives add cstrns_countdown dummy
scoreboard objectives add cstrns_desitination dummy