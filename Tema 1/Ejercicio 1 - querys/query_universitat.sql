-- 1.Retorna un llistat amb el primer cognom, segon cognom i el nom de tots els/les alumnes. El llistat haurà d'estar ordenat alfabèticament de menor a major pel primer cognom, segon cognom i nom.
select apellido1, apellido2, nombre from persona where tipo = 'alumno' order by apellido1 asc, apellido2 asc, nombre asc;

-- 2.Esbrina el nom i els dos cognoms dels/les alumnes que no han donat d'alta el seu número de telèfon en la base de dades.
select apellido1, apellido2, nombre from persona where tipo = 'alumno' and telefono is null;

-- 3.Retorna el llistat dels/les alumnes que van néixer en 1999.
select apellido1, apellido2, nombre from persona where tipo = 'alumno' and year(fecha_nacimiento) = 1999;

-- 4.Retorna el llistat de professors/es que no han donat d'alta el seu número de telèfon en la base de dades i a més el seu NIF acaba en K.
select apellido1, apellido2, nombre, nif from persona WHERE tipo = 'profesor' AND telefono IS NULL AND nif LIKE '%K';

-- 5.Retorna el llistat de les assignatures que s'imparteixen en el primer quadrimestre, en el tercer curs del grau que té l'identificador 7.
select asignatura.nombre from asignatura join grado on asignatura.id_grado = grado.id where grado.id = 7 and asignatura.curso = 3 and asignatura.cuatrimestre = 1;

-- 6.Retorna un llistat dels professors/es juntament amb el nom del departament al qual estan vinculats/des. El llistat ha de retornar quatre columnes, primer cognom, segon cognom, nom i nom del departament. El resultat estarà ordenat alfabèticament de menor a major pels cognoms i el nom.
select p.apellido1, p.apellido2, p.nombre, departamento.nombre from persona p  join profesor on p.id = profesor.id_profesor join departamento on profesor.id_departamento = departamento.id where tipo = 'profesor' order by p.apellido1 asc, p.apellido2 asc, p.nombre asc;

-- 7.Retorna un llistat amb el nom de les assignatures, any d'inici i any de fi del curs escolar de l'alumne/a amb NIF 26902806M.
SELECT asignatura.nombre, curso_escolar.anyo_inicio, curso_escolar.anyo_fin FROM persona JOIN alumno_se_matricula_asignatura ON persona.id = alumno_se_matricula_asignatura.id_alumno JOIN asignatura ON alumno_se_matricula_asignatura.id_asignatura = asignatura.id JOIN curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id WHERE persona.nif = '26902806M';

-- 8.Retorna un llistat amb el nom de tots els departaments que tenen professors/es que imparteixen alguna assignatura en el Grau en Enginyeria Informàtica (Pla 2015).
SELECT d.nombre FROM departamento d JOIN profesor p ON d.id = p.id_departamento JOIN asignatura a ON p.id_profesor = a.id_profesor JOIN grado g ON a.id_grado = g.id WHERE g.nombre = 'Ingeniería Informática';

-- 9.Retorna un llistat amb tots els/les alumnes que s'han matriculat en alguna assignatura durant el curs escolar 2018/2019.
SELECT distinct p.apellido1, p.apellido2, p.nombre FROM persona p JOIN alumno_se_matricula_asignatura m ON p.id = m.id_alumno JOIN asignatura a ON m.id_asignatura = a.id JOIN curso_escolar c ON m.id_curso_escolar = c.id WHERE c.anyo_inicio <= 2018 AND c.anyo_fin >= 2019;


-- 10.Retorna un llistat amb els noms de tots els professors/es i els departaments que tenen vinculats/des. El llistat també ha de mostrar aquells professors/es que no tenen cap departament associat. El llistat ha de retornar quatre columnes, nom del departament, primer cognom, segon cognom i nom del professor/a. El resultat estarà ordenat alfabèticament de menor a major pel nom del departament, cognoms i el nom.
SELECT d.nombre AS departamento, p.apellido1, p.apellido2, p.nombre FROM persona p LEFT JOIN profesor prof ON p.id = prof.id_profesor LEFT JOIN departamento d ON prof.id_departamento = d.id WHERE p.tipo = 'profesor' ORDER BY departamento ASC, p.apellido1 ASC, p.apellido2 ASC, p.nombre ASC;

-- 11.Retorna un llistat amb els professors/es que no estan associats a un departament.
SELECT p.apellido1, p.apellido2, p.nombre FROM persona p LEFT JOIN profesor  ON p.id = profesor.id_profesor JOIN departamento d ON profesor.id_departamento = d.id WHERE d.id IS NULL;

-- 12.Retorna un llistat amb els departaments que no tenen professors/es associats.
SELECT d.nombre AS departamento FROM departamento d LEFT JOIN profesor p ON d.id = p.id_departamento WHERE p.id_profesor IS NULL;

-- 13.Retorna un llistat amb els professors/es que no imparteixen cap assignatura.
SELECT p.apellido1, p.apellido2, p.nombre FROM persona p LEFT JOIN asignatura ON p.id = asignatura.id_profesor WHERE asignatura.id IS NULL AND p.tipo = 'profesor';

-- 14.Retorna un llistat amb les assignatures que no tenen un professor/a assignat.
SELECT a.nombre FROM asignatura a LEFT JOIN persona p ON a.id_profesor = p.id WHERE a.id_profesor IS NULL;

-- 15.Retorna un llistat amb tots els departaments que no han impartit assignatures en cap curs escolar.



-- 16.Retorna el nombre total d'alumnes que hi ha.
SELECT COUNT(*) AS total_alumnos FROM persona WHERE tipo = 'alumno';

-- 17.Calcula quants/es alumnes van néixer en 1999.
SELECT COUNT(*) AS total_alumnos_nacidos_1999 FROM persona WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;

-- 18.Calcula quants/es professors/es hi ha en cada departament. El resultat només ha de mostrar dues columnes, una amb el nom del departament i una altra amb el nombre de professors/es que hi ha en aquest departament. El resultat només ha d'incloure els departaments que tenen professors/es associats i haurà d'estar ordenat de major a menor pel nombre de professors/es.
SELECT d.nombre AS departament, COUNT(p.id_profesor) AS num_professors FROM departamento d JOIN profesor p ON d.id = p.id_departamento GROUP BY d.nombre ORDER BY num_professors DESC;

-- 19.Retorna un llistat amb tots els departaments i el nombre de professors/es que hi ha en cadascun d'ells. Té en compte que poden existir departaments que no tenen professors/es associats/des. Aquests departaments també han d'aparèixer en el llistat.
SELECT d.nombre AS departament, COUNT(p.id_profesor) AS num_professors FROM departamento d LEFT JOIN profesor p ON d.id = p.id_departamento GROUP BY d.nombre ORDER BY num_professors DESC;

-- 20.Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun. Té en compte que poden existir graus que no tenen assignatures associades. Aquests graus també han d'aparèixer en el llistat. El resultat haurà d'estar ordenat de major a menor pel nombre d'assignatures.
SELECT g.nombre AS grado, COUNT(a.id) AS num_asignaturas FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY g.nombre ORDER BY num_asignaturas DESC;

-- 21.Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun, dels graus que tinguin més de 40 assignatures associades.
SELECT g.nombre AS grado, COUNT(a.id) AS num_asignaturas FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY g.nombre HAVING COUNT(a.id) > 40 ORDER BY num_asignaturas DESC;

-- 22.Retorna un llistat que mostri el nom dels graus i la suma del nombre total de crèdits que hi ha per a cada tipus d'assignatura. El resultat ha de tenir tres columnes: nom del grau, tipus d'assignatura i la suma dels crèdits de totes les assignatures que hi ha d'aquest tipus.
SELECT g.nombre AS grado, a.tipo AS tipo_asignatura, SUM(a.creditos) AS suma_creditos FROM grado g JOIN asignatura a ON g.id = a.id_grado GROUP BY g.nombre, a.tipo ORDER BY g.nombre, a.tipo;