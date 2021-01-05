#lang racket

(provide mod-name pak-folder main.rkt)

(require racket/runtime-path)

(define
  mod-name
  "MyMemeGallery")

(define-runtime-path
  pak-folder
  "BuildUnreal/WindowsNoEditor/MyMemeGallery/Content/Paks/")

(define-runtime-path
  main.rkt
  "main.rkt")


