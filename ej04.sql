/*4.1*/
select nombre from peliculas;
/*4.2*/
select calificacionedad from peliculas
group by calificacionedad;
/*4.3*/
select * from peliculas
where calificacionedad is null;
/*4.4*/
select * from salas
where pelicula is null;
/*4.5*/
select * from salas
left join peliculas
on salas.PELICULA=peliculas.CODIGO
where pelicula is not null;
/*4.6*/
select * from peliculas 
left join salas
on salas.PELICULA=peliculas.CODIGO
where pelicula is not null;
/*4.7*/
select nombre from peliculas 
where codigo not in
(select pelicula from salas where pelicula is not null);
/*4.8*/
insert into peliculas (codigo,nombre,calificacionedad) values 
(10,'Un, Dos , Tres',7);
/*4.9*/
update peliculas set calificacionedad=13 where calificacionedad is null and codigo>0 ;
/*4.10*/
delete from salas 
where pelicula in 
(select codigo from peliculas where calificacionedad='PG');