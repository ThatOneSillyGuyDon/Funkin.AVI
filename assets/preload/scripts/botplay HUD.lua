function onCreate()
    if botPlay then
        setPropertyFromClass('ClientPrefs', 'flashing', false) --why, becuase in Lunacy the HUD turn on
        setProperty('camHUD.visible', false)
        end
    end