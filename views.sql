--Ej1

DROP VIEW IF EXISTS v_ListCheese;

CREATE VIEW v_ListCheese AS
    SELECT
        productos.producto,
        productos.precio_unidad
    FROM
        productos
    WHERE EXISTS(
        SELECT 
            * 
        FROM 
            categorias 
        WHERE
            categorias.id = productos.categoria_id
            AND
            categorias.categoria LIKE 'LACTEOS'
    )
;

--Ej2

DROP VIEW IF EXISTS v_ListGermanClients;

CREATE VIEW v_ListGermanClients AS
    SELECT
        clientes.id,
        clientes.codigo,
        clientes.empresa
    FROM
        clientes
    WHERE
        pais LIKE 'alemania'
;

--Ej3

