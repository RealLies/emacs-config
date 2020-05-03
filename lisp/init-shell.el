;;; init_shell.el --- emacs的终端设置启动文件

;;; commentary:
;; emacs启动文件(emacs终端设置)

;;; code:
(use-package vterm
  :defer 1
  :bind
  ("C-c C-b" . vterm-other-window)
  :init
  (add-to-list 'display-buffer-alist
             '("^vterm.*"
                (display-buffer-reuse-window display-buffer-in-side-window)
                (side . bottom)
                ;;(dedicated . t) ;dedicated is supported in emacs27
                (reusable-frames . visible)
                (window-height . 0.15)))
  )


(provide 'init-shell)
;;; init-shell.el ends here
