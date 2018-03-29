
CREATE OR REPLACE FUNCTION busca_id_genero(genero_a_buscar character varying)
  RETURNS integer AS
$BODY$
declare
    id_peli integer;
   
begin
    select cod_peli into id_peli from pelicula
           where genero=genero_a_buscar;
    return id_peli;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION busca_id_genero(character varying)
  OWNER TO postgres;

DROP FUNCTION busca_nombre_genero(character varying);
CREATE OR REPLACE FUNCTION busca_nombre_genero(genero_a_buscar character varying)
  RETURNS SETOF character varying AS
$BODY$
declare

r pelicula%ROWTYPE;

begin
	for r.genero in select nombre from pelicula where genero=genero_a_buscar
    loop
    	return next r.genero;
	end loop;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION busca_nombre_genero(character varying)
  OWNER TO postgres;