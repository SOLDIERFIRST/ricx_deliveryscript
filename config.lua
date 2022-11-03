Config = {}

Config.KeyID = {['key'] = 0xD8F73058, ['name'] = 'U'} -- Add the control and the text name
Config.AtMissionText = "Press "..Config.KeyID['name'].." to start" --says 'Press U to start' default. Change KeyID['name'] to change the control name

----- DELIVERIES -----
-- St Denis
Config.SD = {
	["JobBlipName"] = "Delivery Job", --Blip Name on Map
	["JobBlipSprite"] = -426139257, -- Blip Sprite
	["JobBlipCoords"] = --Mission Start and Map Blip Coords
	{
		["X"] = 2790.46,
		["Y"]= -1421.77, 
		["Z"] = 45.39
	},
	["Reward"] = 4, --Reward Money, change to any int
	["XP"] = 1, --Reward XP, change to any int
	["MissionBlip"] = -984192463, --Blip Sprite for drop position's blip on map
	["MissionBlipName"] = "Deliver here!", --Drop' Blip Name on Map
	["JobName"] = "St. Denis Delivery Job",--Name to display for notification
	["JobStartText"] = 'Job Started!~n~~o~~h~Deliver the package! Check your map!', --Help text after the job started
	["StartTextDuration"] = 3, -- seconds
	["AlreadyInJobText"] = '~e~You have to finish the current~h~~t6~delivery~e~!',--Help text when the player wants to start again the mission after started
	["AlreadyTextDuration"] = 3, -- seconds
	["HasWeaponText"] = '~h~~e~Put your weapon away!',--When the player is not unarmed at starting the job
	["HasWeaponTextDuration"] = 3, -- seconds
	["FailedText"] = '~h~~e~You lost the package!',--Help Text when the player is dead/swimming/climbing/falling
	["FailedTextDuration"] = 3, -- seconds
}
Config.SDProp = { --Delivery box prop
	["PropID"] = `p_chair_crate02x`, --prop hash
	["BoneID"] = 131, --Male bone id
	["PX"] = -0.05, --Male bone X pos
	["PY"] = 0.45,--Male bone Y pos
	["PZ"] = 0.08,--Male bone Z pos
	["PRX"] = 90.0, --Male bone X rotate
	["PRY"] = 90.0,--Male bone Y rotate
	["PRZ"] = 80.0,--Male bone Z rotate
}
Config.SDDELIVERY = {--Deliveries. Easy to add, just get the x,y,z coords and create more positions.
	[1] = {
		["Odds"] = 1.5,--Reward odds
		["CP"] = {x=2831.71, y=-1414.59, z=45.39},--Delivery position
	},
	[2] = {
		["Odds"] = 1.5,
		["CP"] = {x=2822.5, y=-1383.32, z=45.39},
	},
	[3] = {
		["Odds"] = 1.7,
		["CP"] = {x=2861.75, y=-1372.91, z=44.56},
	}
}
-- Blkwtr
Config.BLKWTR = {
	["JobBlipName"] = "Delivery Job", --Blip Name on Map
	["JobBlipSprite"] = -426139257, -- Blip Sprite
	["JobBlipCoords"] = --Mission Start and Map Blip Coords
	{
		["X"] = -860.0,
		["Y"]= -1337.45, 
		["Z"] = 43.48
	},
	["Reward"] = 4, --Reward Money, change to any int
	["XP"] = 1, --Reward XP, change to any int
	["MissionBlip"] = -984192463, --Blip Sprite for drop position's blip on map
	["MissionBlipName"] = "Deliver here!", --Drop' Blip Name on Map
	["JobName"] = "Blackwater Delivery Job",--Name to display for notification
	["JobStartText"] = 'Job Started!~n~~o~~h~Deliver the package! Check your map!', --Help text after the job started
	["StartTextDuration"] = 3, -- seconds
	["AlreadyInJobText"] = '~e~You have to finish the current~h~~t6~delivery~e~!',--Help text when the player wants to start again the mission after started
	["AlreadyTextDuration"] = 3, -- seconds
	["HasWeaponText"] = '~h~~e~Put your weapon away!',--When the player is not unarmed at starting the job
	["HasWeaponTextDuration"] = 3, -- seconds
	["FailedText"] = '~h~~e~You lost the package!',--Help Text when the player is dead/swimming/climbing/falling
	["FailedTextDuration"] = 3, -- seconds
}
Config.BLKWTRProp = { --Delivery box prop
	["PropID"] = `p_chair_crate02x`, --prop hash
	["BoneID"] = 131, --Male bone id
	["PX"] = -0.05, --Male bone X pos
	["PY"] = 0.45,--Male bone Y pos
	["PZ"] = 0.08,--Male bone Z pos
	["PRX"] = 90.0, --Male bone X rotate
	["PRY"] = 90.0,--Male bone Y rotate
	["PRZ"] = 80.0,--Male bone Z rotate
}
Config.BLKWTRDELIVERY = {--Deliveries. Easy to add, just get the x,y,z coords and create more positions.
	[1] = {
		["Odds"] = 1.5,--Reward odds
		["CP"] = {x=-819.38, y=-1328.02, z=43.72},--Delivery position
	},
	[2] = {
		["Odds"] = 1.5,
		["CP"] = {x=-781.19, y=-1321.57, z=43.93},
	},
	[3] = {
		["Odds"] = 1.7,
		["CP"] = {x=-755.98, y=-1282.85, z=43.72},
	}
}
-- Valentine
Config.VAL = {
	["JobBlipName"] = "Delivery Job", --Blip Name on Map
	["JobBlipSprite"] = -426139257, -- Blip Sprite
	["JobBlipCoords"] = --Mission Start and Map Blip Coords
	{
		["X"] = -235.16,
		["Y"]= 747.69, 
		["Z"] = 117.79
	},
	["Reward"] = 4, --Reward Money, change to any int
	["XP"] = 1, --Reward XP, change to any int
	["MissionBlip"] = -984192463, --Blip Sprite for drop position's blip on map
	["MissionBlipName"] = "Deliver here!", --Drop' Blip Name on Map
	["JobName"] = "Valentine Delivery Job",--Name to display for notification
	["JobStartText"] = 'Job Started!~n~~o~~h~Deliver the package! Check your map!', --Help text after the job started
	["StartTextDuration"] = 3, -- seconds
	["AlreadyInJobText"] = '~e~You have to finish the current~h~~t6~delivery~e~!',--Help text when the player wants to start again the mission after started
	["AlreadyTextDuration"] = 3, -- seconds
	["HasWeaponText"] = '~h~~e~Put your weapon away!',--When the player is not unarmed at starting the job
	["HasWeaponTextDuration"] = 3, -- seconds
	["FailedText"] = '~h~~e~You lost the package!',--Help Text when the player is dead/swimming/climbing/falling
	["FailedTextDuration"] = 3, -- seconds
}
Config.VALProp = { --Delivery box prop
	["PropID"] = `p_chair_crate02x`, --prop hash
	["BoneID"] = 131, --Male bone id
	["PX"] = -0.05, --Male bone X pos
	["PY"] = 0.45,--Male bone Y pos
	["PZ"] = 0.08,--Male bone Z pos
	["PRX"] = 90.0, --Male bone X rotate
	["PRY"] = 90.0,--Male bone Y rotate
	["PRZ"] = 80.0,--Male bone Z rotate
}
Config.VALDELIVERY = {--Deliveries. Easy to add, just get the x,y,z coords and create more positions.
	[1] = {
		["Odds"] = 1.5,--Reward odds
		["CP"] = {x=-279.08, y=775.44, z=118.89},--Delivery position
	},
	[2] = {
		["Odds"] = 1.5,
		["CP"] = {x=-321.22, y=806.36, z=117.93},
	},
	[3] = {
		["Odds"] = 1.7,
		["CP"] = {x=-237.87, y=772.93, z=117.89},
	}
}
-- Tumbleweed
Config.TUM = {
	["JobBlipName"] = "Delivery Job", --Blip Name on Map
	["JobBlipSprite"] = -426139257, -- Blip Sprite
	["JobBlipCoords"] = --Mission Start and Map Blip Coords
	{
		["X"] = -5531.1,
		["Y"]= -2943.17, 
		["Z"] = -1.66
	},
	["Reward"] = 4, --Reward Money, change to any int
	["XP"] = 1, --Reward XP, change to any int
	["MissionBlip"] = -984192463, --Blip Sprite for drop position's blip on map
	["MissionBlipName"] = "Deliver here!", --Drop' Blip Name on Map
	["JobName"] = "Tumbleweed Delivery Job",--Name to display for notification
	["JobStartText"] = 'Job Started!~n~~o~~h~Deliver the package! Check your map!', --Help text after the job started
	["StartTextDuration"] = 3, -- seconds
	["AlreadyInJobText"] = '~e~You have to finish the current~h~~t6~delivery~e~!',--Help text when the player wants to start again the mission after started
	["AlreadyTextDuration"] = 3, -- seconds
	["HasWeaponText"] = '~h~~e~Put your weapon away!',--When the player is not unarmed at starting the job
	["HasWeaponTextDuration"] = 3, -- seconds
	["FailedText"] = '~h~~e~You lost the package!',--Help Text when the player is dead/swimming/climbing/falling
	["FailedTextDuration"] = 3, -- seconds
}
Config.TUMProp = { --Delivery box prop
	["PropID"] = `p_chair_crate02x`, --prop hash
	["BoneID"] = 131, --Male bone id
	["PX"] = -0.05, --Male bone X pos
	["PY"] = 0.45,--Male bone Y pos
	["PZ"] = 0.08,--Male bone Z pos
	["PRX"] = 90.0, --Male bone X rotate
	["PRY"] = 90.0,--Male bone Y rotate
	["PRZ"] = 80.0,--Male bone Z rotate
}
Config.TUMDELIVERY = {--Deliveries. Easy to add, just get the x,y,z coords and create more positions.
	[1] = {
		["Odds"] = 1.5,--Reward odds
		["CP"] = {x=-5515.24, y=-2899.58, z=-2.5},--Delivery position
	},
	[2] = {
		["Odds"] = 1.5,
		["CP"] = {x=-5509.0, y=-2967.35, z=-0.58},
	},
	[3] = {
		["Odds"] = 1.7,
		["CP"] = {x=-5508.27, y=-2944.88, z=-1.83},
	}
}

-- Armadillo
Config.ARM = {
	["JobBlipName"] = "Delivery Job", --Blip Name on Map
	["JobBlipSprite"] = -426139257, -- Blip Sprite
	["JobBlipCoords"] = --Mission Start and Map Blip Coords
	{
		["X"] = -3733.93,
		["Y"]= -2597.95, 
		["Z"] = -12.88
	},
	["Reward"] = 4, --Reward Money, change to any int
	["XP"] = 1, --Reward XP, change to any int
	["MissionBlip"] = -984192463, --Blip Sprite for drop position's blip on map
	["MissionBlipName"] = "Deliver here!", --Drop' Blip Name on Map
	["JobName"] = "Armadillo Delivery Job",--Name to display for notification
	["JobStartText"] = 'Job Started!~n~~o~~h~Deliver the package! Check your map!', --Help text after the job started
	["StartTextDuration"] = 3, -- seconds
	["AlreadyInJobText"] = '~e~You have to finish the current~h~~t6~delivery~e~!',--Help text when the player wants to start again the mission after started
	["AlreadyTextDuration"] = 3, -- seconds
	["HasWeaponText"] = '~h~~e~Put your weapon away!',--When the player is not unarmed at starting the job
	["HasWeaponTextDuration"] = 3, -- seconds
	["FailedText"] = '~h~~e~You lost the package!',--Help Text when the player is dead/swimming/climbing/falling
	["FailedTextDuration"] = 3, -- seconds
}
Config.ARMProp = { --Delivery box prop
	["PropID"] = `p_chair_crate02x`, --prop hash
	["BoneID"] = 131, --Male bone id
	["PX"] = -0.05, --Male bone X pos
	["PY"] = 0.45,--Male bone Y pos
	["PZ"] = 0.08,--Male bone Z pos
	["PRX"] = 90.0, --Male bone X rotate
	["PRY"] = 90.0,--Male bone Y rotate
	["PRZ"] = 80.0,--Male bone Z rotate
}
Config.ARMDELIVERY = {--Deliveries. Easy to add, just get the x,y,z coords and create more positions.
	[1] = {
		["Odds"] = 1.5,--Reward odds
		["CP"] = {x=-3698.14, y=-2589.44, z=-13.27},--Delivery position
	},
	[2] = {
		["Odds"] = 1.5,
		["CP"] = {x=-3686.04, y=-2626.3, z=-13.38},
	},
	[3] = {
		["Odds"] = 1.7,
		["CP"] = {x=-3727.11, y=-2617.89, z=-13.23},
	}
}

-- Annesburg
Config.ANN = {
	["JobBlipName"] = "Delivery Job", --Blip Name on Map
	["JobBlipSprite"] = -426139257, -- Blip Sprite
	["JobBlipCoords"] = --Mission Start and Map Blip Coords
	{
		["X"] = 2939.46,
		["Y"]= 1289.02, 
		["Z"] = 44.7
	},
	["Reward"] = 4, --Reward Money, change to any int
	["XP"] = 1, --Reward XP, change to any int
	["MissionBlip"] = -984192463, --Blip Sprite for drop position's blip on map
	["MissionBlipName"] = "Deliver here!", --Drop' Blip Name on Map
	["JobName"] = "Annesburg Delivery Job",--Name to display for notification
	["JobStartText"] = 'Job Started!~n~~o~~h~Deliver the package! Check your map!', --Help text after the job started
	["StartTextDuration"] = 3, -- seconds
	["AlreadyInJobText"] = '~e~You have to finish the current~h~~t6~delivery~e~!',--Help text when the player wants to start again the mission after started
	["AlreadyTextDuration"] = 3, -- seconds
	["HasWeaponText"] = '~h~~e~Put your weapon away!',--When the player is not unarmed at starting the job
	["HasWeaponTextDuration"] = 3, -- seconds
	["FailedText"] = '~h~~e~You lost the package!',--Help Text when the player is dead/swimming/climbing/falling
	["FailedTextDuration"] = 3, -- seconds
}
Config.ANNProp = { --Delivery box prop
	["PropID"] = `p_chair_crate02x`, --prop hash
	["BoneID"] = 131, --Male bone id
	["PX"] = -0.05, --Male bone X pos
	["PY"] = 0.45,--Male bone Y pos
	["PZ"] = 0.08,--Male bone Z pos
	["PRX"] = 90.0, --Male bone X rotate
	["PRY"] = 90.0,--Male bone Y rotate
	["PRZ"] = 80.0,--Male bone Z rotate
}
Config.ANNDELIVERY = {--Deliveries. Easy to add, just get the x,y,z coords and create more positions.
	[1] = {
		["Odds"] = 1.5,--Reward odds
		["CP"] = {x=2949.74, y=1321.69, z=44.87},--Delivery position
	},
	[2] = {
		["Odds"] = 1.5,
		["CP"] = {x=2932.04, y=1372.15, z=44.48},
	},
	[3] = {
		["Odds"] = 1.7,
		["CP"] = {x=2936.29, y=1301.09, z=44.56},
	}
}

-- Rhodes
Config.RH = {
	["JobBlipName"] = "Delivery Job", --Blip Name on Map
	["JobBlipSprite"] = -426139257, -- Blip Sprite
	["JobBlipCoords"] = --Mission Start and Map Blip Coords
	{
		["X"] = 1257.55,
		["Y"]= -1326.73, 
		["Z"] = 76.94
	},
	["Reward"] = 4, --Reward Money, change to any int
	["XP"] = 1, --Reward XP, change to any int
	["MissionBlip"] = -984192463, --Blip Sprite for drop position's blip on map
	["MissionBlipName"] = "Deliver here!", --Drop' Blip Name on Map
	["JobName"] = "Rhodes Delivery Job",--Name to display for notification
	["JobStartText"] = 'Job Started!~n~~o~~h~Deliver the package! Check your map!', --Help text after the job started
	["StartTextDuration"] = 3, -- seconds
	["AlreadyInJobText"] = '~e~You have to finish the current~h~~t6~delivery~e~!',--Help text when the player wants to start again the mission after started
	["AlreadyTextDuration"] = 3, -- seconds
	["HasWeaponText"] = '~h~~e~Put your weapon away!',--When the player is not unarmed at starting the job
	["HasWeaponTextDuration"] = 3, -- seconds
	["FailedText"] = '~h~~e~You lost the package!',--Help Text when the player is dead/swimming/climbing/falling
	["FailedTextDuration"] = 3, -- seconds
}
Config.RHProp = { --Delivery box prop
	["PropID"] = `p_chair_crate02x`, --prop hash
	["BoneID"] = 131, --Male bone id
	["PX"] = -0.05, --Male bone X pos
	["PY"] = 0.45,--Male bone Y pos
	["PZ"] = 0.08,--Male bone Z pos
	["PRX"] = 90.0, --Male bone X rotate
	["PRY"] = 90.0,--Male bone Y rotate
	["PRZ"] = 80.0,--Male bone Z rotate
}
Config.RHDELIVERY = {--Deliveries. Easy to add, just get the x,y,z coords and create more positions.
	[1] = {
		["Odds"] = 1.5,--Reward odds
		["CP"] = {x=1326.74, y=-1283.96, z=76.72},--Delivery position
	},
	[2] = {
		["Odds"] = 1.5,
		["CP"] = {x=1326.1, y=-1320.44, z=77.94},
	},
	[3] = {
		["Odds"] = 1.7,
		["CP"] = {x=1331.44, y=-1319.39, z=78.0},
	}
}

-- Strawberry
Config.STR = {
	["JobBlipName"] = "Delivery Job", --Blip Name on Map
	["JobBlipSprite"] = -426139257, -- Blip Sprite
	["JobBlipCoords"] = --Mission Start and Map Blip Coords
	{
		["X"] = -1766.8,
		["Y"]= -381.89, 
		["Z"] = 157.78
	},
	["Reward"] = 4, --Reward Money, change to any int
	["XP"] = 1, --Reward XP, change to any int
	["MissionBlip"] = -984192463, --Blip Sprite for drop position's blip on map
	["MissionBlipName"] = "Deliver here!", --Drop' Blip Name on Map
	["JobName"] = "Strawberry Delivery Job",--Name to display for notification
	["JobStartText"] = 'Job Started!~n~~o~~h~Deliver the package! Check your map!', --Help text after the job started
	["StartTextDuration"] = 3, -- seconds
	["AlreadyInJobText"] = '~e~You have to finish the current~h~~t6~delivery~e~!',--Help text when the player wants to start again the mission after started
	["AlreadyTextDuration"] = 3, -- seconds
	["HasWeaponText"] = '~h~~e~Put your weapon away!',--When the player is not unarmed at starting the job
	["HasWeaponTextDuration"] = 3, -- seconds
	["FailedText"] = '~h~~e~You lost the package!',--Help Text when the player is dead/swimming/climbing/falling
	["FailedTextDuration"] = 3, -- seconds
}
Config.STRProp = { --Delivery box prop
	["PropID"] = `p_chair_crate02x`, --prop hash
	["BoneID"] = 131, --Male bone id
	["PX"] = -0.05, --Male bone X pos
	["PY"] = 0.45,--Male bone Y pos
	["PZ"] = 0.08,--Male bone Z pos
	["PRX"] = 90.0, --Male bone X rotate
	["PRY"] = 90.0,--Male bone Y rotate
	["PRZ"] = 80.0,--Male bone Z rotate
}
Config.STRDELIVERY = {--Deliveries. Easy to add, just get the x,y,z coords and create more positions.
	[1] = {
		["Odds"] = 1.5,--Reward odds
		["CP"] = {x=-1820.71, y=-376.74, z=162.85},--Delivery position
	},
	[2] = {
		["Odds"] = 1.5,
		["CP"] = {x=-1793.2, y=-382.66, z=160.38},
	},
	[3] = {
		["Odds"] = 1.7,
		["CP"] = {x=-1751.08, y=-393.07, z=156.32},
	}
}
