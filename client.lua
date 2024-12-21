Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local ped = PlayerPedId()
        
        -- Vérifie si le ped existe
        if DoesEntityExist(ped) then
            -- Désactive le mode furtif de toutes les manières possibles
            SetPedStealthMovement(ped, false, "")
            SetPedUsingActionMode(ped, false, -1, "DEFAULT_ACTION")
            SetPedCanPlayAmbientAnims(ped, false)
            SetPedConfigFlag(ped, 116, true) -- CPED_CONFIG_FLAG_DisableStealthMode
            
            -- Désactive la touche CTRL et vérifie le mode furtif
            DisableControlAction(0, 36, true) -- INPUT_DUCK
            
            -- Vérifie et corrige si le ped est en mode furtif
            if GetPedStealthMovement(ped) then
                ResetPedMovementClipset(ped, 0.0)
            end
        end
    end
end)