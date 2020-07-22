;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     javascript
     yaml
     markdown
     html
     vimscript
     python
     haskell
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ivy
     auto-completion
     ;; better-defaults
     emacs-lisp
     git
     ;; markdown
     ;; org
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     ;; spell-checking
     ;; syntax-checking
     ;; version-control
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(auctex proof-general)
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(company-tern vi-tilde-fringe exec-path-from-shell)
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner "/home/oxide/Pictures/emacs.png"
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(dracula
                         )
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Pragmata Pro Liga"
                               :size 14
                               :weight regular
                               :width normal
                               :powerline-scale 1.4)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 100
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 80
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   ;; dotspacemacs-line-numbers t
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (custom-set-variables '(spacemacs-theme-custom-colors
                          '((base . "#dbdbdb")
                            (base-dim . "#dbdbdb"))))
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  (golden-ratio-mode +1)
  (global-display-line-numbers-mode)

  (setq frame-title-format "%f")

  (setq powerline-default-separator 'arrow)

  (setq prettify-symbols-unprettify-at-point 'right-edge)
  (defconst pragmatapro-prettify-symbols-alist
    (mapcar (lambda (s)
              `(,(car s)
                .
                ,(vconcat
                  (apply 'vconcat
                        (make-list
                          (- (length (car s)) 1)
                          (vector (decode-char 'ucs #X0020) '(Br . Bl))))
                  (vector (decode-char 'ucs (cadr s))))))
            '(("[ERROR]"    #XE2C0)
              ("[DEBUG]"    #XE2C1)
              ("[INFO]"     #XE2C2)
              ("[WARN]"     #XE2C3)
              ("[WARNING]"  #XE2C4)
              ("[ERR]"      #XE2C5)
              ("[FATAL]"    #XE2C6)
              ("[TRACE]"    #XE2C7)
              ("[FIXME]"    #XE2C8)
              ("[TODO]"     #XE2C9)
              ("[BUG]"      #XE2CA)
              ("[NOTE]"     #XE2CB)
              ("[HACK]"     #XE2CC)
              ("[MARK]"     #XE2CD)
              ("# ERROR"    #XE2F0)
              ("# DEBUG"    #XE2F1)
              ("# INFO"     #XE2F2)
              ("# WARN"     #XE2F3)
              ("# WARNING"  #XE2F4)
              ("# ERR"      #XE2F5)
              ("# FATAL"    #XE2F6)
              ("# TRACE"    #XE2F7)
              ("# FIXME"    #XE2F8)
              ("# TODO"     #XE2F9)
              ("# BUG"      #XE2FA)
              ("# NOTE"     #XE2FB)
              ("# HACK"     #XE2FC)
              ("# MARK"     #XE2FD)
              ("// ERROR"   #XE2E0)
              ("// DEBUG"   #XE2E1)
              ("// INFO"    #XE2E2)
              ("// WARN"    #XE2E3)
              ("// WARNING" #XE2E4)
              ("// ERR"     #XE2E5)
              ("// FATAL"   #XE2E6)
              ("// TRACE"   #XE2E7)
              ("// FIXME"   #XE2E8)
              ("// TODO"    #XE2E9)
              ("// BUG"     #XE2EA)
              ("// NOTE"    #XE2EB)
              ("// HACK"    #XE2EC)
              ("// MARK"    #XE2ED)
              ("!!"         #XE900)
              ("!="         #XE901)
              ("!=="        #XE902)
              ("!!!"        #XE903)
              ("!≡"         #XE904)
              ("!≡≡"        #XE905)
              ("!>"         #XE906)
              ("!=<"        #XE907)
              ("#("         #XE920)
              ("#_"         #XE921)
              ("#{"         #XE922)
              ("#?"         #XE923)
              ("#>"         #XE924)
              ("##"         #XE925)
              ("#_("        #XE926)
              ("%="         #XE930)
              ("%>"         #XE931)
              ("%>%"        #XE932)
              ("%<%"        #XE933)
              ("&%"         #XE940)
              ("&&"         #XE941)
              ("&*"         #XE942)
              ("&+"         #XE943)
              ("&-"         #XE944)
              ("&/"         #XE945)
              ("&="         #XE946)
              ("&&&"        #XE947)
              ("&>"         #XE948)
              ("$>"         #XE955)
              ("***"        #XE960)
              ("*="         #XE961)
              ("*/"         #XE962)
              ("*>"         #XE963)
              ("++"         #XE970)
              ("+++"        #XE971)
              ("+="         #XE972)
              ("+>"         #XE973)
              ("++="        #XE974)
              ("--"         #XE980)
              ("-<"         #XE981)
              ("-<<"        #XE982)
              ("-="         #XE983)
              ("->"         #XE984)
              ("->>"        #XE985)
              ("---"        #XE986)
              ("-->"        #XE987)
              ("-+-"        #XE988)
              ("-\\/"       #XE989)
              ("-|>"        #XE98A)
              ("-<|"        #XE98B)
              (".."         #XE990)
              ("..."        #XE991)
              ("..<"        #XE992)
              (".>"         #XE993)
              (".~"         #XE994)
              (".="         #XE995)
              ("/*"         #XE9A0)
              ("//"         #XE9A1)
              ("/>"         #XE9A2)
              ("/="         #XE9A3)
              ("/=="        #XE9A4)
              ("///"        #XE9A5)
              ("/**"        #XE9A6)
              (":::"        #XE9AF)
              ("::"         #XE9B0)
              (":="         #XE9B1)
              (":≡"         #XE9B2)
              (":>"         #XE9B3)
              (":=>"        #XE9B4)
              (":("         #XE9B5)
              (":-("        #XE9B6)
              (":)"         #XE9B7)
              (":-)"        #XE9B8)
              (":/"         #XE9B9)
              (":\\"        #XE9BA)
              (":3"         #XE9BB)
              (":D"         #XE9BC)
              (":P"         #XE9BD)
              (":>:"        #XE9BE)
              (":<:"        #XE9BF)
              ("<$>"        #XE9C0)
              ("<*"         #XE9C1)
              ("<*>"        #XE9C2)
              ("<+>"        #XE9C3)
              ("<-"         #XE9C4)
              ("<<"         #XE9C5)
              ("<<<"        #XE9C6)
              ("<<="        #XE9C7)
              ("<="         #XE9C8)
              ("<=>"        #XE9C9)
              ("<>"         #XE9CA)
              ("<|>"        #XE9CB)
              ("<<-"        #XE9CC)
              ("<|"         #XE9CD)
              ("<=<"        #XE9CE)
              ("<~"         #XE9CF)
              ("<~~"        #XE9D0)
              ("<<~"        #XE9D1)
              ("<$"         #XE9D2)
              ("<+"         #XE9D3)
              ("<!>"        #XE9D4)
              ("<@>"        #XE9D5)
              ("<#>"        #XE9D6)
              ("<%>"        #XE9D7)
              ("<^>"        #XE9D8)
              ("<&>"        #XE9D9)
              ("<?>"        #XE9DA)
              ("<.>"        #XE9DB)
              ("</>"        #XE9DC)
              ("<\\>"       #XE9DD)
              ("<\">"       #XE9DE)
              ("<:>"        #XE9DF)
              ("<~>"        #XE9E0)
              ("<**>"       #XE9E1)
              ("<<^"        #XE9E2)
              ("<!"         #XE9E3)
              ("<@"         #XE9E4)
              ("<#"         #XE9E5)
              ("<%"         #XE9E6)
              ("<^"         #XE9E7)
              ("<&"         #XE9E8)
              ("<?"         #XE9E9)
              ("<."         #XE9EA)
              ("</"         #XE9EB)
              ("<\\"        #XE9EC)
              ("<\""        #XE9ED)
              ("<:"         #XE9EE)
              ("<->"        #XE9EF)
              ("<!--"       #XE9F0)
              ("<--"        #XE9F1)
              ("<~<"        #XE9F2)
              ("<==>"       #XE9F3)
              ("<|-"        #XE9F4)
              ("<<|"        #XE9F5)
              ("<-<"        #XE9F7)
              ("<-->"       #XE9F8)
              ("<<=="       #XE9F9)
              ("<=="        #XE9FA)
              ("=<<"        #XEA00)
              ("=="         #XEA01)
              ("==="        #XEA02)
              ("==>"        #XEA03)
              ("=>"         #XEA04)
              ("=~"         #XEA05)
              ("=>>"        #XEA06)
              ("=/="        #XEA07)
              ("=~="        #XEA08)
              ("==>>"       #XEA09)
              ("≡≡"         #XEA10)
              ("≡≡≡"        #XEA11)
              ("≡:≡"        #XEA12)
              (">-"         #XEA20)
              (">="         #XEA21)
              (">>"         #XEA22)
              (">>-"        #XEA23)
              (">>="        #XEA24)
              (">>>"        #XEA25)
              (">=>"        #XEA26)
              (">>^"        #XEA27)
              (">>|"        #XEA28)
              (">!="        #XEA29)
              (">->"        #XEA2A)
              ("??"         #XEA40)
              ("?~"         #XEA41)
              ("?="         #XEA42)
              ("?>"         #XEA43)
              ("???"        #XEA44)
              ("?."         #XEA45)
              ("^="         #XEA48)
              ("^."         #XEA49)
              ("^?"         #XEA4A)
              ("^.."        #XEA4B)
              ("^<<"        #XEA4C)
              ("^>>"        #XEA4D)
              ("^>"         #XEA4E)
              ("\\\\"       #XEA50)
              ("\\>"        #XEA51)
              ("\\/-"       #XEA52)
              ("@>"         #XEA57)
              ("|="         #XEA60)
              ("||"         #XEA61)
              ("|>"         #XEA62)
              ("|||"        #XEA63)
              ("|+|"        #XEA64)
              ("|->"        #XEA65)
              ("|-->"       #XEA66)
              ("|=>"        #XEA67)
              ("|==>"       #XEA68)
              ("|>-"        #XEA69)
              ("|<<"        #XEA6A)
              ("||>"        #XEA6B)
              ("|>>"        #XEA6C)
              ("|-"         #XEA6D)
              ("||-"        #XEA6E)
              ("~="         #XEA70)
              ("~>"         #XEA71)
              ("~~>"        #XEA72)
              ("~>>"        #XEA73)
              ("[["         #XEA80)
              ("]]"         #XEA81)
              ("\">"        #XEA90)
              ("_|_"        #XEA97)
              )))

  (defun add-pragmatapro-prettify-symbols-alist ()
    (setq prettify-symbols-alist pragmatapro-prettify-symbols-alist))

  ;; enable prettified symbols on comments
  (defun setup-compose-predicate ()
    (setq prettify-symbols-compose-predicate
          (defun my-prettify-symbols-default-compose-p (start end _match)
            "Same as `prettify-symbols-default-compose-p', except compose symbols in comments as well."
            (let* ((syntaxes-beg (if (memq (char-syntax (char-after start)) '(?w ?_))
                                    '(?w ?_) '(?. ?\\)))
                  (syntaxes-end (if (memq (char-syntax (char-before end)) '(?w ?_))
                                    '(?w ?_) '(?. ?\\))))
              (not (or (memq (char-syntax (or (char-before start) ?\s)) syntaxes-beg)
                      (memq (char-syntax (or (char-after end) ?\s)) syntaxes-end)
                      (nth 3 (syntax-ppss))))))))

  ;; main hook fn, just add to text-mode/prog-mode
  (defun prettify-hook ()
    (add-pragmatapro-prettify-symbols-alist)
    (setup-compose-predicate))
  (global-prettify-symbols-mode 1)

  (add-hook 'text-mode-hook 'prettify-hook)
  (add-hook 'prog-mode-hook 'prettify-hook)
)
  ;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#0a0814" "#f2241f" "#67b11d" "#b1951d" "#4f97d7" "#a31db1" "#28def0" "#dbdbdb"])
 '(custom-enabled-themes (quote nil))
 '(custom-safe-themes
   (quote
    ("3f3b640d180fdf40c7f77ce729663d3851ff6e9b1807fb17cd7b471998031aa3" "8e04d409b0d9c91d9d12b8d2ac4f5c71c353dea5e73b429c845f96877cc80b37" "dcdd1471fde79899ae47152d090e3551b889edf4b46f00df36d653adc2bf550d" "9c92546512e0ce48c2a8af0f36e8c394b95ac6af5c35dcfe28658a04d37b5bb5" "936f5c46c518f88846361f83d8d31d38523b94005d287305c80d82c78eb461e4" "715f5e71b43cff5194dc0e89cda0aaebab9cb8ed73791ca887d41e794e3dadd6" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "55c2c0d811cdecd311ebe27f82b24a5410d38c1ff6117c91e5ba88031829ee06" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(elcord-display-elapsed nil)
 '(elcord-show-small-icon nil)
 '(elcord-use-major-mode-as-main-icon t)
 '(evil-want-Y-yank-to-eol nil)
 '(global-linum-mode nil)
 '(org-agenda-files nil)
 '(package-selected-packages
   (quote
    ( dracula-theme web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc coffee-mode yaml-mode mmm-mode markdown-toc markdown-mode gh-md web-mode tagedit slim-mode scss-mode sass-mode pug-mode haml-mode emmet-mode company-web web-completion-data smeargle orgit magit-gitflow magit-popup gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link evil-magit magit git-commit with-editor transient vimrc-mode dactyl-mode spaceline-all-the-icons all-the-icons memoize dashboard page-break-lines fuzzy company-statistics company-cabal company-anaconda auto-yasnippet ac-ispell auto-complete evil-anzu anzu evil proof-general auctex elcord hasklig-mode yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode dash-functional cython-mode anaconda-mode pythonic intero flycheck hlint-refactor hindent haskell-snippets yasnippet company-ghci company-ghc ghc company haskell-mode cmm-mode spinner evil-visualstar evil-visual-mark-mode evil-tutor evil-surround evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state iedit evil-exchange evil-ediff evil-args ws-butler winum which-key wgrep volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline smex smartparens restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum  link-hint ivy-hydra indent-guide hydra lv hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-make google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-unimpaired evil-search-highlight-persist highlight evil-numbers evil-nerd-commenter evil-escape goto-chg eval-sexp-fu elisp-slime-nav dumb-jump popup f dash s diminish define-word counsel-projectile projectile pkg-info epl counsel swiper ivy column-enfarce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed async aggressive-indent ace-window ace-link avy)))
 '(spaceline-all-the-icons-clock-always-visible nil)
 '(spaceline-all-the-icons-primary-separator "")
 '(spaceline-all-the-icons-separator-type (quote arrow))
 '(spaceline-all-the-icons-slim-render t)
 '(spacemacs-theme-custom-colors (quote ((base . "#dbdbdb") (base-dim . "#dbdbdb")))))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Iosevka Oxide" :foundry "BE5N" :slant normal :weight normal :height 105 :width normal)))))
