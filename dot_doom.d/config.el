;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

; https://emacs.stackexchange.com/a/52921
(after! magit
  (setq magit-diff-refine-hunk 'all))

; https://stackoverflow.com/a/2536694
(add-hook 'magit-mode-hook
  (lambda()
    (hl-line-mode 0))
  't)

;; https://www.reddit.com/r/emacs/comments/jqeskb/how_can_i_set_themes_depending_on_time_of_the_day/gbp4671/
(defun y/auto-update-theme ()
  "depending on time use different theme"
  ;; very early => gruvbox-light, solarized-light, nord-light
  (let* ((hour (nth 2 (decode-time (current-time))))
         (theme (cond ((<= 7 hour 8)   'doom-one-light)
                      ((= 9 hour)      'doom-one-light)
                      ((<= 10 hour 16) 'doom-one-light)
                      ((<= 17 hour 18) 'doom-one)
                      ((<= 19 hour 22) 'doom-one)
                      (t               'doom-one))))
    (when (not (equal doom-theme theme))
      (setq doom-theme theme)
      (load-theme doom-theme t))
    ;; run that function again next hour
    (run-at-time (format "%02d:%02d" (+ hour 1) 0) nil 'y/auto-update-theme)))

(y/auto-update-theme)
