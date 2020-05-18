;;; init-exwm.el --- emacs桌面文件

;;; commentary:
;; emacs启动文件(emacs桌面启动文件)

;;; code:

;; (use-package exwm
;;   :init
;;   (require 'exwm)
;;   (require 'exwm-config)
;;   (require 'exwm-xim)
;;   (exwm-xim-enable)
;;   ;; (exwm-config-default)
;;   (setq exwm-manage-configurations '((t managed t)))
;;   (exwm-enable)               ;; 启用/禁用exwm(enable/disable)
;;   (fringe-mode 1)             ;; 将条纹缩小到1像素

;;   ;; Global keybindings can be defined with `exwm-input-global-keys'.
;;   ;; Here are a few examples:
;;   (setq exwm-input-global-keys
;; 	`(
;;           ;; Bind "s-r" to exit char-mode and fullscreen mode.
;;           ([?\s-r] . exwm-reset)

;; 	  ;; Bind "s-&" to launch applications ('M-&' also works if the output
;;           ;; buffer does not bother you).
;;           ([?\s-d] . (lambda (command)
;; 		       (interactive (list (read-shell-command "$ ")))
;; 		       (start-process-shell-command command nil command)))
	  
;;           ;; Bind "s-0" to "s-9" to switch to a workspace by its index.
;; 	  ,@(mapcar (lambda (i)
;;                       `(,(kbd (format "s-%d" i)) .
;; 			(lambda ()
;;                           (interactive)
;;                           (exwm-workspace-switch-create ,i))))
;;                     (number-sequence 0 9))))

;;   ;;(setq display-time-default-load-average nil)
;;   (display-time-mode t)

;;   (push ?\C-\\ exwm-input-prefix-keys)   ;; 使用Ctrl + \ 切换输入法
;;   )


;; ;; 快速切换窗口
;; (use-package switch-window
;;   :ensure t
;;   :init
;;   (require 'switch-window)
;;   (global-set-key (kbd "C-x o") 'switch-window)
;;   (global-set-key (kbd "C-x 1") 'switch-window-then-maximize)
;;   (global-set-key (kbd "C-x 2") 'switch-window-then-split-below)
;;   (global-set-key (kbd "C-x 3") 'switch-window-then-split-right)
;;   (global-set-key (kbd "C-x 0") 'switch-window-then-delete)
;;   )


;; 快速切换窗口
(use-package ace-window
  :bind ("C-x o" . ace-window)
  :init
  (setq aw-dispatch-always t)
)

;; ;; 选中窗口黄金比例
;; (use-package golden-ratio
;;   :ensure t
;;   :init
;;   (require 'golden-ratio)
;;   (golden-ratio-mode 1)
;;   )


;; (use-package exwm-x
;;   :init
;;   (require 'exwm-x)
;;   (require 'exwmx-xfce)
;;   (require 'exwmx-example)
;;   (exwmx-input-set-key (kbd "s-d") 'exwmx-dmenu)
;;   (exwmx-input-set-key (kbd "C-t f") 'exwmx:web-browser)
;;   (setq exwmx-button--show-app-line nil)
;;   )











(provide 'init-exwm)
;;; init-exwm.el ends here
