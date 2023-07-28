/*2.1*/
select apellidos from empleados;
/*2.2*/
select apellidos from empleados
group by apellidos;
/*2.3*/
select * from empleados where apellidos='Smith';
/*2.4*/
select * from empleados where apellidos='Smith' or apellidos='Rogers';
/*2.5*/
select * from empleados where departamento=14;
/*2.6*/
select * from empleados where departamento=37 or departamento=77;
/*2.7*/
select * from empleados where apellidos like 'P%';
/*2.8*/
select sum(presupuesto) from departamentos;
/*2.9*/
select departamento, count(dni) from empleados
group by departamento;
/*2.10*/
select * from empleados, departamentos
where empleados.DEPARTAMENTO = departamentos.CODIGO;
/*2.11*/
select empleados.NOMBRE, empleados.APELLIDOS, departamentos.NOMBRE, departamentos.PRESUPUESTO from empleados, departamentos
where empleados.DEPARTAMENTO = departamentos.CODIGO;
/*2.12*/
select empleados.nombre, empleados.apellidos from empleados, departamentos
where empleados.DEPARTAMENTO = departamentos.CODIGO
and departamentos.PRESUPUESTO>60000;
/*2.13*/
select * from departamentos
where presupuesto > (select avg(presupuesto) from departamentos);
/*2.14*/
select nombre from departamentos
where codigo in (select departamento from empleados 
group by departamento having count(dni)>2);
/*2.15*/
insert into departamentos (codigo,nombre,presupuesto) values 
(11,'Calidad',40000);
insert into empleados (dni,nombre,apellidos,departamento) values 
(89267109,'Esther','Vázquez',11);
/*2.16*/
update departamentos set presupuesto = presupuesto*0.9 where codigo >0;
/*2.17*/
update empleados set departamento=14 where departamento=77;
/*2.18*/
delete from empleados where departamento=14;
/*2.19*/
delete from empleados where departamento 
in (select codigo from departamentos where presupuesto>60000);
/*2.20*/
delete from empleados where dni <> '';