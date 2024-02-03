# Declarative Programming

- eg. `SQL & Prolog`
	- A "program" is a description of the desired result
	- The interpreter figures out how to generate the result
	- Therefore, we will not choose how to compute by ourselves
- In imperative Languages such as Python & Scheme
	- A "program" is a description of computational processes
	- The interpreter carries out execution/evaluation rules

# SQL

## Basic Operation(Table)

- Most of the important action is in the `select` statement

- ```sql
	select [expression] (as [name]), [expression] (as [name]), ...;
	
	```

- Base operation

	```sql
	 sql> select "abra" as parent, "barack" as child union # union means more lines to come
	...> select "abra"          , 'clinton'              ; # ";"means the command is over
	```

	- <img src="SQL&DataBase.assets/image-20240131092308153.png" alt="image-20240131092308153" style="zoom:50%;" />

- Create a table

	- ```sql
		sql> create table test as
		...>     select 'a' as parent, 'b' as child union
		...>     select 'a'          , 'c'          union
		...>     select 'd'          , 'i'               ;
		```

	- No output(the table is saved)

- View a table 你好

	- 

	```sql
	select * from test; 
	# however, the result won't necessarily have any order
	# so, we need to add order manually
	```

- Projecting new tables from existing ones

	- ```sql
		select［columns］from［table] where［condition] order by [order]；# columns should be existing ones in the original table
		```

	- Example: 

	- `````sql
		select child from test where parent = 'a';
		`````

	- <img src="SQL&DataBase.assets/image-20240131094255133.png" alt="image-20240131094255133" style="zoom:50%;" />

## Arithmetic

- We can use calculation to get the result we want

- Example 

	- 

	```sql
	# create a table
	sql> create table lift as
	...>     select 101 as chair, 2 as single, 2 as couple union
	...>     select 102         , 0          , 3           union
	...>     select 103         , 4          , 1;
	
	# count total people number in every lift
	sql> select chair, single + 2 * couple as total_num from lift;
	
	```

	- <img src="SQL&DataBase.assets/image-20240131100810163.png" alt="image-20240131100810163" style="zoom:50%;" />

## Joining Tables

- The join of table yields all combinations of `rows in A and rows in B`

- ```sql
	-- Parents
	CREATE TABLE parents AS
	  SELECT "abraham" AS parent, "barack" AS child UNION
	  SELECT "abraham"          , "clinton"         UNION
	  SELECT "delano"           , "herbert"         UNION
	  SELECT "fillmore"         , "abraham"         UNION
	  SELECT "fillmore"         , "delano"          UNION
	  SELECT "fillmore"         , "grover"          UNION
	  SELECT "eisenhower"       , "fillmore";
	
	-- Fur
	CREATE TABLE dogs AS
	  SELECT "abraham" AS name, "long" AS fur UNION
	  SELECT "barack"         , "short"       UNION
	  SELECT "clinton"        , "long"        UNION
	  SELECT "delano"         , "long"        UNION
	  SELECT "eisenhower"     , "short"       UNION
	  SELECT "fillmore"       , "curly"       UNION
	  SELECT "grover"         , "short"       UNION
	  SELECT "herbert"        , "curly";
	```

	- ```sql
		select * from parents, dogs # basic join: use comma to separate tables
				 where child=name; # only when the name of Fur table is the same as the child in Parents table, two rows would join
		# eg. "abraham" | "barack" | "barack" |  "short" will exist
		# but "abraham" | "barack" | "fillmore" | "curly" will not
		```

## Aliases and Dot Expressions

- Two tables may share a column name; dot expressions and aliases disambiguate column values

- ```sql
	CREATE TABLE parents AS
	  SELECT "abraham" AS parent, "barack" AS child UNION
	  SELECT "abraham"          , "clinton"         UNION
	  SELECT "delano"           , "herbert"         UNION
	  SELECT "fillmore"         , "abraham"         UNION
	  SELECT "fillmore"         , "delano"          UNION
	  SELECT "fillmore"         , "grover"          UNION
	  SELECT "eisenhower"       , "fillmore";
	```

	- ```sql
		SELECT a.child AS first, b.child AS second # using dot expressions
		  FROM parents AS a, parents AS b # set aliases
		  WHERE a.parent = b.parent AND a.child < b.child; 
		```

## Difference between Union and Line Change

- Union
	- The command is not over
	- Add new parallel commands
- Line change
	- Simply change the line to make code more readable

## String Expressions

- What will the following command yield

	- `select "hello," || "world";`
	- `hello, world # combine strings together` 

- ```sql
	select "hello, world" as s;
	
	select substr(s, 4, 2) || substr(s, instr(s, " ")+1, 1)
	# name is s; start from s[4]; len=2;   find the index of first " " in s
	```



## Aggregate Functions

### Target: 

computes a value from a group of rows and return the result

### Example:

- Create a table:

	```sql
	create table animals as
	  select "dog" as kind, 4 as legs, 20 as weight union
	  select "cat"        , 4        , 10           union
	  select "ferret"     , 4        , 10           union
	  select "parrot"     , 2        , 6            union
	  select "penguin"    , 2        , 10           union
	  select "t-rex"      , 2        , 12000;
	```

- ```sql
	select max(legs) from animals;
	# the result is 4(only 4)
	```

### Usage

#### max/min/sum/avg/count

- Almost the same as in python
- Merely `count` actually tells you how many rows there are in the table, no matter what you count
	- So, the often used expression to count is `count(*)` 

#### distinct

找出不同的值

- `count(distinct <column_name>)`

	- Count how many different values there are in the column

	- For example above:

		- ```sql
			select count(distinct legs) from animals;
			# the result is 2
			```

## Group

### Target

Grouping rows together

### Usage

```sql
select [columns] from [table] group by [expression] having [expression];
```

### Example

```sql
create table animals as
  select "dog" as kind, 4 as legs, 20 as weight union
  select "cat"        , 4        , 10           union
  select "ferret"     , 4        , 10           union
  select "parrot"     , 2        , 6            union
  select "penguin"    , 2        , 10           union
  select "t-rex"      , 2        , 12000;
```

#### Basic

- Make two groups based on leg numbers

	- ```sql
		select leg, max(weight) from animals group by legs;
		```

		result:

		<img src="SQL&DataBase.assets/image-20240203142532291.png" alt="image-20240203142532291" style="zoom:25%;" />

#### `having`

Works as a filter for groups

- ```sql 
	select weight/legs, count(*) from animals group by weight/legs having count(*)>1;
	```

	- result
	- <img src="SQL&DataBase.assets/image-20240203143148881.png" alt="image-20240203143148881" style="zoom:25%;" />