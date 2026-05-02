SELECT
    p.id,
    p.p_name,
    p.address

FROM
    Person p, 
    Customer c, 
    Animal an, 
    Appointment app

WHERE
    -- This connects a person to a customer
    p.id = c.id
    
    -- This connects a customer to the pet they own
    AND c.id = an.id
    -- This connects a pet to its visits
    AND an.id = app.id 
    AND an.name = app.name
    
    -- This ensures the pet is younger than 10 years old
    AND an.date > '2016-05-02'
    
    -- This ensures the visit happened within the last year
    AND app.date > '2025-05-02'

GROUP BY
    p.id,
    p.p_name,
    p.address,
    an.name

HAVING
    COUNT(app.date) = 5;