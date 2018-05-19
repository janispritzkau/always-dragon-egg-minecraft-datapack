execute as @e[type=ender_dragon,tag=!is_tracked] at @s run summon armor_stand ~ ~ ~ {Tags:["dragon_tracker"],Marker:true,Invisible:true,NoGravity:true}
tag @e[type=ender_dragon,tag=!is_tracked] add is_tracked

execute as @e[tag=is_tracked] at @s run tp @e[tag=dragon_tracker,sort=nearest,limit=1] @s
execute as @e[tag=dragon_tracker] at @s unless entity @e[type=ender_dragon,distance=0..10] run tag @s add dead

execute as @e[tag=dragon_tracker,tag=dead] run scoreboard players set wait_portal_reset value 1
execute as @e[tag=dragon_tracker,tag=dead] in the_end run function dragon_egg:generate

# use barrier block to check when portal has been reset after dragon death
execute as @e[tag=dragon_tracker,tag=dead] in the_end run setblock 0 80 0 barrier

execute if score wait_portal_reset value matches 1.. in the_end if block 0 80 0 air run scoreboard players set wait_portal_reset value -1
execute if score wait_portal_reset value matches 1.. run scoreboard players add wait_portal_reset value 1

# wait until the dragon death animation is over
execute if score wait_portal_reset value matches 240.. in the_end run setblock 0 80 0 air
execute if score wait_portal_reset value matches 240.. run scoreboard players set wait_portal_reset value 0

execute if score wait_portal_reset value matches -1 in the_end run function dragon_egg:generate
execute if score wait_portal_reset value matches -1 run scoreboard players set wait_portal_reset value 0

kill @e[tag=dragon_tracker,tag=dead]
