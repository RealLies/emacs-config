;;; init-packages.el --- emacs插件设置管理启动文件

;;; commentary:
;; emacs启动文件(emac插件源设置和管理)

;;; code:



(setq package-enable-at-startup nil)

(package-initialize)


;; 配置插件源
(when (>= emacs-major-version 24)
  (setq package-archives '(
			   ("org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
			   ("marmalade" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/marmalade/")
			   ("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
			   ("melpa-stable" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa-stable/")
			   ("melpa" . "https://melpa.org/packages/")
			   ("melpa-cn" . "http://elpa.emacs-china.org/melpa/")
			   ("org-cn"   . "http://elpa.emacs-china.org/org/")
			   ("gnu-cn"   . "http://elpa.emacs-china.org/gnu/")
			   )
	)
  ) 


(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package)
  )


(eval-when-compile (require 'use-package))

(setq use-package-always-ensure t)


;; 自动更新插件
(use-package auto-package-update
  :if (not (daemonp))
  :custom
  (auto-package-update-interval 7) ;; in days
  (auto-package-update-prompt-before-update t)
  (auto-package-update-delete-old-versions t)
  (auto-package-update-hide-results t)
  :config
  (auto-package-update-maybe))




(provide 'init-packages)




;;; init-packages.el ends here
