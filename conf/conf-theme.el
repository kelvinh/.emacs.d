;-------------------------------------------------------------------------------
; ******* theme config *******
;        Author:  Kelvin Hu
;       Created:  05/07/2012
; Last Modified:  10/29/2014
;-------------------------------------------------------------------------------

(require 'cl)
(require 'util-common)

;; molokai theme ported from vim
;; (load-theme 'molokai t)
;; (load-theme 'afternoon t)

;; popular solarized theme
;; (load-theme 'solarized-dark t)
;; (load-theme 'solarized-light t)

;; sanityinc solarized theme
(load-theme 'sanityinc-solarized-dark t)
;; (load-theme 'sanityinc-solarized-light t)

;; sanityinc tomorrow theme
;; (load-theme 'sanityinc-tomorrow-bright t)
;; (load-theme 'sanityinc-tomorrow-eighties t)
;; (load-theme 'sanityinc-tomorrow-night t)
;; (load-theme 'sanityinc-tomorrow-day t)
;; (load-theme 'sanityinc-tomorrow-blue t)

;;; set default display font
(when (display-graphic-p)
  (set-face-font 'default
                 (if is-os-mac
                     (font-candidate "PragmataPro-14"
                                     "Courier New-14")
                   (font-candidate "PragmataPro-12"
                                   "Droid Sans Mono-10.5"
                                   "WenQuanYi Micro Hei Mono-10.5"
                                   "Consolas-10.5"
                                   "Source Code Pro-10.5"))))

;;; set special font for Chinese
(when (display-graphic-p)
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font)
                      charset
                      (if is-os-mac
                          (font-candidate "Heiti SC-14")
                        (font-candidate "Microsoft Yahei-12"
                                        "WenQuanYi Micro Hei-12")))))

;;; set frame transparency effect
(setq alpha-list '((95 70) (100 100)))

(defun loop-alpha ()
  (interactive)
  (let ((h (car alpha-list)))
    ((lambda (a ab)
       (set-frame-parameter (selected-frame) 'alpha (list a ab))
       (add-to-list 'default-frame-alist (cons 'alpha (list a ab))))
     (car h) (car (cdr h)))
    (setq alpha-list (cdr (append alpha-list (list h))))))

;;; do not make frame transparency, it looks cool, but is useless
;; (loop-alpha)


(provide 'conf-theme)
