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
   dotspacemacs-default-font '("Iosevka Oxide Medium"
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
   dotspacemacs-line-numbers t
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
  (setq frame-title-format "%f")

  (setq powerline-default-separator 'arrow)
  (setq prettify-symbols-unprettify-at-point 'right-edge)

  (defun setup-iosevka-ligatures ()
    (setq prettify-symbols-alist
          (append prettify-symbols-alist
    '(;; Double-ended hyphen arrows
      ("<->" . #Xe100)
      ("<-->" . #Xe101)
      ("<--->" . #Xe102)
      ("<---->" . #Xe103)
      ("<----->" . #Xe104)
      ;; Double-ended equals arrows
      ("<=>" . #Xe105)
      ("<==>" . #Xe106)
      ("<===>" . #Xe107)
      ("<====>" . #Xe108)
      ("<=====>" . #Xe109)
      ;; Double-ended asterisk operators
      ("<**>" . #Xe10a)
      ("<***>" . #Xe10b)
      ("<****>" . #Xe10c)
      ("<*****>" . #Xe10d)
      ;; HTML comments
      ("<!--" . #Xe10e)
      ("<!---" . #Xe10f)
      ;; Three-char ops with discards
      ("<$" . #Xe110)
      ("<$>" . #Xe111)
      ("$>" . #Xe112)
      ("<." . #Xe113)
      ("<.>" . #Xe114)
      (".>" . #Xe115)
      ("<*" . #Xe116)
      ("<*>" . #Xe117)
      ("*>" . #Xe118)
      ("<\\" . #Xe119)
      ("<\\>" . #Xe11a)
      ("\\>" . #Xe11b)
      ("</" . #Xe11c)
      ("</>" . #Xe11d)
      ("/>" . #Xe11e)
      ("<\"" . #Xe11f)
      ("<\">" . #Xe120)
      ("\">" . #Xe121)
      ("<'" . #Xe122)
      ("<'>" . #Xe123)
      ("'>" . #Xe124)
      ("<^" . #Xe125)
      ("<^>" . #Xe126)
      ("^>" . #Xe127)
      ("<&" . #Xe128)
      ("<&>" . #Xe129)
      ("&>" . #Xe12a)
      ("<%" . #Xe12b)
      ("<%>" . #Xe12c)
      ("%>" . #Xe12d)
      ("<@" . #Xe12e)
      ("<@>" . #Xe12f)
      ("@>" . #Xe130)
      ("<#" . #Xe131)
      ("<#>" . #Xe132)
      ("#>" . #Xe133)
      ("<+" . #Xe134)
      ("<+>" . #Xe135)
      ("+>" . #Xe136)
      ("<-" . #Xe137)
      ("<->" . #Xe138)
      ("->" . #Xe139)
      ("<!" . #Xe13a)
      ("<!>" . #Xe13b)
      ("!>" . #Xe13c)
      ("<?" . #Xe13d)
      ("<?>" . #Xe13e)
      ("?>" . #Xe13f)
      ("<|" . #Xe140)
      ("<|>" . #Xe141)
      ("|>" . #Xe142)
      ("<:" . #Xe143)
      ("<:>" . #Xe144)
      (":>" . #Xe145)
      ;; Colons
      ("::" . #Xe146)
      (":::" . #Xe147)
      ("::::" . #Xe148)
      ;; Arrow-like operators
      ("->" . #Xe149)
      ("->-" . #Xe14a)
      ("->--" . #Xe14b)
      ("->>" . #Xe14c)
      ("->>-" . #Xe14d)
      ("->>--" . #Xe14e)
      ("->>>" . #Xe14f)
      ("->>>-" . #Xe150)
      ("->>>--" . #Xe151)
      ("-->" . #Xe152)
      ("-->-" . #Xe153)
      ("-->--" . #Xe154)
      ("-->>" . #Xe155)
      ("-->>-" . #Xe156)
      ("-->>--" . #Xe157)
      ("-->>>" . #Xe158)
      ("-->>>-" . #Xe159)
      ("-->>>--" . #Xe15a)
      (">-" . #Xe15b)
      (">--" . #Xe15c)
      (">>-" . #Xe15d)
      (">>--" . #Xe15e)
      (">>>-" . #Xe15f)
      (">>>--" . #Xe160)
      ("=>" . #Xe161)
      ("=>=" . #Xe162)
      ("=>==" . #Xe163)
      ("=>>" . #Xe164)
      ("=>>=" . #Xe165)
      ("=>>==" . #Xe166)
      ("=>>>" . #Xe167)
      ("=>>>=" . #Xe168)
      ("=>>>==" . #Xe169)
      ("==>" . #Xe16a)
      ("==>=" . #Xe16b)
      ("==>==" . #Xe16c)
      ("==>>" . #Xe16d)
      ("==>>=" . #Xe16e)
      ("==>>==" . #Xe16f)
      ("==>>>" . #Xe170)
      ("==>>>=" . #Xe171)
      ("==>>>==" . #Xe172)
      (">=" . #Xe173)
      (">==" . #Xe174)
      (">>=" . #Xe175)
      (">>==" . #Xe176)
      (">>>=" . #Xe177)
      (">>>==" . #Xe178)
      ("<-" . #Xe179)
      ("-<-" . #Xe17a)
      ("--<-" . #Xe17b)
      ("<<-" . #Xe17c)
      ("-<<-" . #Xe17d)
      ("--<<-" . #Xe17e)
      ("<<<-" . #Xe17f)
      ("-<<<-" . #Xe180)
      ("--<<<-" . #Xe181)
      ("<--" . #Xe182)
      ("-<--" . #Xe183)
      ("--<--" . #Xe184)
      ("<<--" . #Xe185)
      ("-<<--" . #Xe186)
      ("--<<--" . #Xe187)
      ("<<<--" . #Xe188)
      ("-<<<--" . #Xe189)
      ("--<<<--" . #Xe18a)
      ("-<" . #Xe18b)
      ("--<" . #Xe18c)
      ("-<<" . #Xe18d)
      ("--<<" . #Xe18e)
      ("-<<<" . #Xe18f)
      ("--<<<" . #Xe190)
      ("<=" . #Xe191)
      ("=<=" . #Xe192)
      ("==<=" . #Xe193)
      ("<<=" . #Xe194)
      ("=<<=" . #Xe195)
      ("==<<=" . #Xe196)
      ("<<<=" . #Xe197)
      ("=<<<=" . #Xe198)
      ("==<<<=" . #Xe199)
      ("<==" . #Xe19a)
      ("=<==" . #Xe19b)
      ("==<==" . #Xe19c)
      ("<<==" . #Xe19d)
      ("=<<==" . #Xe19e)
      ("==<<==" . #Xe19f)
      ("<<<==" . #Xe1a0)
      ("=<<<==" . #Xe1a1)
      ("==<<<==" . #Xe1a2)
      ("=<" . #Xe1a3)
      ("==<" . #Xe1a4)
      ("=<<" . #Xe1a5)
      ("==<<" . #Xe1a6)
      ("=<<<" . #Xe1a7)
      ("==<<<" . #Xe1a8)
      ;; Monadic operators
      (">=>" . #Xe1a9)
      (">->" . #Xe1aa)
      (">-->" . #Xe1ab)
      (">==>" . #Xe1ac)
      ("<=<" . #Xe1ad)
      ("<-<" . #Xe1ae)
      ("<--<" . #Xe1af)
      ("<==<" . #Xe1b0)
      ;; Composition operators
      (">>" . #Xe1b1)
      (">>>" . #Xe1b2)
      ("<<" . #Xe1b3)
      ("<<<" . #Xe1b4)
      ;; Lens operators
      (":+" . #Xe1b5)
      (":-" . #Xe1b6)
      (":=" . #Xe1b7)
      ("+:" . #Xe1b8)
      ("-:" . #Xe1b9)
      ("=:" . #Xe1ba)
      ("=^" . #Xe1bb)
      ("=+" . #Xe1bc)
      ("=-" . #Xe1bd)
      ("=*" . #Xe1be)
      ("=/" . #Xe1bf)
      ("=%" . #Xe1c0)
      ("^=" . #Xe1c1)
      ("+=" . #Xe1c2)
      ("-=" . #Xe1c3)
      ("*=" . #Xe1c4)
      ("/=" . #Xe1c5)
      ("%=" . #Xe1c6)
      ;; Logical
      ("/\\" . #Xe1c7)
      ("\\/" . #Xe1c8)
      ;; Semigroup/monoid operators
      ("<>" . #Xe1c9)
      ("<+" . #Xe1ca)
      ("<+>" . #Xe1cb)
      ("+>" . #Xe1cc))
                  ))))

  (defun refresh-pretty ()
    (prettify-symbols-mode -1)
    (prettify-symbols-mode +1))

  ;; Hooks for modes in which to install the Iosevka ligatures
  (mapc (lambda (hook)
          (add-hook hook (lambda () (setup-iosevka-ligatures) (refresh-pretty))))
        '(text-mode-hook
          prog-mode-hook))
  (global-prettify-symbols-mode +1)
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
    ("dcdd1471fde79899ae47152d090e3551b889edf4b46f00df36d653adc2bf550d" "9c92546512e0ce48c2a8af0f36e8c394b95ac6af5c35dcfe28658a04d37b5bb5" "936f5c46c518f88846361f83d8d31d38523b94005d287305c80d82c78eb461e4" "715f5e71b43cff5194dc0e89cda0aaebab9cb8ed73791ca887d41e794e3dadd6" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "55c2c0d811cdecd311ebe27f82b24a5410d38c1ff6117c91e5ba88031829ee06" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(elcord-display-elapsed nil)
 '(elcord-show-small-icon nil)
 '(elcord-use-major-mode-as-main-icon t)
 '(evil-want-Y-yank-to-eol nil)
 '(org-agenda-files nil)
 '(package-selected-packages
   (quote
    (dracula-theme web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc coffee-mode yaml-mode mmm-mode markdown-toc markdown-mode gh-md web-mode tagedit slim-mode scss-mode sass-mode pug-mode haml-mode emmet-mode company-web web-completion-data smeargle orgit magit-gitflow magit-popup gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link evil-magit magit git-commit with-editor transient vimrc-mode dactyl-mode spaceline-all-the-icons all-the-icons memoize dashboard page-break-lines fuzzy company-statistics company-cabal company-anaconda auto-yasnippet ac-ispell auto-complete evil-anzu anzu evil proof-general auctex elcord hasklig-mode yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode dash-functional cython-mode anaconda-mode pythonic intero flycheck hlint-refactor hindent haskell-snippets yasnippet company-ghci company-ghc ghc company haskell-mode cmm-mode spinner evil-visualstar evil-visual-mark-mode evil-tutor evil-surround evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state iedit evil-exchange evil-ediff evil-args ws-butler winum which-key wgrep volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline smex smartparens restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint ivy-hydra indent-guide hydra lv hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-make google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-unimpaired evil-search-highlight-persist highlight evil-numbers evil-nerd-commenter evil-escape goto-chg eval-sexp-fu elisp-slime-nav dumb-jump popup f dash s diminish define-word counsel-projectile projectile pkg-info epl counsel swiper ivy column-enfarce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed async aggressive-indent ace-window ace-link avy)))
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
