--    _  __ __  ___                      __
--   | |/ //  |/  /___  ____  ____ _____/ /
--   |   // /|_/ / __ \/ __ \/ __ `/ __  /
--  /   |/ /  / / /_/ / / / / /_/ / /_/ /
-- /_/|_/_/  /_/\____/_/ /_/\__,_/\__,_/

import XMonad
import XMonad.Hooks.ManageDocks (docks, avoidStruts, manageDocks)
import XMonad.Hooks.EwmhDesktops (ewmh, fullscreenEventHook)
import XMonad.Hooks.InsertPosition (insertPosition, Focus(Newer), Position(Above))
import XMonad.Layout.Spacing (spacingRaw, Border(Border))
import XMonad.Layout.NoBorders (smartBorders)
import XMonad.Util.EZConfig (additionalKeys)
import XMonad.Util.SpawnOnce (spawnOnce)
import XMonad.Actions.Search (google, scholar, wikipedia, selectSearch, promptSearch)
import XMonad.Prompt (greenXPConfig, XPConfig (font, bgColor, fgColor, historySize))
import qualified XMonad.StackSet as W (sink)
import Colors

myManageHook = composeAll [ className =? "flameshot" --> doFloat
                          , moveC "vim" "2"
                          , moveC "firefox" "1"
                          ]
                            where moveC c w = className =? c --> doShift w

myStartupHook :: X()
myStartupHook = do
  spawn "$HOME/.config/polybar/launch.sh &"
  spawnOnce "firefox &"
  spawnOnce "st -c \"vim\" -e \"vim\""

main :: IO()
main = xmonad . ewmh $ docks def
      { layoutHook = avoidStruts . smartBorders . spacingRaw True (Border 2 2 2 2) True (Border 2 2 2 2) True $ layoutHook def
      , handleEventHook = handleEventHook def <+> fullscreenEventHook
      , manageHook = mconcat [insertPosition Above Newer, myManageHook, manageHook def]
      , modMask= mod4Mask -- Use Super instead of Alt
      , terminal = "st"
      , borderWidth = 2
      , normalBorderColor  = color0
      , focusedBorderColor = color4
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
      , ((m .|. shiftMask, xK_u     ), withFocused $ windows . W.sink)
      ]
    where
      m = mod4Mask
      myXPConfig = greenXPConfig { font = "xft:Pragmata Pro Liga:size=11"
                                 , bgColor = background
                                 , fgColor = foreground
                                 , historySize = 10
                                 }
