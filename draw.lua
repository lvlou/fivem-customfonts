local drawTest = false
local drawText = "hi! hallå! поздрав! thís ïs æ tëst (:"
local drawFontId = nil

RegisterCommand("streamedfonts:drawTest", function(src, args, raw)
    if drawTest then
        drawTest = false
    else
        local fontId = tonumber(args[1])

        if fontId then
            if registeredFonts[fontId] then
                drawFontId = fontId
                drawTest = true
                
                print("Drawing with font " .. registeredFonts[fontId].name)
            else
                print("Error: no font with ID " .. fontId)
            end
        else
            print("Error: please provide a valid font ID")
        end
    end
end)

CreateThread(function()
    while true do
        Wait(0)

        if drawTest then
            SetTextFont(drawFontId)
            BeginTextCommandDisplayText('STRING')
            AddTextComponentString(drawText)
            EndTextCommandDisplayText(0.5, 0.5)
        end
    end
end)