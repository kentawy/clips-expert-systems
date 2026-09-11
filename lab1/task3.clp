(defrule find-day
    (Today is ?day)
=>
    (printout t "Today is " ?day crlf)
)