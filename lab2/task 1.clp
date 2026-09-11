; 1. Шаблон для відношень (батько/мати для когось)
(deftemplate relationship
    (slot type)         ; тип зв'язку (father, mother)
    (slot person)       ; ім'я людини (Tom, Susan)
    (slot related-to)   ; до кого відноситься (John)
)

; 2. Шаблон для спільних батьків
(deftemplate parents-of
    (slot child)        ; дитина
    (multislot parents) ; перелік батьків
)

; 3. Шаблон для ролей (є батьком, є матір'ю, є сином)
(deftemplate social-role
    (slot person)       ; ім'я
    (slot role)         ; роль (father, mother, son)
)

; 4. Шаблон для статі (чоловіча, жіноча)
(deftemplate gender
    (slot person)       ; ім'я
    (slot value)        ; стать (male, female)
)

; --- Формування бази фактів ---
(deffacts family-facts
    ; The father of John is Tom.
    (relationship (type father) (person Tom) (related-to John))
    
    ; The mother of John is Susan.
    (relationship (type mother) (person Susan) (related-to John))
    
    ; The parents of John are Tom and Susan.
    (parents-of (child John) (parents Tom Susan))
    
    ; Tom is a father.
    (social-role (person Tom) (role father))
    
    ; Susan is a mother.
    (social-role (person Susan) (role mother))
    
    ; John is a son.
    (social-role (person John) (role son))
    
    ; Tom is a male.
    (gender (person Tom) (value male))
    
    ; Susan is a female.
    (gender (person Susan) (value female))
    
    ; John is a male.
    (gender (person John) (value male))
)