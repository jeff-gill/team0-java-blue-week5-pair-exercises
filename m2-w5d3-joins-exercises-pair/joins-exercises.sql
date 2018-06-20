-- Write queries to return the following:
-- The following queries utilize the "world" database.

-- 1. The city name, country name, and city population of all cities in Europe with population greater than 1 million
-- (36 rows)
select city.name, country.name, city.population from city
join country on city.countrycode = country.code
where country.continent = 'Europe'
and city.population > 1000000
-- 2. The city name, country name, and city population of all cities in countries where French is an official language and the city population is greater than 1 million
-- (2 rows)
select city.name, country.name, city.population from city
join country on city.countrycode = country.code
join countrylanguage on country.code = countrylanguage.countrycode
where countrylanguage.language = 'French'
and countrylanguage.isofficial = true
and city.population > 1000000
-- 3. The name of the countries and continents where the language Javanese is spoken
-- (1 row)
select country.name, country.continent from country
join countrylanguage on country.code = countrylanguage.countrycode
where countrylanguage.language = 'Javanese'
-- 4. The names of all of the countries in Africa that speak French as an official language
-- (5 row)
select country.name from country
join countrylanguage on country.code = countrylanguage.countrycode
where country.continent = 'Africa'
and countrylanguage.language = 'French'
and countrylanguage.isofficial = true
-- 5. The average city population of cities in Europe
-- (average city population in Europe: 287,684)
select ROUND(avg(city.population), 0) from city
join country on city.countrycode = country.code
where country.continent = 'Europe'

-- 6. The average city population of cities in Asia
-- (average city population in Asia: 395,019)
select ROUND(avg(city.population), 0) from city
join country on city.countrycode = country.code
where country.continent = 'Asia'
-- 7. The number of cities in countries where English is an official language
-- (number of cities where English is official language: 523)
select COUNT(country.name) from city
join country on city.countrycode = country.code
join countrylanguage on country.code = countrylanguage.countrycode
where countrylanguage.language = 'English'
and countrylanguage.isofficial = true
-- 8. The average population of cities in countries where the official language is English
-- (average population of cities where English is official language: 285,809)
select ROUND(AVG(city.population), 0) from city
join country on city.countrycode = country.code
join countrylanguage on country.code = countrylanguage.countrycode
where countrylanguage.language = 'English'
and countrylanguage.isofficial = true
-- 9. The names of all of the continents and the population of the continent’s largest city
-- (6 rows, largest population for North America: 8,591,309)
select country.continent, MAX(city.population) from city
join country on city.countrycode = country.code
group by country.continent
-- 10. The names of all of the cities in South America that have a population of more than 1 million people and the official language of each city’s country
-- (29 rows)
select city.name, countrylanguage.language from city
join country on city.countrycode = country.code
join countrylanguage on country.code = countrylanguage.countrycode
where country.continent = 'South America'
and city.population > 1000000
and countrylanguage.isofficial = true


