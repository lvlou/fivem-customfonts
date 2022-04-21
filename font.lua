local resourceName = GetCurrentResourceName()
local mdNum = GetNumResourceMetadata(resourceName, "add_font_extra")

registeredFonts = {}

if mdNum ~= 0 then
    print("Found metadata for " .. mdNum .. " fonts")

    for i=0, mdNum - 1 do
        local metadata = GetResourceMetadata(resourceName, "add_font_extra", i)

        if metadata then
            local fontObj = json.decode(metadata)
            local fileNameNoExt = fontObj.file:gsub(".gfx", "")

            RegisterFontFile(fileNameNoExt)
            local fontId = RegisterFontId(fontObj.name)

            registeredFonts[fontId] = fontObj

            print("Successfully registered font " .. fontObj.name .. " (" .. fontId .. ")")
        else
            print("Error: metadata at index " .. i .. " is nil")
        end
    end
else
    print("Error: could not find font metadata")
end

exports("getRegisteredFonts", function()
    return registeredFonts
end)