local hSrv = game:GetService("HttpService")

local flags = '{"FFlagDebugDisplayFPS":"True","DFIntRemoteEventSingleInvocationSizeLimit":"1"}'

local function setFlg(flgNam, flgVal)
    local clnNam = flgNam:gsub("^DFFlag", ""):gsub("^FFlag", ""):gsub("^DFInt", ""):gsub("^FInt", ""):gsub("^DFString", ""):gsub("^FString", "")
    pcall(function() 
        setfflag(tostring(clnNam), tostring(flgVal)) 
    end)
end

local function lodFlg(jsnDat)
    local suc, dec = pcall(hSrv.JSONDecode, hSrv, jsnDat)
    if not suc then return end
    for n, v in pairs(dec) do
        setFlg(n, v)
    end
end

lodFlg(flags)
