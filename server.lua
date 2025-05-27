ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

RegisterCommand("givecar", function(source, args, rawCommand)
    if source == 0 then -- nur Konsole oder Admin-RCON
        local targetId = tonumber(args[1])
        local carModel = args[2]

        if not targetId or not carModel then
            print("Usage: /givecar [user_id] [car_model]")
            return
        end

        local xPlayer = ESX.GetPlayerFromId(targetId)
        if xPlayer then
            local plate = GeneratePlate()
            local ped = GetPlayerPed(targetId)
            local coords = GetEntityCoords(ped)
            local heading = GetEntityHeading(ped)

            TriggerClientEvent('givecar:spawnVehicle', targetId, carModel, plate, coords, heading)

            Wait(2000)

            MySQL.insert('INSERT INTO owned_vehicles (owner, plate, vehicle, stored) VALUES (?, ?, ?, ?)', {
                xPlayer.identifier,
                plate,
                json.encode({model = GetHashKey(carModel), plate = plate}),
                false
            })

            print(("Fahrzeug %s wurde Spieler %s gegeben."):format(carModel, targetId))
        else
            print("Spieler nicht gefunden.")
        end
    else
        TriggerClientEvent('chat:addMessage', source, {
            args = {"System", "Dieser Befehl ist nur über Konsole oder Admin-RCON verfügbar."}
        })
    end
end)

function GeneratePlate()
    local charset = {}
    for i = 48, 57 do table.insert(charset, string.char(i)) end
    for i = 65, 90 do table.insert(charset, string.char(i)) end

    math.randomseed(os.time())
    local plate = ""
    for i = 1, 8 do
        plate = plate .. charset[math.random(1, #charset)]
    end
    return plate
end
