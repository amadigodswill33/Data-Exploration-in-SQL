--WELCOME TO MY FIRST PROJECT AS A DATA ANALYST: SQL MASTERY
-- YOUR CONTRIBUTION IS WELCOME!
-- I AM AVAILABLE TO COLLABORATE WITH A TEAM FOR PROJECTS AND INTERNSHIP
-- I AM ALSO AVAILABLE FOR REMOTE JOBS

-- PROJECT HIGHLIGHT: THIS IS A DATA EXPLORATION PROJECT ON THE COVID-19 DATA SET

select *
from Portfolio_project1..['Covid Vaccination$']
order by 3,4

select *
from Portfolio_project1..['Covid death$']
order by 3,4;

--Let's select data that data we are going to be using

select location, date, total_cases, new_cases, total_deaths, population
from Portfolio_project1..['Covid death$']
order by 1,2

--Let's take a look at the total_cases vs total_deaths
--(This will show the likihood of infected people to die)

select location, date, total_cases, total_deaths, ((convert(float,total_deaths))/nullif(convert(float,total_cases),0))*100 as Death_Percentage, population
From Portfolio_project1..['Covid death$']
where location = 'Nigeria'
order by 1,2;

--Total cases vs population
--(This will give an insight of the percentage of population infected with Covid-19)

select location, date, total_cases, population, ((convert(float,total_cases))/nullif(population,0))*100 as '%_Infected_populatioin'
From Portfolio_project1..['Covid death$']
where location = 'Nigeria'
order by 1,2;

select location, Max(total_cases) as Count_TotalCases, population, Max((convert(float,total_cases))/nullif(population,0))*100 as '%_Infected_Count'
From Portfolio_project1..['Covid death$']
where continent is not null
group by location, population
order by '%_Infected_Count' desc;

--This shows Countries with Highest Death count of the population

select location, population, Max(cast(total_deaths as int)) as TotalDeathCount
From Portfolio_project1..['Covid death$']
where continent is not null
group by location, population
order by TotalDeathCount desc;

--This shows, World, Economy, Groups, Continents with Highest Death count of the population

select location, Max(cast(total_deaths as int)) as TotalDeathCount
From Portfolio_project1..['Covid death$']
where continent is null
group by location
order by TotalDeathCount desc;

---This shows Continents with Highest Death count of the population

select continent, Max(cast(total_deaths as int)) as TotalDeathCount
From Portfolio_project1..['Covid death$']
where continent is not null
group by continent
order by TotalDeathCount desc;

--This shows the Global death count

select sum(new_cases) as Count_TotalCases, sum(cast(new_deaths as int)) as TotalDeath, 
sum(cast(new_deaths as int))/sum(nullif(new_cases,0))*100 as DeathPercentage
From Portfolio_project1..['Covid death$']
where continent is not null
-- group by date
order by 1,2;


--- Looking at Total Population vs Vaccination
select D.continent, D.location, D.date, D.population, D.new_vaccinations,
sum(convert(float, D.new_vaccinations)) over (Partition by D.location order by D.location, D.date) as RollingVaccination
from Portfolio_project1..['Covid Vaccination$'] as D join
Portfolio_project1..['Covid death$'] as V
on D.location = V.location and D.date = V.date
where D.continent is not null
order by 2,3;



--- Using CTE to show the percentage of people vaccinated with date
With PopvsVac (continent, location, date, population, new_vaccinations, RollingVaccination)
as
(
select D.continent, D.location, D.date, D.population, D.new_vaccinations,
sum(convert(float, D.new_vaccinations)) over (Partition by D.location order by D.location, D.date) as RollingVaccination
--(RollingVaccination/population)*100
from Portfolio_project1..['Covid Vaccination$'] as D 
join
Portfolio_project1..['Covid death$'] as V
on D.location = V.location
and D.date = V.date
where D.continent is not null
)
select *, (RollingVaccination/population)*100
from PopvsVac;


--Let's create a Temp Table to show the percentage of population vaccinated
create Table #percentagePopulationVaccinated
(
continent nvarchar(300),
location nvarchar(300),
date datetime,
population numeric,
new_vaccinations numeric,
RollingVaccination numeric
)
insert into  #percentagePopulationVaccinated

select D.continent, D.location, D.date, D.population, D.new_vaccinations,
sum(convert(float, D.new_vaccinations)) over (Partition by D.location order by D.location, D.date) as RollingVaccination
--(RollingVaccination/population)*100
from Portfolio_project1..['Covid Vaccination$'] as D 
join
Portfolio_project1..['Covid death$'] as V
on D.location = V.location
and D.date = V.date
where D.location = 'Nigeria'

select *, (RollingVaccination/population)*100 as '% Population vaccination'
from #percentagePopulationVaccinated
where location = 'Nigeria';

-- Creating VIEWS for the Percentage of population vaccinated

create view percentagePopulationVaccinated as
(
select D.continent, D.location, D.date, D.population, D.new_vaccinations,
sum(convert(float, D.new_vaccinations)) over (Partition by D.location order by D.location, D.date) as RollingVaccination
--(RollingVaccination/population)*100
from Portfolio_project1..['Covid Vaccination$'] as D 
join
Portfolio_project1..['Covid death$'] as V
on D.location = V.location
and D.date = V.date
where D.continent is not null
)


select * from percentagePopulationVaccinated;

-- INFECTION RATE
select location, population, max(total_cases) as HighestInfectionCount, Max((total_cases/population))*100 as PercentPopulationInfected
From Portfolio_project1..['Covid death$']
--where continent is not null
Group by location, population
order by PercentPopulationInfected DESC;

-- INFECTION RATE BY DATE
select location, DATE, population, max(total_cases) as HighestInfectionCount, Max((total_cases/population))*100 as PercentPopulationInfected
From Portfolio_project1..['Covid death$']
--where continent is not null
Group by location, population, DATE
order by PercentPopulationInfected DESC;

---THANK YOU FOR YOUR TIME!!!