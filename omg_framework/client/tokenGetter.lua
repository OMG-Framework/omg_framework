token = ""

RegisterNetEvent("OMG:SendToken")
AddEventHandler("OMG:SendToken", function(NewToken)
    token = NewToken
end)