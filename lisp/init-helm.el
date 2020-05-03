;;; init-helm.el --- init-helm 设置helm文件

;;; commentary:
;;  emacs启动文件(helm设置文件)

;;; code:


(use-package helm
  :defer 2
  :bind
  ("M-x" . helm-M-x)
  ("C-x C-f" . helm-find-files)
  :init
  (setq helm-mode t)
)


(use-package helm-swoop
  :defer 1
  :bind
  ("C-c M-j" . helm-swoop)
  ("C-c smartparens-javascript" . helm-multi-swoop)
  :init
  (require 'helm)
  (setq helm-swoop-use-line-number-face t) ;;启用模糊查找
  )



(provide 'init-helm)
;;; init-helm.el ends here
