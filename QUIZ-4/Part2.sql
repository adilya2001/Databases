
-- 6-q
SELECT m.title, avg(ra.stars)avgR
from movie m
JOIN rating ra
ON m.mID
ORDER BY avgR DESC,m.title ASC;

-- 7-q
SELECT title,MIN(stars)
FROM Movie
INNER JOIN Rating Using (mID)
group by mID
order by title;

-- 8-q
select distinct name
from Reviewer,Rating
WHERE Reviewer.rID=Rating.rID
AND Rating.retingDate is null;

-- 9-q
create MATERIALIZED VIEW movie as
    select title
from movie
where mID not in(select mID from Rating);

-- 10-q
create role movierole;
GRANT SELECT, INSERT ON movie TO movierole;