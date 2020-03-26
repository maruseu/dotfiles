#!/usr/bin/env luajit
function getString(file)
local string = ""
for line in io.lines(file) do
string = string .. line .. " "
end
return string
end
function getVal(s,key,beginkey,endkey)
local b = string.find(s,key)
local bd = string.find(s,beginkey,b+string.len(key))
local fd = string.find(s,endkey,bd+1)
return string.sub(s,bd+1,fd-1)
end

file = '/proc/meminfo'
local mem = getString(file)
local memUsage
do
    local memTotal = getVal(mem,"MemTotal",':','kB')
    local shmem = getVal(mem,"Shmem",':','kB')
    local buffers = getVal(mem,"Buffers",':','kB')
    local cached = getVal(mem,"Cached",':','kB')
    local memFree = getVal(mem,"MemFree",':','kB')
    local sReclaimable = getVal(mem,"SReclaimable",':','kB')

    local memUsed = memTotal+shmem-buffers-cached-memFree-sReclaimable

    memUsed = string.format( "%4.1f" ,tostring(memUsed/1024/1024))
    --local memFull = string.format( "%4.1f" ,tostring(memTotal/1024/1024))

    memUsage = memUsed .. "G"-- .. "/" .. memFull .. "G"
end
file = os.getenv("HOME") .. '/Scripts/i3Blocks/pangoNormal'
local p1 = getString(file)
file = os.getenv("HOME") .. '/Scripts/i3Blocks/pangoEnd'
local p2 = getString(file)
file = os.getenv("HOME") .. '/Scripts/i3Blocks/separator'
local s = getString(file)
print([[]] .. memUsage)
