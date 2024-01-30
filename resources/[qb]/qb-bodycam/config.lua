Config = {}

Config.webhook = "https://discord.com/api/webhooks/1177696435697885224/O3tG2-EtGOMaJQfGlv0QFh5zxDyF2e8_84My2-Mx3HLWKc92dRUcu9bOgs_vlXHIKe0X" --Your webhook address for the discord channel where the Bodycam recordings will be sent
 
Config.resolutions = "1080" -- or "1080p" , "480p" , "360p" /  Image quality of the video to be recorded.

Config.timeout = 30000 -- In milliseconds, the amount of seconds the video will be divided so that it does not exceed the Discord loading size

Config.bodycamitem = "bodycam" -- The name of the item you will use my body for
 
Config.command = "" --If you want to use a command key instead of the item, enter a command key , else = ""

Config.openui = "bcrecords" --Command to open the user interface to view recordings

Config.jobs = {"police" , "sheriff"}

Config.boss = "Chief of Police" -- The rank in which you will be authorized to delete records
