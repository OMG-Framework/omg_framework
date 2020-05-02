token = ""

-- Token Checker

function CheckToken(tokenToCheck, player)
    if tokenToCheck == token then
        return true
    else
        if omg_framework._display_logs then
            print("[TOKEN] ^1Invalid token usage^7, player: ["..player.."] used token "..tokenToCheck.." instead of "..token.."^7")
        end
        return false
    end
end






-- Token generation and sending


local function SendTokenToClients()
    TriggerEvent("OMG:SendToken", token) -- Server side 
    TriggerClientEvent("OMG:SendToken", -1, token) -- Client side
end


local function GenerateToken()
	local res = ""
	for i = 1, 15 do
		res = res .. string.char(math.random(97, 122))
	end
	return res
end

RegisterNetEvent("OMG:TokenSync")
AddEventHandler("OMG:TokenSync", function()
    TriggerClientEvent("OMG:SendToken", source, token) -- Client side
end)

Citizen.CreateThread(function()
    while true do
        token = GenerateToken()
        SendTokenToClients()
        if omg_framework._display_logs then
            print("[TOKEN] ^2New token generated - "..token.."^7")
        end
        Wait(5*60000) -- Generate new token every 5 min
    end
end)
