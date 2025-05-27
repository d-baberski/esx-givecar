RegisterNetEvent('givecar:spawnVehicle', function(carModel, plate, coords, heading)
    local model = GetHashKey(carModel)
    RequestModel(model)
    while not HasModelLoaded(model) do Wait(100) end

    local vehicle = CreateVehicle(model, coords.x, coords.y, coords.z, heading, true, false)
    SetVehicleNumberPlateText(vehicle, plate)
    SetVehicleOnGroundProperly(vehicle)
    TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
    SetEntityAsMissionEntity(vehicle, true, true)
end)
