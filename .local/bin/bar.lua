#!/usr/bin/env lua
-- Author: Maruseu
-- E-mail: maruseu@cock.li
-- lisenced under the fuck you lisence 1.0

strong=''

if arg[1] then else arg[1]=1 end
if arg[2] then else arg[2]=4 end
arg[2]=1

chars = {"░","▁","▂","▃","▄","▅","▆","▇","█"}
--chars = {"▏","▎","▍","▌","▋","▊","▉","█"}
lenght = arg[2] * #chars
actualsize = arg[1] * lenght

while math.floor(actualsize)>0 do
		strong=strong .. chars[math.floor(math.max(0,math.min(#chars,actualsize)))]
		actualsize = actualsize - #chars
end

while utf8.len(strong)<tonumber(arg[2]) do
	strong=strong .. "░"
	--strong=strong .. "▁"
end

print(strong)
