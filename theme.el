(autothemer-deftheme beton "Autothemer example..."

  ;; Specify the color classes used by the theme
  ((((class color) (min-colors #xFFFFFF)))
    
    ;; Specify the color palette for each of the classes above.
   
   (beton-red    "#AA3731")
   (beton-green  "#448C27")
   (beton-blue   "#325CC0")
   (beton-purple "#9343b1")
   (beton-yellow "#cb9000")
   (beton-orange "#E06500")
   (beton-cyan   "#0083B2")


     

    ;; Forms after the face specifications are evaluated.
    ;; (palette vars can be used, read below for details.)
   (custom-theme-set-variables 'beton-name
       `(ansi-color-names-vector [,beton-red
                                  ,beton-green
                                  ,beton-blue
                                  ,beton-purple
                                  ,beton-yellow
                                  ,beton-orange
                                  ,beton-cyan])
       (default :foreground :background)
       (font-lock-string-face :foreground beton-green)
       (font-lock-comment-face :foreground ,beton-red))))
