
CREATE OR REPLACE FUNCTION ordenes_fecha(inicio date, fin date)
RETURNS SETOF integer AS
$BODY$
declare
    id_orden integer;
   
begin
    for id_orden in select Folio from Boleto 
  where Fecha between inicio and  fin
  loop
          return next id_orden;
        end loop;
        return;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION ordenes_fecha(date, date)
  OWNER TO postgres;



DROP FUNCTION entradas_de_vendedor(integer,date,date);
CREATE OR REPLACE FUNCTION entradas_de_vendedor(id_vendedor integer, inicio date, fin date)
  RETURNS float AS
$BODY$
declare
    total float;

   
begin
 select sum(costo) from boleto where Folio in (select ordenes_fecha(inicio,fin)) into total
  group by Folio ;

  return total;
    
end;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION entradas_de_vendedor(integer, date, date)
  OWNER TO postgres;