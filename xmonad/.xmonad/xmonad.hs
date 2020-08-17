--    _  __ __  ___                      __
--   | |/ //  |/  /___  ____  ____ _____/ /
--   |   // /|_/ / __ \/ __ \/ __ `/ __  / 
--  /   |/ /  / / /_/ / / / / /_/ / /_/ /  
-- /_/|_/_/  /_/\____/_/ /_/\__,_/\__,_/   

import XMonad
import XMonad.Hooks.ManageDocks (docks, avoidStruts, manageDocks)
import XMonad.Hooks.EwmhDesktops (ewmh, fullscreenEventHook)
import XMonad.Hooks.InsertPosition (insertPosition, Focus(Newer), Position(Below))
import XMonad.Layout.Spacing (spacingRaw, Border(Border))
import XMonad.Layout.NoBorders (smartBorders)
import XMonad.Util.EZConfig (additionalKeys)
import XMonad.Util.SpawnOnce (spawnOnce)
import XMonad.Actions.Search (google, scholar, wikipedia, selectSearch, promptSearch)
import XMonad.Prompt (greenXPConfig, XPConfig (font, bgColor, fgColor))
import Colors
--baseConfig = desktopConfig
m = mod4Mask
myTerm = "st"

myManageHook = composeAll [ className =? "flameshot" --> doFloat
                          ]

myLayoutHook = spacingRaw False (Border 5 5 5 5) True (Border 5 5 5 5) True $ layoutHook def

myStartupHook :: X()
myStartupHook = do
  spawn "$HOME/.config/polybar/launch.sh &"
  spawnOnce "feh --bg-fill Pictures/animated_shop.gif &"
  spawnOnce "wal --backend colorthief -i Pictures/led.jpg -n -o scripts/reload_dunst.sh &"
  spawnOnce "$HOME/.local/bin/arbtt-capture &" 


main :: IO()
main = xmonad . ewmh $ docks def
      { layoutHook = avoidStruts . smartBorders $ myLayoutHook
      , handleEventHook = handleEventHook def <+> fullscreenEventHook
      , manageHook = foldl (<+>) mempty [insertPosition Below Newer, myManageHook, manageHook def]
      , modMask= mod4Mask -- Use Super instead of Alt
      , terminal = myTerm
      , borderWidth = 2
      , normalBorderColor  = color0
      , focusedBorderColor = color12
      , startupHook = myStartupHook
      }  `additionalKeys`
      [ ((m              , xK_Return), spawn "st")
      , ((m              , xK_d     ), spawn "rofi -show drun")
      , ((0              , xK_Print ), spawn "flameshot gui")
      , ((m .|. shiftMask, xK_q     ), kill)
      , ((m              , xK_g     ), promptSearch myXPConfig google)
      , ((m .|. shiftMask, xK_g     ), selectSearch google)
      , ((m              , xK_t     ), promptSearch myXPConfig wikipedia)
      , ((m .|. shiftMask, xK_t     ), selectSearch wikipedia)
      , ((m              , xK_y     ), promptSearch myXPConfig scholar)
      , ((m .|. shiftMask, xK_y     ), selectSearch scholar)
     ]
    where myXPConfig = greenXPConfig { 
        font = "xft:Pragmata Pro Liga:size=11",
        bgColor = background,
        fgColor = foreground
     } 
