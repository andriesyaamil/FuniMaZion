--Group 2 - BI11:
-- Muhammad Rafli (2602111181)
-- Muhammad Andrie Syaamil (2602110563)
-- Justin (2602111950)
-- Luthfi Athallah Rakasiwi (2602109574)

--1 
--Display StudioName and StaffCount (obtained from count how many distinct staff) live 
--in the same city with the studio for every staff that was born after 1990 or Staff Password length less than 8.
SELECT MS.StudioName, COUNT(DISTINCT S.StaffID) AS StaffCount
FROM MsStudio MS
JOIN MsStaff S ON MS.CityID = S.CityID
WHERE YEAR(S.StaffDOB) > 1990 OR LEN(S.StaffPassword) < 8
GROUP BY MS.StudioName;

--2
--Display CustomerName and CountAnimeNotFullfiledAgeCriteria (obtained from count anime the customer had subscribed)for
--every customer that is not fulfilled with the anime minimum age if today is January 1st, 2022, and SalesDuration is between 10 and 20.
SELECT MC.CustomerName, COUNT(MA.AnimeID) AS CountAnimeNotFullfiledAgeCriteria
FROM MsCustomer MC
JOIN SalesHeader sh ON MC.CustomerID = sh.CustomerID
JOIN SalesDetail sd ON sh.SalesID = sd.SalesID
JOIN MsAnime MA ON sd.AnimeID = MA.AnimeID
WHERE DATEDIFF(YEAR, CustomerDOB, '2022-01-01') < AnimeMinimumAge AND SalesAnimeDuration BETWEEN 10 AND 20
GROUP BY MC.CustomerName

--3
--Display StudioName, AnimeMinimumAge (obtained from the minimum of anime minimum age from all animes), 
--AnimeMaximumAge (obtained from the maximum of anime minimum age from all animes), and LatestPurchaseDateQuarter 
--(obtained from latest quarter of purchase date) for each studio name contains two or more words and anime description length is less than 10.
SELECT ST.StudioName,
    MIN(a.AnimeMinimumAge) AS AnimeMinimumAge,
    MAX(a.AnimeMinimumAge) AS AnimeMaximumAge,
    CONVERT(VARCHAR(4), DATEPART(YEAR, MAX(ph.PurchaseDate))) + '-' + CONVERT(VARCHAR(2), DATEPART(QUARTER, MAX(ph.PurchaseDate))) AS LatestPurchaseDateQuarter
FROM MsStudio ST
JOIN PurchaseHeader ph ON ST.StudioID = ph.StudioID
JOIN PurchaseDetail pd ON ph.PurchaseID = pd.PurchaseID
JOIN MsAnime a ON pd.AnimeID = a.AnimeID
GROUP BY ST.StudioName;

--4
--Display GenreName (obtained from uppercase of GenreName) and SaleCount (obtained from total sales count) 
--and SaleDurationSum (obtained from the sum of total sale duration of animes ends with “ Days”) for each 
--anime description that has at least 3 words and SaleCount is more than 5.
SELECT UPPER(AG.AnimeGenreName) AS GenreName, COUNT(DISTINCT sd.SalesID) AS SaleCount,
SUM(CASE WHEN a.AnimeDescription LIKE '% % %' THEN 1 ELSE 0 END) AS SaleDurationSum
FROM MsAnimeGenre AG
JOIN MsAnime a ON AG.AnimeGenreID = a.AnimeGenreID
JOIN SalesDetail sd ON a.AnimeID = sd.AnimeID
GROUP BY AG.AnimeGenreName
HAVING COUNT(DISTINCT sd.SalesID) > 5;


--5
--Display CustomerName (obtained from lowercase of CustomerName), AnimeName (obtained from uppercase of AnimeName), 
--and AverageSpend (obtained from average of multiplication between animePricePerDay and salesDuration) 
--for each customer that has lowercase or uppercase vocal alphabet in the first letter of its 
--name and has AverageSpend more than the average of all AverageSpend of customers
SELECT LOWER(MC.CustomerName) AS CustomerName, UPPER(a.AnimeName) AS AnimeName,
       AVG(a.AnimeSubscribePrice * CONVERT(INT, sd.SalesAnimeDuration)) AS AverageSpend
FROM MsCustomer MC
JOIN SalesHeader sh ON MC.CustomerID = sh.CustomerID
JOIN SalesDetail sd ON sh.SalesID = sd.SalesID
JOIN MsAnime a ON sd.AnimeID = a.AnimeID
WHERE MC.CustomerName LIKE '[AaEeIiOoUu]%'
GROUP BY MC.CustomerName, a.AnimeName
HAVING AVG(a.AnimeSubscribePrice * CONVERT(INT, sd.SalesAnimeDuration)) > (
    SELECT AVG(Spend)
    FROM (
        SELECT AVG(a.AnimeSubscribePrice * CONVERT(INT, sd.SalesAnimeDuration)) AS Spend
        FROM MsCustomer MC
        JOIN SalesHeader sh ON MC.CustomerID = sh.CustomerID
        JOIN SalesDetail sd ON sh.SalesID = sd.SalesID
        JOIN MsAnime a ON sd.AnimeID = a.AnimeID
        WHERE MC.CustomerName LIKE '[AaEeIiOoUu]%'
        GROUP BY MC.CustomerName, a.AnimeName
    ) AS subquery
);

--6
--Display CustomerName, SalesId (obtained by replacing first 2 characters of SalesId with 'Sales-'), 
--and SalesDayOfYear (obtained from day of year from SalesDate) 
--for each Sale transaction that has the cheapest anime and occurs in March, May, or July.
--(ALIAS SUBQUERY)
SELECT MC.CustomerName, 'Sales-' + SUBSTRING(sd.SalesID, 3, LEN(sd.SalesID)) AS SalesId,
DATEPART(DAYOFYEAR, sh.SalesDate) AS SalesDayOfYear
FROM MsCustomer MC
JOIN SalesHeader sh ON MC.CustomerID = sh.CustomerID
JOIN SalesDetail sd ON sh.SalesID = sd.SalesID
JOIN MsAnime a ON sd.AnimeID = a.AnimeID
WHERE a.AnimeID = (
    SELECT TOP 1 a.AnimeID
    FROM MsAnime a
    JOIN SalesDetail sd ON a.AnimeID = sd.AnimeID
	JOIN SalesHeader sh ON sd.SalesID = sh.SalesID
    WHERE MONTH(sh.SalesDate) IN (3, 5, 7)
    ORDER BY a.AnimeSubscribePrice ASC
)
AND MONTH(sh.SalesDate) IN (3, 5, 7);

--7
--Display CustomerName, CustomerDOB (obtained from formatting Customer to 'Dayname DD-Month-YY'), 
--and TotalSpending (obtained from combining the sum of SalesDuration and AnimePricePerDay with ' Rupiah') 
--for each customer born in the first half of the month (day of CustomerDOB is less than or equal 15) 
--and has subscribed all kind of genre of anime.
--(ALIAS SUBQUERY)
SELECT c.CustomerName, FORMAT(c.CustomerDOB, 'dddd dd-MMMM-yy') AS CustomerDOB,
       cast(SUM(a.AnimeSubscribePrice * sd.SalesAnimeDuration) as varchar) + ' Rupiah ' AS TotalSpending
FROM (
select CustomerName
from MsCustomer c
where day(CustomerDOB) <= 15 and c.customerID in (
	select c.CustomerID from MsCustomer mc
	join SalesHeader sh on mc.CustomerID = sh.CustomerID
	join SalesDetail sd on sh.SalesID = sd.SalesID
	join MsAnime ma on sd.AnimeID = ma.AnimeID
	join MsAnimeGenre mg on ma.AnimeGenreID = mg.AnimeGenreID
	) 
)as test, MsCustomer c
JOIN SalesHeader sh ON c.CustomerID = sh.CustomerID
JOIN SalesDetail sd ON sh.SalesID = sd.SalesID
JOIN MsAnime a ON sd.AnimeID = a.AnimeID
WHERE c.CustomerName in (test.CustomerName)
GROUP BY c.CustomerName, c.CustomerDOB

--8
--Display StaffName, StaffId (obtained from replacing 'SF' from Staffid to 'Staff '), StaffPassword (obtained from reversing staffPassword for security reason), 
--and LatestPurchaseYear (obtained from the latest year of purchase transaction) for each staff that had handled the most purchase transactions 
--with different studio and each studio name doesn’t contain any special character (special characters is characters beside lowercase or uppercase alphabet, numeric, and space) in its name.
--(ALIAS SUBQUERY)
SELECT MS.StaffName, 'Staff ' + SUBSTRING(MS.StaffID, 3, LEN(MS.StaffID)) AS StaffID,
REVERSE(MS.StaffPassword) AS StaffPassword,
MAX(DATEPART(YEAR, ph.PurchaseDate)) AS LatestPurchaseYear
FROM MsStaff MS
JOIN PurchaseHeader ph ON MS.StaffID = ph.StaffID
JOIN MsStudio st ON ph.StudioID = st.StudioID
WHERE st.StudioName NOT LIKE '%[^A-Za-z0-9 ]%'
GROUP BY MS.StaffName, MS.StaffID, MS.StaffPassword
HAVING COUNT(DISTINCT ph.StudioID) = (
    SELECT MAX(StudioCount)
    FROM (
        SELECT COUNT(DISTINCT ph.StudioID) AS StudioCount
        FROM PurchaseHeader ph
        GROUP BY ph.StaffID
    ) AS subquery
);

--9
--Create view CustomerData that displays CustomerName 
--and CustomerEmailName (obtained from letters before '@' in CustomerEmail) 
--for each customer that has average of SalesDuration more than 10 and never watch 2 or more animes with the same genre.
CREATE VIEW CustomerData AS
SELECT c.CustomerName, LEFT(c.CustomerEmail, CHARINDEX('@', c.CustomerEmail) - 1) AS CustomerEmail
FROM MsCustomer c
JOIN SalesHeader sh ON c.CustomerID = sh.CustomerID
JOIN SalesDetail sd ON sh.SalesID = sd.SalesID
JOIN MsAnime a ON sd.AnimeID = a.AnimeID
GROUP BY c.CustomerName, c.CustomerEmail
HAVING AVG(sd.SalesAnimeDuration) > 10
AND COUNT(DISTINCT a.AnimeGenreID) > 2

select * from CustomerData

--10
--Create view AnimesCustomerMayWatch that displays CustomerName, 
--CouldWatchAnimeCount (obtained from count anime), and AveragePrice 
--(obtained by combining average of anime price per day ends with ' Rupiah') 
--for every customer that fulfilled with the anime minimum age criteria if today is July 8th, 2021, and the average price is less than 18000.
CREATE VIEW AnimesCustomerMayWatch AS
SELECT c.CustomerName, COUNT(DISTINCT a.AnimeID) AS CouldWatchAnimeCount,
CONCAT(FORMAT(AVG(a.AnimeSubscribePrice), 'N2'), ' Rupiah') AS AveragePrice
FROM MsCustomer c
JOIN SalesHeader sh ON c.CustomerID = sh.CustomerID
JOIN SalesDetail sd ON sh.SalesID = sd.SalesID
JOIN MsAnime a ON sd.AnimeID = a.AnimeID
WHERE a.AnimeMinimumAge <= DATEDIFF(YEAR, c.CustomerDOB, '2021-07-08')
AND a.AnimeSubscribePrice < 18000
GROUP BY c.CustomerName;

select * from AnimesCustomerMayWatch
