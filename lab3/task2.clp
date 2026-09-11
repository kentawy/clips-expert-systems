; 1. Шаблон для атрибутів хмари
(deftemplate cloud-attributes
    (slot height (type INTEGER)) ; висота у метрах
    (slot appearance)            ; вигляд: купи, листи, волосся
    (slot precipitation)         ; опади: так, ні
    (slot color)                 ; колір: темно-сірий, інший
)

; 2. Правила ідентифікації на основі характеристик

; Правило для перистих хмар (вище 6000, як пучки волосся)
(defrule identify-cirrus
    (cloud-attributes (height ?h&:(> ?h 6000)) (appearance волосся))
    =>
    (printout t "Ідентифіковано: Перисті хмари (верхній ярус)" crlf)
)

; Правило для шарувато-дощових (гладкі листи, опади, темно-сірий)
(defrule identify-nimbostratus
    (cloud-attributes (appearance листи) (precipitation так) (color темно-сірий))
    =>
    (printout t "Ідентифіковано: Шарувато-дощові хмари (несуть опади)" crlf)
)

; Правило для купчасто-дощових (округлені купи, опади, темно-сірий)
(defrule identify-cumulonimbus
    (cloud-attributes (appearance купи) (precipitation так) (color темно-сірий))
    =>
    (printout t "Ідентифіковано: Купчасто-дощові хмари (несуть опади)" crlf)
)

; Правило для шаруватих хмар (до 1800 м, гладкі листи, без значних опадів)
(defrule identify-stratus
    (cloud-attributes (height ?h&:(<= ?h 1800)) (appearance листи) (precipitation ні))
    =>
    (printout t "Ідентифіковано: Шаруваті хмари (нижній ярус)" crlf)
)

; Правило для купчастих хмар (великі округлені купи, без опадів)
(defrule identify-cumulus
    (cloud-attributes (appearance купи) (precipitation ні))
    =>
    (printout t "Ідентифіковано: Купчасті хмари" crlf)
)

; 3. Вхідні дані (тестовий факт для перевірки)
(deffacts initial-cloud
    ; Сюди вносимо атрибути хмари, яку хочемо перевірити
    (cloud-attributes (height 1500) (appearance листи) (precipitation ні) (color білий))
)