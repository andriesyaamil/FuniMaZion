--Group 2 - BI11:
-- Muhammad Rafli (2602111181)
-- Muhammad Andrie Syaamil (2602110563)
-- Justin (2602111950)
-- Luthfi Athallah Rakasiwi (2602109574)


--1. Customer Bernama Lia Ananda Mendatangi toko untuk melihat koleksi anime yang tersedia di toko ”FuniMaZion”
SELECT AnimeName, AnimeGenreName, AnimeMinimumAge
From MsAnime MA
JOIN MsAnimeGenre MG ON MA.AnimeGenreID = MG.AnimeGenreID

--2. Lia Mencari Anime Dengan Budget 10000-20000 
SELECT AnimeName, AnimeGenreName, AnimeSubscribePrice 
From MsAnime MA
JOIN MsAnimeGenre MG ON MA.AnimeGenreID = MG.AnimeGenreID
WHERE AnimeSubscribePrice BETWEEN 10000 AND 20000 

--3. Akhirnya Lia Membeli Anime Onepiece Dan Juga Naruto di Studio Harapan, Kemudian Staff pun memasukan data transaksi customer Ke Database
INSERT INTO MsCustomer VALUES
('CU011', 'Jane Lia', 'CI005', 'Female', 'jane21@gmail.com', 'lia45678', '2002-05-15')

INSERT INTO PurchaseHeader VALUES
('PU016', 'SF007', 'SD003', '2023-06-18')

INSERT INTO PurchaseDetail VALUES
('PU016', 'AN002'),
('PU016', 'AN003')

--4.Kemudian Staff ingin menganti atau merubah data pada SalesAnimeDuration menjadi 9 Day pada sales dengan ID SA009 ?
UPDATE SalesDetail 
SET SalesAnimeDuration = '90'    
WHERE SalesID = 'SA009'

--5. Setelah staff mengubah durasi anime pada SalesID,tiba-tiba seorang customer bernama Jane Lia datang dan memberi tau ke staff bahwa dia lupa passwordnya dan dia meminta tolong kepada staff untuk mengubah passwordnya menjadi liajane2323 dengan CU002 ?
UPDATE MsCustomer 
SET CustomerPassword = 'liajane2323'
WHERE CustomerID = 'CU002'