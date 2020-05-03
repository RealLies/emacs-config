;;; init-ivy.el --- emacs完成迷你缓冲区的灵活简单工具

;;; commentary:
;; emacs启动文件(emacs完成迷你缓冲区的灵活简单工具)

;;; code:




(use-package ivy
  :defer 1
  :init
  (ivy-mode t)                                     ;; 启用ivy-mode
  (setq ivy-use-virtual-buffers t)                 ;; 当非零时,将最近的文件和/或书签添加到'ivy-switch-buffer'
  (setq enable-recursive-minibuffers t)            ;; 非零意味着在迷你缓冲区中允许迷你缓冲区命令
  (setq search-default-mode #'char-fold-to-regexp)
)


(use-package counsel
  :defer 1
  :bind
  ("M-x" . counsel-M-x)                   ;; 代替emacs自带的M-x
  ("C-x C-f" . counsel-find-file)         ;; 代替emacs自带的搜索打开文件
  ("C-x C-j" . counsel-imenu)             ;; 代替emacs自带的imenu(代码大纲)
  ("C-h b" . counsel-descbinds)           ;; 代替emacs自带的describe-bindings(显示所有已定义键的列表及其定义)
  ("C-h f" . counsel-describe-function)   ;; 代替emacs自带的describe-function(显示function(函数/方法)完整文档)
  ("C-h v" . counsel-describe-variable)   ;; 代替eamcs自带的describe-variable(显示variable(变量)的完整文档)
  ("C-h a" . counsel-apropos)             ;; 代替emacs自带的apropos-command(显示匹配的命令文档)
  ("M-y" . counsel-yank-pop)              ;; 代替emacs自带的yank-pop(删除该文本并在其位置插入不同的一段被杀死的文本)
  ("C-c l t" . counsel-load-theme)        ;; 代替emacs自带的load-theme(变换主题)
  ("C-h S" . counsel-info-lookup-symbol)  ;; 代替emacs自带的info-lookup-symbol(显示匹配的符号文档)
  ("C-c m r" . counsel-mark-ring)         ;; 代替emacs自带的pop-to0mark-command(快速跳转到以前光标位置)
  ("C-c f l" . counsel-find-library)      ;; 代替emacs自带的find-libray( co找到LIBRARYEmacs Lisp源代码)
  ("C-x r b" . counsel-bookmark)          ;; 代替emacs自带的bookmark-jump(跳转到书签)
  ("C-x b" . counsel-ibuffer)             ;; 代替emacs自带的ido-swiper-buffer(跳转到缓冲区)
  ("C-x C-b" . counsel-switch-buffer)     ;; 切换到选择的缓冲区(并提供预览)
  :init
  )


(use-package swiper
  :defer 1
  :bind
  ("C-c s w" . swiper-isearch-thing-at-point)
  :init
)

(provide 'init-ivy)
;;; init-ivy.el ends here
