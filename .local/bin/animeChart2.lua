#!/usr/bin/env luajit
-- Author: Maruseu
-- E-mail: maruseu@cock.li
-- lisenced under the fuck you lisence 1.0


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

fuck=io.open(os.getenv("HOME") .. "/.animetab")
local i=1 
for line in fuck:lines() do
	if i%2==1 then anime[math.ceil(i/2)]= {} else
	line=getDate(locale .. [[date -d "]] .. line .. [[" +'%j %T']]) end
	anime[math.ceil(i/2)][(i+1)%2+1]=line
	i=i+1
end
fuck:close()

for k in ipairs(anime) do
	local day = anime[k][2]:sub(0,3) - now:sub(0,3) 
	local hour = anime[k][2]:sub(5,6) - now:sub(5,6) 
	local min = anime[k][2]:sub(8,9) - now:sub(8,9)
	local sec = anime[k][2]:sub(11,12) - now:sub(11,12)

	if sec<0 then 
		min=min-1
		sec=sec+60
	end
	sec=(string.format("%02d", sec))

	if min<0 then 
		hour=hour-1
		min=min+60
	end
	min=(string.format("%02d", min))

	if hour<0 then 
		day=day-1
		hour=hour+24
	end
	hour=(string.format("%02d", hour))

	if day<0 then day=6 end

	anime[k][2]=day .. 'd ' .. hour .. ":" .. min .. ":" .. sec
	anime[k][3]=day .. hour .. min .. sec
end

sorted = {}
for k in ipairs(anime) do
	local rank=0

	for l in ipairs(anime) do
		if anime[k][3]<=anime[l][3] then
			rank=rank+1
		end
	end
	while sorted[rank] do
		rank=rank-1
	end

	sorted[rank]={}

	if arg[1]=="conky" then
		sorted[rank][1]=[[${color1}]] .. anime[k][1]
		sorted[rank][2]=[[${color2}]] .. anime[k][2] .. [[${color3}]]
	elseif arg[1]=="ansi" then
		sorted[rank][1]=[[[97m]] .. anime[k][1]
		sorted[rank][2]=[[[93m]] .. anime[k][2] .. [[[91m]]
	elseif arg[1]=="ansib" then
		sorted[rank][1]=[[[1;37m]] .. anime[k][1]
		sorted[rank][2]=[[[33m]] .. anime[k][2] .. [[[31m]]
	else
		sorted[rank][1]=anime[k][1]
		sorted[rank][2]=anime[k][2]
	end
end

if arg[1]=="panel" then
	if sorted[#sorted][1]:len() > 15 then sorted[#sorted][1]=sorted[#sorted][1]:sub(1,13).."..." end
	if sorted[#sorted][2]:sub(1,1)=="0" then sorted[#sorted][2]=sorted[#sorted][2]:sub(4,4+7) end

	print(sorted[#sorted][2] .. "  " .. sorted[#sorted][1]) 
else
	for k = #sorted, 1, -1 do
		print(sorted[k][1] .. "\n" ..  sorted[k][2])

		if arg[1]=="conky" then
			print("________________________________________________")
		elseif arg[1]=="ansib" or arg[1]=="ansi" then
			for i=getDate("tput cols"), 1, -1 do
				io.write("_")
			end
			io.write("\n")
		else
			print("________________________________________________")
		end
	end
end
