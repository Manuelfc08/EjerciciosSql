--1 .Devuelve todas las películas
SELECT * FROM PUBLIC.MOVIES;


--2. Devuelve todos los géneros existentes
SELECT * FROM PUBLIC.GENRES;


--3. Devuelve la lista de todos los estudios de grabación que estén activos

SELECT * FROM PUBLIC.STUDIOS WHERE (STUDIO_ACTIVE=1);

--4 Devuelve una lista de los 20 últimos miembros en anotarse al videoclub

SELECT * FROM PUBLIC.MEMBERS ORDER BY MEMBER DISCHARGE DATE DESC LIMIT 20;

--5  Devuelve las 20 duraciones de películas más frecuentes, ordenados de mayor a menor.

SELECT MOVIE_DURATION, COUNT(*) AS frequency
FROM PUBLIC.MOVIES
GROUP BY MOVIE DURATION
ORDER BY frequency DESC
LIMIT 20
AS TOP_DURATIONS
ORDER BY MOVIE_DURATION DESC;

--6 Devuelve las películas del año 2000 en adelante que empiecen por la letra A.

SELECT * FROM PUBLIC.MOVIES WHERE YEAR (MOVIE LAUNCH DATE) >=2000 AND UPPER (MOVIE_NAME) LIKE 'A';

--7 Devuelve los actores nacidos un mes de Junio

SELECT * FROM PUBLIC.ACTORS WHERE MONTH(ACTOR_BIRTH_DATE)=06;

--8 Devuelve los actores nacidos cualquier mes que no sea Junio y que sigan vivos.

SELECT * FROM PUBLIC.ACTORS WHERE MONTH(ACTOR_BIRTH_DATE) != 06 AND ACTOR DEAD_DATE IS NULL;

--9 Devuelve el nombre y la edad de todos los directores menores o iguales de 50 años que estén vivos

SELECT DIRECTOR_NAME, 
       EXTRACT(YEAR FROM AGE(DIRECTOR_BIRTH_DATE)) AS EDAD
FROM PUBLIC.DIRECTORS
WHERE ACTOR_DEAD_DATE IS NULL 
      AND EXTRACT(YEAR FROM AGE(DIRECTOR_BIRTH_DATE)) <= 50;
     
--10 Devuelve el nombre y la edad de todos los actores menores de 50 años que hayan fallecido


--11 Devuelve el nombre de todos los directores menores o iguales de 40 años que estén vivos
 



--12  Indica la edad media de los directores vivos
     
SELECT AVG(EXTRACT(YEAR FROM AGE(DIRECTOR_BIRTH_DATE))) AS EDAD_MEDIA
FROM PUBLIC.DIRECTORS
WHERE DIRECTOR_DEAD_DATE IS NULL;

--13  Indica la edad media de los actores que han fallecido

SELECT AVG(EXTRACT(YEAR FROM AGE(ACTOR_BIRTH_DATE, ACTOR_DEAD_DATE))) AS EDAD_MEDIA
FROM PUBLIC.ACTORS
WHERE ACTOR_DEAD_DATE IS NOT NULL;

     
--14 Devuelve el nombre de todas las películas y el nombre del estudio que las ha realizado

SELECT MOVIE_NAME, STUDIO_NAME
FROM PUBLIC.MOVIES
JOIN PUBLIC.STUDIOS ON STUDIO_ID = STUDIO_ID;

--15 Devuelve los miembros que alquilaron al menos una película entre el año 2010 y el 2015

SELECT DISTINCT MEMBER_NAME
FROM PUBLIC.MEMBERS
JOIN PUBLIC.MEMBERS_MOVIE_RENTAL ON MEMBER_ID = MEMBER_ID
WHERE PUBLIC.MEMBERS_MOVIE_RENTAL.MEMBER_RENTAL_DATE BETWEEN '2010-01-01' AND '2015-12-31';

     
--16 Devuelve cuantas películas hay de cada país

SELECT NATIONALITY_NAME, COUNT(*) AS NUM_PELICULAS
FROM PUBLIC.MOVIES
JOIN PUBLIC.NATIONALITIES ON NATIONALITY_ID = NATIONALITY_ID
GROUP BY NATIONALITY_NAME;
  
--17 

SELECT MOVIE_NAME
FROM PUBLIC.MOVIES
JOIN PUBLIC.GENRES ON GENRE_ID = GENRE_ID
WHERE GENRE_NAME = 'Documental';

     
--18 
SELECT MOVIE_NAME
FROM PUBLIC.MOVIES
JOIN PUBLIC.DIRECTORS ON DIRECTOR_ID = DIRECTOR_ID
WHERE DIRECTOR_BIRTH_DATE >= '1980-01-01' AND DIRECTOR_DEAD_DATE IS NULL;

--19 
SELECT DISTINCT MEMBER_TOWN, DIRECTOR_BIRTH_PLACE
FROM PUBLIC.MEMBERS
JOIN PUBLIC.DIRECTORS ON MEMBER_TOWN = DIRECTOR_BIRTH_PLACE;

--20
SELECT MOVIE_NAME, MOVIE_LAUNCH_DATE
FROM PUBLIC.MOVIES
JOIN PUBLIC.STUDIOS ON STUDIO_ID = STUDIO_ID
WHERE STUDIO_ACTIVE = 'N';

