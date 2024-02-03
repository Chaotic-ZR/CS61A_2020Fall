.read data.sql


CREATE TABLE bluedog AS
  SELECT color, pet from students WHERE pet = 'dog' AND color = 'blue';

CREATE TABLE bluedog_songs AS
    SELECT color, pet, song from students WHERE pet = 'dog' AND color = 'blue';


CREATE TABLE smallest_int AS
    SELECT time, number as smallest from students WHERE number > 2 order by number limit 20;


CREATE TABLE matchmaker AS
    SELECT a.pet as pet, a.color as color, a.song as music from students as a, students as b WHERE a.pet = b.pet AND a.color = b.color AND a.time < b.time AND a.song = b.song;


CREATE TABLE sevens AS
    SELECT number, seven as "7" from students WHERE number = 7 AND seven = True;

