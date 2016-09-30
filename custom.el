(setq user-full-name "Honglin Yu")
(setq user-mail-address "honglin.yu@anu.edu.au")

(if (string-equal system-type "darwin")
    (setq home-directory "/Users/honglinyu/")
  (setq home-directory "/home/honglin/"))

(load-theme 'tango-dark)

(setq inhibit-startup-message t)

(toggle-scroll-bar -1)
(tool-bar-mode -1)

(column-number-mode)

(require 'recentf)
(recentf-mode 1)

(setq comint-prompt-read-only nil)
;; multi-shell
(setq shellnumber 0)
(defun newshell () (interactive) (progn 
                                          (shell)
                                          (rename-buffer (concat (number-to-string shellnumber) "shell"))
                                          (setq shellnumber (+ shellnumber 1))
                                          ))
(global-set-key "\C-x." 'newshell)
(add-hook 'shell-mode-hook 
          '(lambda () (toggle-truncate-lines 1)))
(setq comint-prompt-read-only t)

(setq x-select-enable-clipboard t)

(define-key global-map (kbd "C-=") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

;; automatically close the *Completion* buffer
; for file openning
(add-hook 'minibuffer-exit-hook 
      '(lambda ()
         (let ((buffer "*Completions*"))
           (and (get-buffer buffer)
            (kill-buffer buffer)))))
; for shell completion
(defun delete-completion-window-buffer (&optional output)
  (interactive)                                                                                                
  (dolist (win (window-list))                                                                                  
    (when (string= (buffer-name (window-buffer win)) "*Completions*")                                          
      (delete-window win)                                                                                      
      (kill-buffer "*Completions*")))                                                                          
  output)                                                                                                      
(add-hook 'comint-preoutput-filter-functions 'delete-completion-window-buffer)

;; full screen
(global-set-key [f11] 'my-fullscreen)
(defun my-fullscreen ()
  (interactive)
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(2 "_NET_WM_STATE_FULLSCREEN" 0))
  )

;; window movements
(global-set-key (kbd "C-M-p") 'windmove-up)
(global-set-key (kbd "C-M-b") 'windmove-left)
(global-set-key (kbd "C-M-n") 'windmove-down)
(global-set-key (kbd "C-M-f") 'windmove-right)

;; shrink and enlarge window
(global-set-key (kbd "M-,") 'shrink-window)
(global-set-key (kbd "M-.") 'enlarge-window)
