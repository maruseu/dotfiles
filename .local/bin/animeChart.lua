#!/usr/bin/env luajit
locale=[[LC_ALL="en_US.UTF-8" ]]
function getDate(dateStr)
	local f=io.popen(dateStr)
	local date=""
	for line in f:lines() do
		date=line
	end
	f:close()
	return date
end

now = getDate(locale .. [[date +'%j %T']])
anime = {}

af=io.open(os.getenv("HOME") .. "/.animetab")
local i=1 
for line in af:lines() do
	if i%2==1 then anime[math.ceil(i/2)]= {} else
	line=getDate(locale .. [[date -d "]] .. line .. [[" +'%j %T']]) end
	anime[math.ceil(i/2)][(i+1)%2+1]=line
	i=i+1
end
af:close()
for k in ipairs(anime) do
	print(anime[k][1])
	local day = anime[k][2]:sub(0,3) - now:sub(0,3) 
	local hour = anime[k][2]:sub(5,6) - now:sub(5,6) 
	local min = anime[k][2]:sub(8,9) - now:sub(8,9)
	local sec = anime[k][2]:sub(11,12) - now:sub(11,12)
	if sec<0 then 
		min=min-1
		sec=sec+60
	end
	if min<0 then 
		hour=hour-1
		min=min+60
	end
	if hour<0 then 
		day=day-1
		hour=hour+24
	end
	if day<0 then day=6 end
	print(day .. 'd ' .. hour .. ":" .. min .. ":" .. sec)
	print("________________________________________________")
end
