/*3.1*/
select * from almacenes;
/*3.2*/
select * from cajas
where valor>150;
/*3.3*/
select contenido from cajas
group by contenido;
/*3.4*/
select almacen, avg(valor) from cajas;
/*3.5*/
select avg(valor) from cajas
group by almacen;
/*3.6*/
select almacen from cajas
group by almacen
having avg(valor)>150;
/*3.7*/
select numreferencia, lugar from cajas,almacenes
where cajas.ALMACEN = almacenes.CODIGO;
/*3.8*/
select almacen, count(numreferencia) from cajas
group by almacen;
/*3.9*/
select codigo from almacenes
where capacidad < (select count(numreferencia) from cajas where almacen= codigo);
/*3.10*/
select numreferencia from cajas
where almacen 
in (select codigo from almacenes where lugar='Bilbao');
/*3.11*/
insert into almacenes (codigo,lugar,capacidad) values 
(6,'Barcelona',3);
/*3.12*/
insert into cajas (numreferencia,contenido,valor,almacen) values 
('H5RT','Papel',200,2);
/*3.13*/
update cajas set valor=valor*1.15 where numreferencia<>'';
/*3.14 ERROR 1093 */
update cajas set valor=valor*0.80 
where valor > (select avg(valor) from cajas);
/*3.15*/
delete from cajas where valor<100 and numreferencia<>''; 
/*3.16 ERROR 1093 */
delete from cajas where almacen in 
(select codigo from almacenes where capacidad < (
select count(numreferencia) from cajas where almacen= codigo));