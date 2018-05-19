execute if block ~ ~-1 ~ bedrock run kill @s
execute at @s unless entity @s[x=0,y=0,z=0,dy=128] run kill @s
execute at @s unless entity @s[x=0,y=0,z=0,dy=128] run tag @s add dead

execute if block ~ ~-1 ~ bedrock run setblock ~ ~ ~ dragon_egg
tp @s ~ ~-1 ~

# recursivly to one down and check if there is an bedrock block under armor stand
execute if entity @s[tag=!dead] at @s unless block ~ ~ ~ bedrock run function dragon_egg:check
