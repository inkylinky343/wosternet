-- open sourcifier or whatever
local modem = GetPartFromPort(1, "Modem")
local mc = GetPartFromPort(1, "Microcontroller")
local code = modem:GetAsync("https://raw.githubusercontent.com/inkylinky343/wosternet/refs/heads/main/WOSternet.lua", true, nil)
print(code)
Configure({Code=code})
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

-- make and assign ip (you can change your ip by replacing the disk for now)
local disk = assert(GetPartFromPort(2, "Disk"),"Insert Disk to Run.")
local ip = makeip(6)
local a = disk:ReadAll()
if a.ip == nil then
    disk:Write("ip", ip)
end
print(a.ip)
print(OnClicker())