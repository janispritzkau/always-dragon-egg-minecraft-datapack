
summon armor_stand 0 80 0 {Marker: true, Invisible: True, NoGravity: true}
execute positioned 0 80 0 as @e[type=armor_stand,distance=..1,limit=1] at @s run function dragon_egg:check
