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

DROP VIEW IF EXISTS v_ListOrderDetails;

CREATE VIEW v_ListOrderDetails AS
    SELECT
        *,
        precio_unidad*cantidad*(1-descuento) AS 'importe'
    FROM
        detalles
;

--Ej4
DROP VIEW IF EXISTS v_ListTotalAmount;

CREATE VIEW v_ListTotalAmount AS
    SELECT
        *,
        SUM(importe) AS 'total'
    FROM
        (SELECT
            *,
            precio_unidad*cantidad*(1-descuento) AS 'importe'
        FROM
            detalles)
    AS temp
    GROUP BY
        pedido_id
    ;

