# Initialise scoreboards
scoreboard objectives add deathcount deathCount
scoreboard objectives add livesleft dummy "Lives"
scoreboard objectives setdisplay list livesleft
scoreboard objectives setdisplay belowName livesleft

# Initialise teams
# placeholder

# Add new players
title @a[tag=!added] title {"text":"You now have 10 lives left","color":"yellow"}
scoreboard players set @a[tag=!added] livesleft 10
tag @a[tag=!added] add added

# Calculate number of lives after deaths
execute as @a[scores={deathcount=1..}] run scoreboard players remove @a[scores={deathcount=1..}] livesleft 1
scoreboard players set @a[scores={deathcount=1..}] deathcount 0

# Tell players how many lives they have left
title @a[scores={livesleft=10}] actionbar [{"text":"You have "},{"text":"10","bold":true},{"text":" lives left"}]
title @a[scores={livesleft=9}] actionbar [{"text":"You have "},{"text":"9","bold":true},{"text":" lives left"}]
title @a[scores={livesleft=8}] actionbar [{"text":"You have "},{"text":"8","bold":true},{"text":" lives left"}]
title @a[scores={livesleft=7}] actionbar [{"text":"You have "},{"text":"7","bold":true},{"text":" lives left"}]
title @a[scores={livesleft=6}] actionbar [{"text":"You have "},{"text":"6","bold":true},{"text":" lives left"}]
title @a[scores={livesleft=5}] actionbar [{"text":"You have "},{"text":"5","bold":true},{"text":" lives left"}]
title @a[scores={livesleft=4}] actionbar [{"text":"You have "},{"text":"4","bold":true},{"text":" lives left"}]
title @a[scores={livesleft=3}] actionbar [{"text":"You have "},{"text":"3","bold":true},{"text":" lives left"}]
title @a[scores={livesleft=2}] actionbar [{"text":"You have "},{"text":"2","bold":true},{"text":" lives left"}]
title @a[scores={livesleft=1}] actionbar [{"text":"You have "},{"text":"1","bold":true},{"text":" life left"}]
title @a[scores={livesleft=0}] actionbar {"text":"You are dead, so you are now a ghost."}

# Put dead people in spectator mode
execute as @a[scores={livesleft=0}] run gamemode spectator @a[scores={livesleft=0}]