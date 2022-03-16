------------------------------------------------
-- Following the following tutorial:
--     https://xmonad.org/TUTORIAL.html
-----------------------------------------------

---------------------
-- Import Modules
--------------------
import XMonad

import XMonad.Actions.Minimize

import XMonad.Hooks.EwmhDesktops -- Makes Xmonad EWMH compliant rather than only ICCCM... whatever that means
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.InsertPosition
import XMonad.Hooks.ManageHelpers

-- TODO: Experiment with XMonad.Layout.Groups
import XMonad.Layout.BoringWindows as Bw
import XMonad.Layout.Magnifier as Mag
import XMonad.Layout.Minimize
import XMonad.Layout.NoBorders
import XMonad.Layout.Renamed as Rn
import XMonad.Layout.Spacing
import XMonad.Layout.Spiral
import XMonad.Layout.ThreeColumns

import XMonad.ManageHook

import XMonad.Util.EZConfig
import XMonad.Util.Loggers
import XMonad.Util.SpawnOnce
import XMonad.Util.Ungrab

import qualified Data.Map as M -- this is how haskell wiki did key bindings without EZConfig

-------------------------------------------------------------------------------------------
-- Layouts
--
-- tiled is the standard layout (apparently, it's real name is "Tall")
-- three is a layout with three columns and the master on the left
-- threeMid is similar to three but with the master in the middle
-- magnifierOff mangifies the focused window, but the mangification level is set to 0
--  unless changed via a keybinding
------------------------------------------------------------------------------------------
myLayout =    Rn.renamed [Rn.CutWordsLeft 1] 
            $ smartSpacingWithEdge 10 
            $ smartBorders 
            $ Bw.boringWindows
            $ Rn.renamed [Rn.CutWordsLeft 1]
            $ minimize
            $ tiled ||| Mirror tiled ||| Full ||| three ||| threeMid 
    where 
        tiled   =   Rn.renamed [Rn.Replace "Tiled"]
                    $ magnifierOff 
                    $ Tall nmaster delta ratio 
        three   =   Rn.renamed [Rn.Replace "Three"]
                    $ magnifierOff 
                    $ ThreeCol nmaster delta ratio 
        threeMid=   Rn.renamed [Rn.Replace "Three Mid"]
                    $ magnifierOff
                    $  ThreeColMid nmaster delta ratio
        nmaster = 1     -- Default number of windows in the master pane
        ratio   = 1/2   -- Default proportion of screen occupied by master pane
        delta   = 3/100 -- Percent of screen to increment by when resizing panes

-----------------------------------------------------------------------------------------
-- Startup Hooks
--
-- TODO: Make setxkbmap dynamic
-----------------------------------------------------------------------------------------

keyboardLayouts = "us,gr"
keyboardVariants = ",polytonic"
keyboardLayoutKeyBinding = "shifts_toggle" -- see https://gist.github.com/jatcwang/ae3b7019f219b8cdc6798329108c9aee for all options

myStartupHook = do
    spawnOnce "nitrogen --restore &"
    spawnOnce "xscreensaver -no-splash &"
    spawnOnce "trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --width 10 --transparent true --tint 0x5f5f5f --height 18 &"
    spawnOnce "xsetroot -cursor_name left_ptr &"
    spawnOnce "/usr/lib/kdeconnectd &"
    --spawnOnce $ "setxkbmap -layout " ++ keyboardLayouts ++ " -variant " ++ keyboardVariants ++ " -option grp:" ++ keyboardLayoutKeyBinding
    spawnOnce "setxkbmap -layout us,gr -variant ,polytonic -option grp:shifts_toggle"
    spawnOnce "bluethoothctl power on"
    spawnOnce "accountable2you"

------------------------------------------------------------------------------------------
-- Manage Hooks
-- Runs when windows are created
------------------------------------------------------------------------------------------

myManageHook = composeAll
    [     className =? "Gimp"       --> doFloat
        , className =? "krita"      --> doFloat
        , className =? "ksysguard"  --> doFloat
        , isDialog                  --> doFloat
        , insertPosition Below Newer
    ]

------------------------------------------------------------------------------------------
-- Configuration
--
--   def is a default Xmonad configuration
--   By having def followed by a record (Haskell structs), the record changes any values in "def"
--   
--   For a list of special keys, see the docs for XMonad.Util.EZConfig
--
--   KEYBINDINGS:
--
--      Note: Keybinding for switching keyboard layouts is defined in the startupHooks
--          section.  TODO: Figure out how to toggle layout manually and move keybinding
--          here.
------------------------------------------------------------------------------------------
myConfig = def
    {
          modMask       = mod4Mask      -- Rebind Mod to the Super Key
        , terminal      = "xfce4-terminal"       -- Set Default Terminal
        , layoutHook    = myLayout      -- Use the custom Layouts
        , startupHook   = myStartupHook -- Use the custom startup hook
        , manageHook    = myManageHook  -- Match on certain windows
        
        -- Borders
        , normalBorderColor = "#000000"
        , focusedBorderColor= "#89ce82"
        , borderWidth       = 2
        
        -- Keys that can't be set with EZConfig
        , keys = \c -> mykeys c `M.union` keys def c 
    }
   `additionalKeysP`
    [   ----------------------------------------------------------------
        -- Programs
        ----------------------------------------------------------------
          ("M-S-z"  ,               spawn "xscreensaver-command -lock"  )
        , ("<Print>",               unGrab *> spawn "scrot -s"          )
        , ("M-f"    ,               spawn "firefox"                     )
        , ("M-d"    ,               spawn "dolphin /home/elliots/Documents/Elliot\\ Swaim/")
        , ("M-v"    ,               spawn "virtualbox &"                )
        , ("M-x"    ,               spawn "vim ~/.xmonad/xmonad.hs")
        , ("M-a"    ,               spawn "net.ankiweb.Anki"            )
        , ("M-o"    ,               spawn "onboard"                     )
        
        ----------------------------------------------------------------
        -- Layout Modification
        --
        -- Additional options for Magnifier are Mag.Toggle which toggles
        --      magnification, Mag.ToggleOff, and Mag.ToggleOn which
        --      do as their names imply.
        --      
        -- The shortcut M-b to "hide" xmobar is defined in the Main section
        ----------------------------------------------------------------

        -- Magnifier
        , ("M-S-h",         sendMessage Mag.MagnifyMore )
        , ("M-S-l",         sendMessage Mag.MagnifyLess )

        -- Boring Window
        , ("M-j",           Bw.focusUp                      )
        , ("M-k",           Bw.focusDown                    )

        -----------------------------------------------------------------
        -- System
        -----------------------------------------------------------------
        
        -- Volume
        , ("<XF86AudioRaiseVolume>",    spawn "amixer set Master unmute; amixer set Master 5%+")
        , ("<XF86AudioLowerVolume>",    spawn "amixer set Master unmute; amixer set Master 5%-")
        , ("<XF86AudioMute>",           spawn "amixer set Master toggle")
        
        , ("<XF86MonBrightnessUp>",     spawn "$HOME/.xmonad/utils/bright -a")
        , ("<XF86MonBrightnessDown>",   spawn "$HOME/.xmonad/utils/bright -s")
    ] 
    where
        mykeys (XConfig {modMask = modm}) = M.fromList $
            [     
                -----------------------------------------------------------------
                -- Programs
                -----------------------------------------------------------------
                 ((mod1Mask, xK_space), spawn "krunner --replace")
                
                ----------------------------------------------------------------
                -- Scripts
                ----------------------------------------------------------------

                , ((modm, xK_s), spawn "konsole -e '/home/elliots/Documents/Elliot Swaim/Programming and Graphics/Python/2021/Google Cloud WaveNet TTS/speak-selected.sh'") 

                -----------------------------------------------------------------
                -- Layouts
                -----------------------------------------------------------------
                
                -- Minimizing Windows
                , ((modm, xK_m), withFocused minimizeWindow)
                , ((modm .|. mod1Mask, xK_m), withLastMinimized maximizeWindowAndFocus)
                , ((modm .|. controlMask .|. mod1Mask, xK_m), withMinimized restoreAll) 
             ]
        restoreAll = mapM_ maximizeWindow
        restoreAllMinimized = minimizedWindows >>= restoreAll
        minimizedWindows = withMinimized return

----------------------------------------------------------------------------------------
-- Main
--
-- The ewmhFullscreen is what enables fullscreen.  The other ewmh has to do with some
--      window standard thing that I didn't really understand, but it should help
--      avoid issues later on (such as the fullscreen issue I was having before)
-- 
-- Each $ is like an open parenthesis that closes at the end of the line
-- The . is function composition (in this case, they could be switched for $'s)
-- Note that probably won't be relavant in the future: on older versions, xmobarProp
--      would have to be replaced with xmobar, and the syntax would be
--          "... . ewmh =<< xmobar myConfig"
--      The tutorial didn't bother explaining why.
--
-- Note that's more likely to come up, I replaced "xmobarProp" with it's definition.
--      Originally, the xmonad line just had "xmobarProp"
----------------------------------------------------------------------------------------
main :: IO()
main =    xmonad 
        . ewmh 
        $ myConfig
    where
        toggleStructsKey :: XConfig Layout -> (KeyMask, KeySym)
        toggleStructsKey XConfig{ modMask = m } = (m, xK_b)

