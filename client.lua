local IsMission = false
local MissionX,MissionY,MissionZ = nil,nil,nil
local RewardM, RewardXP, RewardO = 0,0,0
local CurrentJobName
local CurrentJobFailedText
local CurrentJobFailedTextDuration
local object1
local MissionObjectModel
local Missionblip
local JobBlips = {
    { name = Config.SD.JobBlipName, sprite = Config.SD.JobBlipSprite, x = Config.SD.JobBlipCoords.X, y = Config.SD.JobBlipCoords.Y, z = Config.SD.JobBlipCoords.Z}, --
    { name = Config.BLKWTR.JobBlipName, sprite = Config.BLKWTR.JobBlipSprite, x = Config.BLKWTR.JobBlipCoords.X, y = Config.BLKWTR.JobBlipCoords.Y, z = Config.BLKWTR.JobBlipCoords.Z}, --
    { name = Config.VAL.JobBlipName, sprite = Config.VAL.JobBlipSprite, x = Config.VAL.JobBlipCoords.X, y = Config.VAL.JobBlipCoords.Y, z = Config.VAL.JobBlipCoords.Z}, --
    { name = Config.TUM.JobBlipName, sprite = Config.TUM.JobBlipSprite, x = Config.TUM.JobBlipCoords.X, y = Config.TUM.JobBlipCoords.Y, z = Config.TUM.JobBlipCoords.Z}, --
    { name = Config.ARM.JobBlipName, sprite = Config.ARM.JobBlipSprite, x = Config.ARM.JobBlipCoords.X, y = Config.ARM.JobBlipCoords.Y, z = Config.ARM.JobBlipCoords.Z}, --
    { name = Config.ANN.JobBlipName, sprite = Config.ANN.JobBlipSprite, x = Config.ANN.JobBlipCoords.X, y = Config.ANN.JobBlipCoords.Y, z = Config.ANN.JobBlipCoords.Z}, --
    { name = Config.RH.JobBlipName, sprite = Config.RH.JobBlipSprite, x = Config.RH.JobBlipCoords.X, y = Config.RH.JobBlipCoords.Y, z = Config.RH.JobBlipCoords.Z}, --
    { name = Config.STR.JobBlipName, sprite = Config.STR.JobBlipSprite, x = Config.STR.JobBlipCoords.X, y = Config.STR.JobBlipCoords.Y, z = Config.STR.JobBlipCoords.Z}, --
}
local playercoords 
local AllBlip = {}

RegisterNetEvent('ricx_deliveryjob_start1') -- st denis
AddEventHandler('ricx_deliveryjob_start1', function()
    local playerPed = PlayerPedId()
    local hasw, playerw = GetCurrentPedWeapon(playerPed,1)
    if playerw == `WEAPON_UNARMED` then
        if not IsPedOnMount(playerPed) then
        if IsMission == false then
            IsMission = true
            local route = math.random(1,#Config.SDDELIVERY)--Create a random int between 1 and the number of added deliveries at Config
            StartGpsMultiRoute(GetHashKey("COLOR_YELLOW"), true, true)
            MissionX,MissionY,MissionZ = Config.SDDELIVERY[route].CP.x, Config.SDDELIVERY[route].CP.y, Config.SDDELIVERY[route].CP.z
            AddPointToGpsMultiRoute(MissionX,MissionY,MissionZ)
            RewardM,RewardXP, RewardO = Config.SD.Reward, Config.SD.XP, Config.SDDELIVERY[route].Odds
            SetGpsMultiRouteRender(true)
            Missionblip = N_0x554d9d53f696d002(1664425300, Config.SDDELIVERY[route].CP.x, Config.SDDELIVERY[route].CP.y, Config.SDDELIVERY[route].CP.z)
            SetBlipCoords(Missionblip, Config.SDDELIVERY[route].CP.x, Config.SDDELIVERY[route].CP.y, Config.SDDELIVERY[route].CP.z)
            SetBlipSprite(Missionblip, Config.SD.MissionBlip, 1)
            SetBlipScale(Missionblip, 0.2)
            Citizen.InvokeNative(0x9CB1A1623062F402, Missionblip, Config.SD.MissionBlipName)
            MissionObjectModel = Config.SDProp.PropID
            RequestModel(MissionObjectModel)
            while not HasModelLoaded(MissionObjectModel) do
                Wait(100)
            end
            RequestAnimDict("amb_wander@code_human_hay_bale_wander@male_a@base")
            while ( not HasAnimDictLoaded( "amb_wander@code_human_hay_bale_wander@male_a@base" ) ) do
                Citizen.Wait( 100 )
            end
            TaskPlayAnim(playerPed, "amb_wander@code_human_hay_bale_wander@male_a@base", "base", 8.0, -8.0, -1, 31, 0, true, 0, false, 0, false)
            local playerCo = GetEntityCoords(playerPed)
            object1 = CreateObject(MissionObjectModel, playerCo.x,playerCo.y,playerCo.z, true, true, true)
            SetEntityAsMissionEntity(object1, true, false)
            SetModelAsNoLongerNeeded(MissionObjectModel)
            MissionObjectModel = nil
            AttachEntityToEntity(object1, playerPed, Config.SDProp.BoneID, Config.SDProp.PX, Config.SDProp.PY, Config.SDProp.PZ, Config.SDProp.PRX, Config.SDProp.PRY, Config.SDProp.PRZ, false, false, true, false, 0, true, false, false)
            TriggerEvent("redem_roleplay:NotifyLeft", Config.SD.JobName, Config.SD.JobStartText, 'menu_textures', 'log_gang_bag', Config.SD.StartTextDuration*1000)
            CurrentJobName = Config.SD.JobName
            CurrentJobFailedText = Config.SD.FailedText
            CurrentJobFailedTextDuration = Config.SD.FailedTextDuration
            else
                TriggerEvent("redem_roleplay:NotifyLeft", Config.SD.JobName, Config.SD.AlreadyInJobText, 'menu_textures', 'menu_icon_alert', Config.SD.AlreadyTextDuration*1000)
            end
        end
    else
        TriggerEvent("redem_roleplay:NotifyLeft", Config.SD.JobName, Config.SD.HasWeaponText, 'menu_textures', 'menu_icon_holster', Config.SD.HasWeaponTextDuration*1000)
    end
end)

RegisterNetEvent('ricx_deliveryjob_start2') -- blkwtr
AddEventHandler('ricx_deliveryjob_start2', function()
    local playerPed = PlayerPedId()
    local hasw, playerw = GetCurrentPedWeapon(playerPed,1)
    if playerw == `WEAPON_UNARMED` then
        if not IsPedOnMount(playerPed) then
        if IsMission == false then
            IsMission = true
            local route = math.random(1,#Config.BLKWTRDELIVERY)--Create a random int between 1 and the number of added deliveries at Config
            StartGpsMultiRoute(GetHashKey("COLOR_YELLOW"), true, true)
            MissionX,MissionY,MissionZ = Config.BLKWTRDELIVERY[route].CP.x, Config.BLKWTRDELIVERY[route].CP.y, Config.BLKWTRDELIVERY[route].CP.z
            AddPointToGpsMultiRoute(MissionX,MissionY,MissionZ)
            RewardM,RewardXP, RewardO = Config.BLKWTR.Reward, Config.BLKWTR.XP, Config.BLKWTRDELIVERY[route].Odds
            SetGpsMultiRouteRender(true)
            Missionblip = N_0x554d9d53f696d002(1664425300, Config.BLKWTRDELIVERY[route].CP.x, Config.BLKWTRDELIVERY[route].CP.y, Config.BLKWTRDELIVERY[route].CP.z)
            SetBlipCoords(Missionblip, Config.BLKWTRDELIVERY[route].CP.x, Config.BLKWTRDELIVERY[route].CP.y, Config.BLKWTRDELIVERY[route].CP.z)
            SetBlipSprite(Missionblip, Config.BLKWTR.MissionBlip, 1)
            SetBlipScale(Missionblip, 0.2)
            Citizen.InvokeNative(0x9CB1A1623062F402, Missionblip, Config.BLKWTR.MissionBlipName)
            MissionObjectModel = Config.BLKWTRProp.PropID
            RequestModel(MissionObjectModel)
            while not HasModelLoaded(MissionObjectModel) do
                Wait(100)
            end
            RequestAnimDict("amb_wander@code_human_hay_bale_wander@male_a@base")
            while ( not HasAnimDictLoaded( "amb_wander@code_human_hay_bale_wander@male_a@base" ) ) do
                Citizen.Wait( 100 )
            end
            TaskPlayAnim(playerPed, "amb_wander@code_human_hay_bale_wander@male_a@base", "base", 8.0, -8.0, -1, 31, 0, true, 0, false, 0, false)
            local playerCo = GetEntityCoords(playerPed)
            object1 = CreateObject(MissionObjectModel, playerCo.x,playerCo.y,playerCo.z, true, true, true)
            SetEntityAsMissionEntity(object1, true, false)
            SetModelAsNoLongerNeeded(MissionObjectModel)
            MissionObjectModel = nil
            AttachEntityToEntity(object1, playerPed, Config.BLKWTRProp.BoneID, Config.BLKWTRProp.PX, Config.BLKWTRProp.PY, Config.BLKWTRProp.PZ, Config.BLKWTRProp.PRX, Config.BLKWTRProp.PRY, Config.BLKWTRProp.PRZ, false, false, true, false, 0, true, false, false)
            TriggerEvent("redem_roleplay:NotifyLeft", Config.BLKWTR.JobName, Config.BLKWTR.JobStartText, 'menu_textures', 'log_gang_bag', Config.BLKWTR.StartTextDuration*1000)
            CurrentJobName = Config.BLKWTR.JobName
            CurrentJobFailedText = Config.BLKWTR.FailedText
            CurrentJobFailedTextDuration = Config.BLKWTR.FailedTextDuration
            else
                TriggerEvent("redem_roleplay:NotifyLeft", Config.BLKWTR.JobName, Config.BLKWTR.AlreadyInJobText, 'menu_textures', 'menu_icon_alert', Config.BLKWTR.AlreadyTextDuration*1000)
            end
        end
    else
        TriggerEvent("redem_roleplay:NotifyLeft", Config.BLKWTR.JobName, Config.BLKWTR.HasWeaponText, 'menu_textures', 'menu_icon_holster', Config.BLKWTR.HasWeaponTextDuration*1000)
    end
end)

RegisterNetEvent('ricx_deliveryjob_start3') -- val
AddEventHandler('ricx_deliveryjob_start3', function()
    local playerPed = PlayerPedId()
    local hasw, playerw = GetCurrentPedWeapon(playerPed,1)
    if playerw == `WEAPON_UNARMED` then
        if not IsPedOnMount(playerPed) then
        if IsMission == false then
            IsMission = true
            local route = math.random(1,#Config.VALDELIVERY)--Create a random int between 1 and the number of added deliveries at Config
            StartGpsMultiRoute(GetHashKey("COLOR_YELLOW"), true, true)
            MissionX,MissionY,MissionZ = Config.VALDELIVERY[route].CP.x, Config.VALDELIVERY[route].CP.y, Config.VALDELIVERY[route].CP.z
            AddPointToGpsMultiRoute(MissionX,MissionY,MissionZ)
            RewardM,RewardXP, RewardO = Config.VAL.Reward, Config.VAL.XP, Config.VALDELIVERY[route].Odds
            SetGpsMultiRouteRender(true)
            Missionblip = N_0x554d9d53f696d002(1664425300, Config.VALDELIVERY[route].CP.x, Config.VALDELIVERY[route].CP.y, Config.VALDELIVERY[route].CP.z)
            SetBlipCoords(Missionblip, Config.VALDELIVERY[route].CP.x, Config.VALDELIVERY[route].CP.y, Config.VALDELIVERY[route].CP.z)
            SetBlipSprite(Missionblip, Config.VAL.MissionBlip, 1)
            SetBlipScale(Missionblip, 0.2)
            Citizen.InvokeNative(0x9CB1A1623062F402, Missionblip, Config.VAL.MissionBlipName)
            MissionObjectModel = Config.VALProp.PropID
            RequestModel(MissionObjectModel)
            while not HasModelLoaded(MissionObjectModel) do
                Wait(100)
            end
            RequestAnimDict("amb_wander@code_human_hay_bale_wander@male_a@base")
            while ( not HasAnimDictLoaded( "amb_wander@code_human_hay_bale_wander@male_a@base" ) ) do
                Citizen.Wait( 100 )
            end
            TaskPlayAnim(playerPed, "amb_wander@code_human_hay_bale_wander@male_a@base", "base", 8.0, -8.0, -1, 31, 0, true, 0, false, 0, false)
            local playerCo = GetEntityCoords(playerPed)
            object1 = CreateObject(MissionObjectModel, playerCo.x,playerCo.y,playerCo.z, true, true, true)
            SetEntityAsMissionEntity(object1, true, false)
            SetModelAsNoLongerNeeded(MissionObjectModel)
            MissionObjectModel = nil
            AttachEntityToEntity(object1, playerPed, Config.VALProp.BoneID, Config.VALProp.PX, Config.VALProp.PY, Config.VALProp.PZ, Config.VALProp.PRX, Config.VALProp.PRY, Config.VALProp.PRZ, false, false, true, false, 0, true, false, false)
            TriggerEvent("redem_roleplay:NotifyLeft", Config.VAL.JobName, Config.VAL.JobStartText, 'menu_textures', 'log_gang_bag', Config.VAL.StartTextDuration*1000)
            CurrentJobName = Config.VAL.JobName
            CurrentJobFailedText = Config.VAL.FailedText
            CurrentJobFailedTextDuration = Config.VAL.FailedTextDuration
            else
                TriggerEvent("redem_roleplay:NotifyLeft", Config.VAL.JobName, Config.VAL.AlreadyInJobText, 'menu_textures', 'menu_icon_alert', Config.VAL.AlreadyTextDuration*1000)
            end
        end
    else
        TriggerEvent("redem_roleplay:NotifyLeft", Config.VAL.JobName, Config.VAL.HasWeaponText, 'menu_textures', 'menu_icon_holster', Config.VAL.HasWeaponTextDuration*1000)
    end
end)

RegisterNetEvent('ricx_deliveryjob_start4') -- tum
AddEventHandler('ricx_deliveryjob_start4', function()
    local playerPed = PlayerPedId()
    local hasw, playerw = GetCurrentPedWeapon(playerPed,1)
    if playerw == `WEAPON_UNARMED` then
        if not IsPedOnMount(playerPed) then
        if IsMission == false then
            IsMission = true
            local route = math.random(1,#Config.TUMDELIVERY)--Create a random int between 1 and the number of added deliveries at Config
            StartGpsMultiRoute(GetHashKey("COLOR_YELLOW"), true, true)
            MissionX,MissionY,MissionZ = Config.TUMDELIVERY[route].CP.x, Config.TUMDELIVERY[route].CP.y, Config.TUMDELIVERY[route].CP.z
            AddPointToGpsMultiRoute(MissionX,MissionY,MissionZ)
            RewardM,RewardXP, RewardO = Config.TUM.Reward, Config.TUM.XP, Config.TUMDELIVERY[route].Odds
            SetGpsMultiRouteRender(true)
            Missionblip = N_0x554d9d53f696d002(1664425300, Config.TUMDELIVERY[route].CP.x, Config.TUMDELIVERY[route].CP.y, Config.TUMDELIVERY[route].CP.z)
            SetBlipCoords(Missionblip, Config.TUMDELIVERY[route].CP.x, Config.TUMDELIVERY[route].CP.y, Config.TUMDELIVERY[route].CP.z)
            SetBlipSprite(Missionblip, Config.TUM.MissionBlip, 1)
            SetBlipScale(Missionblip, 0.2)
            Citizen.InvokeNative(0x9CB1A1623062F402, Missionblip, Config.TUM.MissionBlipName)
            MissionObjectModel = Config.TUMProp.PropID
            RequestModel(MissionObjectModel)
            while not HasModelLoaded(MissionObjectModel) do
                Wait(100)
            end
            RequestAnimDict("amb_wander@code_human_hay_bale_wander@male_a@base")
            while ( not HasAnimDictLoaded( "amb_wander@code_human_hay_bale_wander@male_a@base" ) ) do
                Citizen.Wait( 100 )
            end
            TaskPlayAnim(playerPed, "amb_wander@code_human_hay_bale_wander@male_a@base", "base", 8.0, -8.0, -1, 31, 0, true, 0, false, 0, false)
            local playerCo = GetEntityCoords(playerPed)
            object1 = CreateObject(MissionObjectModel, playerCo.x,playerCo.y,playerCo.z, true, true, true)
            SetEntityAsMissionEntity(object1, true, false)
            SetModelAsNoLongerNeeded(MissionObjectModel)
            MissionObjectModel = nil
            AttachEntityToEntity(object1, playerPed, Config.TUMProp.BoneID, Config.TUMProp.PX, Config.TUMProp.PY, Config.TUMProp.PZ, Config.TUMProp.PRX, Config.TUMProp.PRY, Config.TUMProp.PRZ, false, false, true, false, 0, true, false, false)
            TriggerEvent("redem_roleplay:NotifyLeft", Config.TUM.JobName, Config.TUM.JobStartText, 'menu_textures', 'log_gang_bag', Config.TUM.StartTextDuration*1000)
            CurrentJobName = Config.TUM.JobName
            CurrentJobFailedText = Config.TUM.FailedText
            CurrentJobFailedTextDuration = Config.TUM.FailedTextDuration
            else
                TriggerEvent("redem_roleplay:NotifyLeft", Config.TUM.JobName, Config.TUM.AlreadyInJobText, 'menu_textures', 'menu_icon_alert', Config.TUM.AlreadyTextDuration*1000)
            end
        end
    else
        TriggerEvent("redem_roleplay:NotifyLeft", Config.TUM.JobName, Config.TUM.HasWeaponText, 'menu_textures', 'menu_icon_holster', Config.TUM.HasWeaponTextDuration*1000)
    end
end)

RegisterNetEvent('ricx_deliveryjob_start5') -- arm
AddEventHandler('ricx_deliveryjob_start5', function()
    local playerPed = PlayerPedId()
    local hasw, playerw = GetCurrentPedWeapon(playerPed,1)
    if playerw == `WEAPON_UNARMED` then
        if not IsPedOnMount(playerPed) then
        if IsMission == false then
            IsMission = true
            local route = math.random(1,#Config.ARMDELIVERY)--Create a random int between 1 and the number of added deliveries at Config
            StartGpsMultiRoute(GetHashKey("COLOR_YELLOW"), true, true)
            MissionX,MissionY,MissionZ = Config.ARMDELIVERY[route].CP.x, Config.ARMDELIVERY[route].CP.y, Config.ARMDELIVERY[route].CP.z
            AddPointToGpsMultiRoute(MissionX,MissionY,MissionZ)
            RewardM,RewardXP, RewardO = Config.ARM.Reward, Config.ARM.XP, Config.ARMDELIVERY[route].Odds
            SetGpsMultiRouteRender(true)
            Missionblip = N_0x554d9d53f696d002(1664425300, Config.ARMDELIVERY[route].CP.x, Config.ARMDELIVERY[route].CP.y, Config.ARMDELIVERY[route].CP.z)
            SetBlipCoords(Missionblip, Config.ARMDELIVERY[route].CP.x, Config.ARMDELIVERY[route].CP.y, Config.ARMDELIVERY[route].CP.z)
            SetBlipSprite(Missionblip, Config.ARM.MissionBlip, 1)
            SetBlipScale(Missionblip, 0.2)
            Citizen.InvokeNative(0x9CB1A1623062F402, Missionblip, Config.ARM.MissionBlipName)
            MissionObjectModel = Config.ARMProp.PropID
            RequestModel(MissionObjectModel)
            while not HasModelLoaded(MissionObjectModel) do
                Wait(100)
            end
            RequestAnimDict("amb_wander@code_human_hay_bale_wander@male_a@base")
            while ( not HasAnimDictLoaded( "amb_wander@code_human_hay_bale_wander@male_a@base" ) ) do
                Citizen.Wait( 100 )
            end
            TaskPlayAnim(playerPed, "amb_wander@code_human_hay_bale_wander@male_a@base", "base", 8.0, -8.0, -1, 31, 0, true, 0, false, 0, false)
            local playerCo = GetEntityCoords(playerPed)
            object1 = CreateObject(MissionObjectModel, playerCo.x,playerCo.y,playerCo.z, true, true, true)
            SetEntityAsMissionEntity(object1, true, false)
            SetModelAsNoLongerNeeded(MissionObjectModel)
            MissionObjectModel = nil
            AttachEntityToEntity(object1, playerPed, Config.ARMProp.BoneID, Config.ARMProp.PX, Config.ARMProp.PY, Config.ARMProp.PZ, Config.ARMProp.PRX, Config.ARMProp.PRY, Config.ARMProp.PRZ, false, false, true, false, 0, true, false, false)
            TriggerEvent("redem_roleplay:NotifyLeft", Config.ARM.JobName, Config.ARM.JobStartText, 'menu_textures', 'log_gang_bag', Config.ARM.StartTextDuration*1000)
            CurrentJobName = Config.ARM.JobName
            CurrentJobFailedText = Config.ARM.FailedText
            CurrentJobFailedTextDuration = Config.ARM.FailedTextDuration
            else
                TriggerEvent("redem_roleplay:NotifyLeft", Config.ARM.JobName, Config.ARM.AlreadyInJobText, 'menu_textures', 'menu_icon_alert', Config.ARM.AlreadyTextDuration*1000)
            end
        end
    else
        TriggerEvent("redem_roleplay:NotifyLeft", Config.ARM.JobName, Config.ARM.HasWeaponText, 'menu_textures', 'menu_icon_holster', Config.ARM.HasWeaponTextDuration*1000)
    end
end)

RegisterNetEvent('ricx_deliveryjob_start6') -- ann
AddEventHandler('ricx_deliveryjob_start6', function()
    local playerPed = PlayerPedId()
    local hasw, playerw = GetCurrentPedWeapon(playerPed,1)
    if playerw == `WEAPON_UNARMED` then
        if not IsPedOnMount(playerPed) then
        if IsMission == false then
            IsMission = true
            local route = math.random(1,#Config.ANNDELIVERY)--Create a random int between 1 and the number of added deliveries at Config
            StartGpsMultiRoute(GetHashKey("COLOR_YELLOW"), true, true)
            MissionX,MissionY,MissionZ = Config.ANNDELIVERY[route].CP.x, Config.ANNDELIVERY[route].CP.y, Config.ANNDELIVERY[route].CP.z
            AddPointToGpsMultiRoute(MissionX,MissionY,MissionZ)
            RewardM,RewardXP, RewardO = Config.ANN.Reward, Config.ANN.XP, Config.ANNDELIVERY[route].Odds
            SetGpsMultiRouteRender(true)
            Missionblip = N_0x554d9d53f696d002(1664425300, Config.ANNDELIVERY[route].CP.x, Config.ANNDELIVERY[route].CP.y, Config.ANNDELIVERY[route].CP.z)
            SetBlipCoords(Missionblip, Config.ANNDELIVERY[route].CP.x, Config.ANNDELIVERY[route].CP.y, Config.ANNDELIVERY[route].CP.z)
            SetBlipSprite(Missionblip, Config.ANN.MissionBlip, 1)
            SetBlipScale(Missionblip, 0.2)
            Citizen.InvokeNative(0x9CB1A1623062F402, Missionblip, Config.ANN.MissionBlipName)
            MissionObjectModel = Config.ANNProp.PropID
            RequestModel(MissionObjectModel)
            while not HasModelLoaded(MissionObjectModel) do
                Wait(100)
            end
            RequestAnimDict("amb_wander@code_human_hay_bale_wander@male_a@base")
            while ( not HasAnimDictLoaded( "amb_wander@code_human_hay_bale_wander@male_a@base" ) ) do
                Citizen.Wait( 100 )
            end
            TaskPlayAnim(playerPed, "amb_wander@code_human_hay_bale_wander@male_a@base", "base", 8.0, -8.0, -1, 31, 0, true, 0, false, 0, false)
            local playerCo = GetEntityCoords(playerPed)
            object1 = CreateObject(MissionObjectModel, playerCo.x,playerCo.y,playerCo.z, true, true, true)
            SetEntityAsMissionEntity(object1, true, false)
            SetModelAsNoLongerNeeded(MissionObjectModel)
            MissionObjectModel = nil
            AttachEntityToEntity(object1, playerPed, Config.ANNProp.BoneID, Config.ANNProp.PX, Config.ANNProp.PY, Config.ANNProp.PZ, Config.ANNProp.PRX, Config.ANNProp.PRY, Config.ANNProp.PRZ, false, false, true, false, 0, true, false, false)
            TriggerEvent("redem_roleplay:NotifyLeft", Config.ANN.JobName, Config.ANN.JobStartText, 'menu_textures', 'log_gang_bag', Config.ANN.StartTextDuration*1000)
            CurrentJobName = Config.ANN.JobName
            CurrentJobFailedText = Config.ANN.FailedText
            CurrentJobFailedTextDuration = Config.ANN.FailedTextDuration
            else
                TriggerEvent("redem_roleplay:NotifyLeft", Config.ANN.JobName, Config.ANN.AlreadyInJobText, 'menu_textures', 'menu_icon_alert', Config.ANN.AlreadyTextDuration*1000)
            end
        end
    else
        TriggerEvent("redem_roleplay:NotifyLeft", Config.ANN.JobName, Config.ANN.HasWeaponText, 'menu_textures', 'menu_icon_holster', Config.ANN.HasWeaponTextDuration*1000)
    end
end)

RegisterNetEvent('ricx_deliveryjob_start7') -- rh
AddEventHandler('ricx_deliveryjob_start7', function()
    local playerPed = PlayerPedId()
    local hasw, playerw = GetCurrentPedWeapon(playerPed,1)
    if playerw == `WEAPON_UNARMED` then
        if not IsPedOnMount(playerPed) then
        if IsMission == false then
            IsMission = true
            local route = math.random(1,#Config.RHDELIVERY)--Create a random int between 1 and the number of added deliveries at Config
            StartGpsMultiRoute(GetHashKey("COLOR_YELLOW"), true, true)
            MissionX,MissionY,MissionZ = Config.RHDELIVERY[route].CP.x, Config.RHDELIVERY[route].CP.y, Config.RHDELIVERY[route].CP.z
            AddPointToGpsMultiRoute(MissionX,MissionY,MissionZ)
            RewardM,RewardXP, RewardO = Config.RH.Reward, Config.RH.XP, Config.RHDELIVERY[route].Odds
            SetGpsMultiRouteRender(true)
            Missionblip = N_0x554d9d53f696d002(1664425300, Config.RHDELIVERY[route].CP.x, Config.RHDELIVERY[route].CP.y, Config.RHDELIVERY[route].CP.z)
            SetBlipCoords(Missionblip, Config.RHDELIVERY[route].CP.x, Config.RHDELIVERY[route].CP.y, Config.RHDELIVERY[route].CP.z)
            SetBlipSprite(Missionblip, Config.RH.MissionBlip, 1)
            SetBlipScale(Missionblip, 0.2)
            Citizen.InvokeNative(0x9CB1A1623062F402, Missionblip, Config.RH.MissionBlipName)
            MissionObjectModel = Config.RHProp.PropID
            RequestModel(MissionObjectModel)
            while not HasModelLoaded(MissionObjectModel) do
                Wait(100)
            end
            RequestAnimDict("amb_wander@code_human_hay_bale_wander@male_a@base")
            while ( not HasAnimDictLoaded( "amb_wander@code_human_hay_bale_wander@male_a@base" ) ) do
                Citizen.Wait( 100 )
            end
            TaskPlayAnim(playerPed, "amb_wander@code_human_hay_bale_wander@male_a@base", "base", 8.0, -8.0, -1, 31, 0, true, 0, false, 0, false)
            local playerCo = GetEntityCoords(playerPed)
            object1 = CreateObject(MissionObjectModel, playerCo.x,playerCo.y,playerCo.z, true, true, true)
            SetEntityAsMissionEntity(object1, true, false)
            SetModelAsNoLongerNeeded(MissionObjectModel)
            MissionObjectModel = nil
            AttachEntityToEntity(object1, playerPed, Config.RHProp.BoneID, Config.RHProp.PX, Config.RHProp.PY, Config.RHProp.PZ, Config.RHProp.PRX, Config.RHProp.PRY, Config.RHProp.PRZ, false, false, true, false, 0, true, false, false)
            TriggerEvent("redem_roleplay:NotifyLeft", Config.RH.JobName, Config.RH.JobStartText, 'menu_textures', 'log_gang_bag', Config.RH.StartTextDuration*1000)
            CurrentJobName = Config.RH.JobName
            CurrentJobFailedText = Config.RH.FailedText
            CurrentJobFailedTextDuration = Config.RH.FailedTextDuration
            else
                TriggerEvent("redem_roleplay:NotifyLeft", Config.RH.JobName, Config.RH.AlreadyInJobText, 'menu_textures', 'menu_icon_alert', Config.RH.AlreadyTextDuration*1000)
            end
        end
    else
        TriggerEvent("redem_roleplay:NotifyLeft", Config.RH.JobName, Config.RH.HasWeaponText, 'menu_textures', 'menu_icon_holster', Config.RH.HasWeaponTextDuration*1000)
    end
end)

RegisterNetEvent('ricx_deliveryjob_start8') -- str
AddEventHandler('ricx_deliveryjob_start8', function()
    local playerPed = PlayerPedId()
    local hasw, playerw = GetCurrentPedWeapon(playerPed,1)
    if playerw == `WEAPON_UNARMED` then
        if not IsPedOnMount(playerPed) then
        if IsMission == false then
            IsMission = true
            local route = math.random(1,#Config.STRDELIVERY)--Create a random int between 1 and the number of added deliveries at Config
            StartGpsMultiRoute(GetHashKey("COLOR_YELLOW"), true, true)
            MissionX,MissionY,MissionZ = Config.STRDELIVERY[route].CP.x, Config.STRDELIVERY[route].CP.y, Config.STRDELIVERY[route].CP.z
            AddPointToGpsMultiRoute(MissionX,MissionY,MissionZ)
            RewardM,RewardXP, RewardO = Config.STR.Reward, Config.STR.XP, Config.STRDELIVERY[route].Odds
            SetGpsMultiRouteRender(true)
            Missionblip = N_0x554d9d53f696d002(1664425300, Config.STRDELIVERY[route].CP.x, Config.STRDELIVERY[route].CP.y, Config.STRDELIVERY[route].CP.z)
            SetBlipCoords(Missionblip, Config.STRDELIVERY[route].CP.x, Config.STRDELIVERY[route].CP.y, Config.STRDELIVERY[route].CP.z)
            SetBlipSprite(Missionblip, Config.STR.MissionBlip, 1)
            SetBlipScale(Missionblip, 0.2)
            Citizen.InvokeNative(0x9CB1A1623062F402, Missionblip, Config.STR.MissionBlipName)
            MissionObjectModel = Config.STRProp.PropID
            RequestModel(MissionObjectModel)
            while not HasModelLoaded(MissionObjectModel) do
                Wait(100)
            end
            RequestAnimDict("amb_wander@code_human_hay_bale_wander@male_a@base")
            while ( not HasAnimDictLoaded( "amb_wander@code_human_hay_bale_wander@male_a@base" ) ) do
                Citizen.Wait( 100 )
            end
            TaskPlayAnim(playerPed, "amb_wander@code_human_hay_bale_wander@male_a@base", "base", 8.0, -8.0, -1, 31, 0, true, 0, false, 0, false)
            local playerCo = GetEntityCoords(playerPed)
            object1 = CreateObject(MissionObjectModel, playerCo.x,playerCo.y,playerCo.z, true, true, true)
            SetEntityAsMissionEntity(object1, true, false)
            SetModelAsNoLongerNeeded(MissionObjectModel)
            MissionObjectModel = nil
            AttachEntityToEntity(object1, playerPed, Config.STRProp.BoneID, Config.STRProp.PX, Config.STRProp.PY, Config.STRProp.PZ, Config.STRProp.PRX, Config.STRProp.PRY, Config.STRProp.PRZ, false, false, true, false, 0, true, false, false)
            TriggerEvent("redem_roleplay:NotifyLeft", Config.STR.JobName, Config.STR.JobStartText, 'menu_textures', 'log_gang_bag', Config.STR.StartTextDuration*1000)
            CurrentJobName = Config.STR.JobName
            CurrentJobFailedText = Config.STR.FailedText
            CurrentJobFailedTextDuration = Config.STR.FailedTextDuration
            else
                TriggerEvent("redem_roleplay:NotifyLeft", Config.STR.JobName, Config.STR.AlreadyInJobText, 'menu_textures', 'menu_icon_alert', Config.STR.AlreadyTextDuration*1000)
            end
        end
    else
        TriggerEvent("redem_roleplay:NotifyLeft", Config.STR.JobName, Config.STR.HasWeaponText, 'menu_textures', 'menu_icon_holster', Config.STR.HasWeaponTextDuration*1000)
    end
end)

Citizen.CreateThread(function()
    for i, v in pairs(JobBlips) do
        AllBlip[i] = N_0x554d9d53f696d002(1664425300, v.x, v.y, v.z)
        SetBlipSprite(AllBlip[i], v.sprite, 1)
        SetBlipScale(AllBlip[i], 0.2)
        Citizen.InvokeNative(0x9CB1A1623062F402, AllBlip[i], v.name)
        Citizen.Wait(1)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)
        playercoords = GetEntityCoords(PlayerPedId())
    end
end)

-- st denis
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        if playercoords then
            if not IsMission then
                if (GetDistanceBetweenCoords(playercoords.x, playercoords.y, playercoords.z, Config.SD.JobBlipCoords.X,Config.SD.JobBlipCoords.Y,Config.SD.JobBlipCoords.Z, true) < 2.0) then
                    SetTextScale(1.5, 1.5)
                    local msg = Config.AtMissionText
                    local str = Citizen.InvokeNative(0xFA925AC00EB830B9, 10, "LITERAL_STRING", msg, Citizen.ResultAsLong())
                    Citizen.InvokeNative(0xFA233F8FE190514C, str)
                    Citizen.InvokeNative(0xE9990552DEC71600)
                    if IsControlJustPressed(0, Config.KeyID['key']) then
                        TriggerEvent("ricx_deliveryjob_start1")
                    end
                end
            end
        end
    end
end)

-- blkwtr
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        if playercoords then
            if not IsMission then
                if (GetDistanceBetweenCoords(playercoords.x, playercoords.y, playercoords.z, Config.BLKWTR.JobBlipCoords.X,Config.BLKWTR.JobBlipCoords.Y,Config.BLKWTR.JobBlipCoords.Z, true) < 2.0) then
                    SetTextScale(1.5, 1.5)
                    local msg = Config.AtMissionText
                    local str = Citizen.InvokeNative(0xFA925AC00EB830B9, 10, "LITERAL_STRING", msg, Citizen.ResultAsLong())
                    Citizen.InvokeNative(0xFA233F8FE190514C, str)
                    Citizen.InvokeNative(0xE9990552DEC71600)
                    if IsControlJustPressed(0, Config.KeyID['key']) then
                        TriggerEvent("ricx_deliveryjob_start2")
                    end
                end
            end
        end
    end
end)

-- val
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        if playercoords then
            if not IsMission then
                if (GetDistanceBetweenCoords(playercoords.x, playercoords.y, playercoords.z, Config.VAL.JobBlipCoords.X,Config.VAL.JobBlipCoords.Y,Config.VAL.JobBlipCoords.Z, true) < 2.0) then
                    SetTextScale(1.5, 1.5)
                    local msg = Config.AtMissionText
                    local str = Citizen.InvokeNative(0xFA925AC00EB830B9, 10, "LITERAL_STRING", msg, Citizen.ResultAsLong())
                    Citizen.InvokeNative(0xFA233F8FE190514C, str)
                    Citizen.InvokeNative(0xE9990552DEC71600)
                    if IsControlJustPressed(0, Config.KeyID['key']) then
                        TriggerEvent("ricx_deliveryjob_start3")
                    end
                end
            end
        end
    end
end)

-- tum
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        if playercoords then
            if not IsMission then
                if (GetDistanceBetweenCoords(playercoords.x, playercoords.y, playercoords.z, Config.TUM.JobBlipCoords.X,Config.TUM.JobBlipCoords.Y,Config.TUM.JobBlipCoords.Z, true) < 2.0) then
                    SetTextScale(1.5, 1.5)
                    local msg = Config.AtMissionText
                    local str = Citizen.InvokeNative(0xFA925AC00EB830B9, 10, "LITERAL_STRING", msg, Citizen.ResultAsLong())
                    Citizen.InvokeNative(0xFA233F8FE190514C, str)
                    Citizen.InvokeNative(0xE9990552DEC71600)
                    if IsControlJustPressed(0, Config.KeyID['key']) then
                        TriggerEvent("ricx_deliveryjob_start4")
                    end
                end
            end
        end
    end
end)

-- arm
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        if playercoords then
            if not IsMission then
                if (GetDistanceBetweenCoords(playercoords.x, playercoords.y, playercoords.z, Config.ARM.JobBlipCoords.X,Config.ARM.JobBlipCoords.Y,Config.ARM.JobBlipCoords.Z, true) < 2.0) then
                    SetTextScale(1.5, 1.5)
                    local msg = Config.AtMissionText
                    local str = Citizen.InvokeNative(0xFA925AC00EB830B9, 10, "LITERAL_STRING", msg, Citizen.ResultAsLong())
                    Citizen.InvokeNative(0xFA233F8FE190514C, str)
                    Citizen.InvokeNative(0xE9990552DEC71600)
                    if IsControlJustPressed(0, Config.KeyID['key']) then
                        TriggerEvent("ricx_deliveryjob_start5")
                    end
                end
            end
        end
    end
end)

-- ann
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        if playercoords then
            if not IsMission then
                if (GetDistanceBetweenCoords(playercoords.x, playercoords.y, playercoords.z, Config.ANN.JobBlipCoords.X,Config.ANN.JobBlipCoords.Y,Config.ANN.JobBlipCoords.Z, true) < 2.0) then
                    SetTextScale(1.5, 1.5)
                    local msg = Config.AtMissionText
                    local str = Citizen.InvokeNative(0xFA925AC00EB830B9, 10, "LITERAL_STRING", msg, Citizen.ResultAsLong())
                    Citizen.InvokeNative(0xFA233F8FE190514C, str)
                    Citizen.InvokeNative(0xE9990552DEC71600)
                    if IsControlJustPressed(0, Config.KeyID['key']) then
                        TriggerEvent("ricx_deliveryjob_start6")
                    end
                end
            end
        end
    end
end)

-- rh
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        if playercoords then
            if not IsMission then
                if (GetDistanceBetweenCoords(playercoords.x, playercoords.y, playercoords.z, Config.RH.JobBlipCoords.X,Config.RH.JobBlipCoords.Y,Config.RH.JobBlipCoords.Z, true) < 2.0) then
                    SetTextScale(1.5, 1.5)
                    local msg = Config.AtMissionText
                    local str = Citizen.InvokeNative(0xFA925AC00EB830B9, 10, "LITERAL_STRING", msg, Citizen.ResultAsLong())
                    Citizen.InvokeNative(0xFA233F8FE190514C, str)
                    Citizen.InvokeNative(0xE9990552DEC71600)
                    if IsControlJustPressed(0, Config.KeyID['key']) then
                        TriggerEvent("ricx_deliveryjob_start7")
                    end
                end
            end
        end
    end
end)

-- str
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        if playercoords then
            if not IsMission then
                if (GetDistanceBetweenCoords(playercoords.x, playercoords.y, playercoords.z, Config.STR.JobBlipCoords.X,Config.STR.JobBlipCoords.Y,Config.STR.JobBlipCoords.Z, true) < 2.0) then
                    SetTextScale(1.5, 1.5)
                    local msg = Config.AtMissionText
                    local str = Citizen.InvokeNative(0xFA925AC00EB830B9, 10, "LITERAL_STRING", msg, Citizen.ResultAsLong())
                    Citizen.InvokeNative(0xFA233F8FE190514C, str)
                    Citizen.InvokeNative(0xE9990552DEC71600)
                    if IsControlJustPressed(0, Config.KeyID['key']) then
                        TriggerEvent("ricx_deliveryjob_start8")
                    end
                end
            end
        end
    end
end)


Citizen.CreateThread(function()
    while true do
        Wait(1)
        if IsMission then
            DisableControlAction(0, 0xCEFD9220, true)--E ENTER
            DisableControlAction(0, 0xB2F377E8, true) -- F MELEE
            DisableControlAction(0, 0x8FFC75D6, true) -- SHIFT SPRINT
            DisableControlAction(0, 0xD9D0E1C0, true) -- SPACE JUMP
            DisableControlAction(0, 0xAC4BD4F1, true) -- TAB WEAPON SELECT
            DisableControlAction(0, 0x4CC0E2FE, true) -- B INVENTORY
            if not IsEntityPlayingAnim(PlayerPedId(), "amb_wander@code_human_hay_bale_wander@male_a@base", "base", 3) then -- Check if the player is playing the Hold and Grab anim
                RequestAnimDict("amb_wander@code_human_hay_bale_wander@male_a@base")
                while ( not HasAnimDictLoaded( "amb_wander@code_human_hay_bale_wander@male_a@base" ) ) do
                        Citizen.Wait( 100 )
                end
                TaskPlayAnim(PlayerPedId(), "amb_wander@code_human_hay_bale_wander@male_a@base", "base", 8.0, -8.0, -1, 31, 0, true, 0, false, 0, false)
            end
            if IsPedSwimming(PlayerPedId()) or IsPedFalling(PlayerPedId()) or Citizen.InvokeNative(0x59643424B68D52B5,PlayerPedId()) or IsPedDeadOrDying(PlayerPedId(), true) then --Fail if the player is swimming, falling or climbing
                IsMission = false
                RemoveBlip(Missionblip)
                SetGpsMultiRouteRender(false)
                DeleteObject(object1)
                ClearPedTasksImmediately(PlayerPedId())
                TriggerEvent("redem_roleplay:NotifyLeft", CurrentJobName, CurrentJobFailedText, 'menu_textures', 'cross', CurrentJobFailedTextDuration*1000)
                CurrentJobName = nil
                CurrentJobFailedText = nil
                CurrentJobFailedTextDuration = nil
                MissionX,MissionY,MissionZ = nil, nil, nil
                RewardM,RewardXP, RewardO = nil, nil, nil
                object1, Missionblip = nil, nil
            end
            if playercoords then
                if GetDistanceBetweenCoords(playercoords.x,playercoords.y,playercoords.z, MissionX,MissionY,MissionZ, true) < 2.0 then
                    local msg = "~o~Finish delivery [U]"
                    SetTextScale(1.5, 1.5)
                    local str = Citizen.InvokeNative(0xFA925AC00EB830B9, 10, "LITERAL_STRING", msg, Citizen.ResultAsLong())
                    Citizen.InvokeNative(0xFA233F8FE190514C, str)
                    Citizen.InvokeNative(0xE9990552DEC71600)
                    if IsControlJustPressed(0, Config.KeyID['key']) then
                        SetGpsMultiRouteRender(false)
                        RemoveBlip(Missionblip)
                        DeleteObject(object1)
                        ClearPedTasksImmediately(PlayerPedId())
                        local rewardmoney = RewardM*RewardO
                        local rewardedxp = RewardXP*RewardO
                        TriggerEvent("redem_roleplay:NotifyLeft", CurrentJobName, 'Job Done! Your payment: ~o~~h~$'..rewardmoney..' ~e~ (+'..rewardedxp..' XP)', 'generic_textures', 'tick', 6000)
                        TriggerServerEvent("ricx_deliveryjob_reward",rewardmoney, rewardedxp)
                        IsMission = false
                        CurrentJobName = nil
                        CurrentJobFailedText = nil
                        CurrentJobFailedTextDuration = nil
                        MissionX,MissionY,MissionZ = nil, nil, nil
                        RewardM,RewardXP, RewardO = nil, nil, nil
                        object1, Missionblip = nil, nil
                    end
                end
            end
        end
    end
end)



AddEventHandler('onResourceStop', function(resourceName)
	if (GetCurrentResourceName() ~= resourceName) then
	  return
	end
    IsMission = false
    CurrentJobName = nil
    CurrentJobFailedText = nil
    CurrentJobFailedTextDuration = nil
    MissionX,MissionY,MissionZ = nil, nil, nil
    RewardM,RewardXP, RewardO = nil, nil, nil
    SetGpsMultiRouteRender(false)
    ClearPedTasksImmediately(PlayerPedId())
    if Missionblip then
        print("Blip Deleted: "..Missionblip)
        RemoveBlip(Missionblip)
    end
    for i, v in pairs(AllBlip) do
        print("Blip deleted: "..AllBlip[i])
        RemoveBlip(AllBlip[i])
    end
    if object1 then
        DeleteObject(object1)
        print("Object deleted: "..object1)
    end
    Missionblip, object1 = nil, nil
end)
