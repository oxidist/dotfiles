--    _  __ __  ___                      __
--   | |/ //  |/  /___  ____  ____ _____/ /
--   |   // /|_/ / __ \/ __ \/ __ `/ __  /
--  /   |/ /  / / /_/ / / / / /_/ / /_/ /
-- /_/|_/_/  /_/\____/_/ /_/\__,_/\__,_/

import XMonad
import XMonad.Hooks.ManageDocks (docks, avoidStruts, manageDocks)
import XMonad.Hooks.EwmhDesktops (ewmh, fullscreenEventHook)
import XMonad.Hooks.InsertPosition (insertPosition, Focus(Newer), Position(Above))
import XMonad.Layout.Spacing (spacingWithEdge, Border(Border))
import XMonad.Layout.NoBorders (smartBorders)
import XMonad.Util.EZConfig (additionalKeys)
import XMonad.Util.SpawnOnce (spawnOnce)
import XMonad.Actions.WindowGo (raiseEditor)
import XMonad.Actions.Search (SearchEngine, searchEngine, searchEngineF, google, scholar, wikipedia, selectSearch, promptSearch)
import XMonad.Prompt (greenXPConfig, XPConfig (font, bgColor, fgColor, historyFilter, height))
import qualified XMonad.StackSet as W (sink)
import System.Exit
import Colors

spaceToPlus :: Char -> Char
spaceToPlus ' ' = '+'
spaceToPlus x = x

searchFunction :: String -> String
searchFunction s = "http://libgen.is/search.php?req=" ++ map spaceToPlus s ++ "&lg_topic=libgen&open=0&view=simple&res=25&phrase=1&column=def"

libgen = searchEngineF "LibGen" searchFunction
scihub = searchEngineF "SciHub" ((++) "https://sci-hub.se/")


myManageHook = composeAll [ className =? "flameshot" --> doFloat
                          , className =? "tmp_edit" --> doFloat
                          , (className =? "firefox" <&&> resource =? "Dialog") --> doFloat
                          , moveC "emacs" "3"
                          , moveC "vim" "2"
                          , moveC "firefox" "1"
                          , moveC "chat" "3"
                          ]
                            where moveC c w = className =? c --> doShift w

myStartupHook :: X()
myStartupHook = do
  spawnOnce "xrdb -load .Xresources"
  spawn "$HOME/.config/polybar/launch.sh &"
  spawnOnce "firefox &"
  -- spawnOnce "st -c \"vim\" -e \"vim\""
  spawnOnce "st -c \"chat\" -e sh -c \"sh ~/scripts/auto-tmux.sh\""
  spawnOnce "emacsclient -c &"

main :: IO()
main = xmonad . ewmh $ docks def
      { layoutHook = avoidStruts . smartBorders . spacingWithEdge 5 $ layoutHook def
      , handleEventHook = handleEventHook def -- <+> fullscreenEventHook
      , manageHook = mconcat [insertPosition Above Newer, myManageHook, manageHook def]
      , modMask= mod4Mask -- Use Super instead of Alt
      , terminal = "st"
      , borderWidth = 2
      , normalBorderColor  = color0
      , focusedBorderColor = color5
      , startupHook = myStartupHook
      }  `additionalKeys`
      [ ((m              , xK_Return), spawn "st")
      , ((m              , xK_d     ), spawn "rofi -modi \"drun\" -show drun")
      , ((0              , xK_Print ), spawn "flameshot gui")
      , ((m              , xK_Tab   ), spawn "sh ~/scripts/search.sh")
      , ((m .|. shiftMask, xK_q     ), kill)
      , ((m .|. shiftMask, xK_e     ), io (exitWith ExitSuccess))
      , ((m,              xK_e), raiseEditor)
      , ((m              , xK_a     ), promptSearch myXPConfig google)
      , ((m .|. shiftMask, xK_a     ), selectSearch google)
      , ((m              , xK_w     ), promptSearch myXPConfig wikipedia)
      , ((m .|. shiftMask, xK_w     ), selectSearch wikipedia)
      , ((m              , xK_y     ), promptSearch myXPConfig scholar)
      , ((m .|. shiftMask, xK_y     ), selectSearch scholar)

      , ((m              , xK_p     ), promptSearch myXPConfig libgen)
      , ((m .|. shiftMask, xK_l     ), selectSearch libgen)

      , ((m              , xK_s     ), promptSearch myXPConfig scihub)
      , ((m .|. shiftMask, xK_s     ), selectSearch scihub)

      , ((m .|. shiftMask, xK_u     ), withFocused $ windows . W.sink)
      , ((0, xK_F1),                  spawn "~/scripts/pavolume.sh --togmute")
      , ((0, xK_F2),                  spawn "~/scripts/pavolume.sh --down")
      , ((0, xK_F3),                  spawn "~/scripts/pavolume.sh --up")
      , ((0,xK_F8),                    spawn "xbacklight -inc 2")
      , ((0,xK_F7),                    spawn "xbacklight -dec 2")
      ]
    where
      m = mod4Mask
      term = "st"
      myXPConfig = greenXPConfig { font = "xft:Iosevka SS15:size=12:weight=medium"
                                 , bgColor = background
                                 , fgColor = foreground
                                 , historyFilter = const []
                                 , height = 26
                                 }
