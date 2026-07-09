-- open sourcifier or whatever
local modem = GetPartFromPort(1, "Modem")
local mc = GetPartFromPort(1, "Microcontroller")
local code = modem:GetAsync("https://raw.githubusercontent.com/inkylinky343/wosternet/refs/heads/main/WOSternet.lua", true, nil)
print(code)
mc:Configure({Code=code})
-- borrowed code from stack overflow for generating random strings
function makeip(k)
    local alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
    local n = string.len(alphabet)
    local pw = {}
    for i = 1, k
    do
        pw[i] = string.byte(alphabet, math.random(n))
    end
    return string.char(table.unpack(pw))
end

local disk = GetPartFromPort(1, "Disk")
local ip = makeip(6)
print(ip)
disk:Write("ip", ip)
print(disk.ip)