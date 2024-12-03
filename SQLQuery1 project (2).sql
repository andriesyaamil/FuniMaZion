--Group 2 - BI11:
-- Muhammad Rafli (2602111181)
-- Muhammad Andrie Syaamil (2602110563)
-- Justin (2602111950)
-- Luthfi Athallah Rakasiwi (2602109574)

INSERT INTO MsCity VALUES
  ('CI001', 'Cimahi'),
  ('CI002', 'Tasikmalaya'),
  ('CI003', 'Cirebon'),
  ('CI004', 'Sukabumi'),
  ('CI005', 'Tegal'),
  ('CI006', 'Pekalongan'),
  ('CI007', 'Banjarnegara'),
  ('CI008', 'Kediri'),
  ('CI009', 'Probolinggo'),
  ('CI010', 'Sidoarjo'),
  ('CI011', 'Blitar'),
  ('CI012', 'Gresik');

INSERT INTO MsStaff VALUES 
('SF001', 'Alisya Putriwan',  'CI001', 'Female', 'alisy@gmail.com', 'Alisya281', '1999-08-28'),
('SF002', 'Fatrian Akbar Sugiono',  'CI002','Male', 'fatri8@gmail.com', 'Fatriano111', '1998-01-01'),
('SF003',  'Athaya Syahreza', 'CI003','Male', 'syah2@gmail.com', 'Syahreza1212', '1997-12-18'),
('SF004', 'Brighita Tania Inara','CI004', 'Female', 'brig77@gmail.com', 'Brigtar890', '1998-05-17'),
('SF005', 'Denada Saina Gantaria',  'CI005','Female', 'denaa4@gmail.com', 'Denaria95', '1995-06-12'),
('SF006', 'Ghifari Fawwaz Zabir',  'CI006','Male', 'zabz5@gmail.com', 'Ghifariwaz345', '1996-03-16'),
('SF007', 'Farah Elma Delesia',  'CI007', 'Female', 'farama23@gmail.com', 'Famaed236', '1992-08-19'),
('SF008', 'Mahendra Sigit',  'CI008','Male', 'mahea66@mail.com', 'Sigisst576', '1999-12-13'),
('SF009',  'Dian Supartani', 'CI009','Female', 'dian09@gmail.com', 'Dianpass99', '1995-12-14'),
('SF010',  'Anton Basuki', 'CI010','Male', 'anto28@gmail.com', 'Antonbasuki12', '1999-8-13')

INSERT INTO MsStudio VALUES
    ('SD001', 'Studio Indah', 'CI001'),
    ('SD002', 'Studio Mulia', 'CI002'),
    ('SD003', 'Studio Harapan', 'CI003'),
    ('SD004', 'Studio Bintang', 'CI004'),
    ('SD005', 'Studio Galaxy', 'CI005'),
    ('SD006', 'Studio Star', 'CI006'),
    ('SD007', 'Studio Cat', 'CI007'),
    ('SD008', 'Studio Setia', 'CI008'),
    ('SD009', 'Studio Kota', 'CI009'),
    ('SD010', 'Studio Maju Jaya', 'CI010');

INSERT INTO MsCustomer VALUES
  ('CU001', 'Ana Putri', 'CI001', 'Female', 'Ana001@gmail.com', 'ana11123', '2020-02-01'),
  ('CU002', 'Jane Lia', 'CI005', 'Female', 'jane21@gmail.com', 'lia45678', '2002-05-15'),
  ('CU003', 'Michael Wonosobo', 'CI002', 'Male', 'wonosobo1@gmail.com', 'passaya23', '2005-09-20'),
  ('CU004', 'Sarah Putri', 'CI012', 'Female', 'sarah2001@gmail.com', 'lahir2001', '2021-03-10'),
  ('CU005', 'David Luis Santoso', 'CI003', 'Male', 'david001@gmail.com', 'easy1211', '2002-07-07'),
  ('CU006', 'Emily Ayu', 'CI008', 'Female', 'ayu2221@gmail.com', 'ayoou111', '2001-11-25'),
  ('CU007', 'Kevin Leo', 'CI009', 'Male', 'kevinleo21@gmail.com', 'sayamau21', '2001-12-31'),
  ('CU008', 'Michelle Putri', 'CI002', 'Female', 'putri21@gmail.com', 'utri3211', '2001-06-18'),
  ('CU009', 'Ryan Abdi', 'CI005', 'Male', 'ryan12@gmail.com', '12345678', '2001-02-14'),
  ('CU010', 'Sophia Abdi Putriwan', 'CI006', 'Female', 'sophiputri21@gmail.com', 'abdi2111', '2001-08-22');

INSERT INTO SalesHeader VALUES
('SA001', 'CU001', '2023-06-17', 'Debit'),
('SA002', 'CU002', '2023-06-18', 'Credit'),
('SA003', 'CU003', '2023-06-19', 'Debit'),
('SA004', 'CU004', '2023-06-19', 'Debit'),
('SA005', 'CU005', '2023-06-21', 'Debit'),
('SA006', 'CU006', '2023-06-22', 'Credit'),
('SA007', 'CU007', '2023-06-23', 'Debit'),
('SA008', 'CU008', '2023-06-24', 'Credit'),
('SA009', 'CU009', '2023-06-25', 'Credit'),
('SA010', 'CU010', '2023-06-26', 'Debit'),
('SA011', 'CU001', '2023-06-27', 'Debit'),
('SA012', 'CU007', '2023-06-28', 'Debit'),
('SA013', 'CU008', '2023-06-29', 'Debit'),
('SA014', 'CU010', '2023-06-30', 'Debit'),
('SA015', 'CU009', '2023-07-01', 'Credit')

  INSERT INTO MsAnimeGenre VALUES
('GE001', 'Drama'),
('GE002', 'Fantasy'),
('GE003', 'Romance'),
('GE004', 'Psychological'),
('GE005', 'Sports'),
('GE006', 'Action'),
('GE007', 'Adventure'),
('GE008', 'Comedy'),
('GE009', 'Horror'),
('GE010', 'Mystery');

  INSERT INTO MsAnime VALUES
  ('AN001', 'GE010', 'Attack on Titan', 10000, 'A thrilling story set in a world where humanity fights against giant humanoid creatures.', 16),
  ('AN002', 'GE007', 'One Piece', 15000, 'Follow the adventures of Monkey D. Luffy and his pirate crew as they search for the ultimate treasure.', 13),
  ('AN003', 'GE007', 'Naruto', 15000, 'Join Naruto Uzumaki in his journey to become the strongest ninja in his village.', 13),
  ('AN004', 'GE009', 'Death Note', 20000, 'A high-stakes cat-and-mouse game between a genius detective and a young man who possesses a supernatural notebook.', 16),
  ('AN005', 'GE006', 'Fullmetal Alchemist: Brotherhood', 20000, 'Two brothers search for the Philosophers Stone to restore their bodies after a failed alchemical experiment.', 13),
  ('AN006', 'GE007', 'My Hero Academia', 20000, 'In a world where almost everyone has superpowers, a young boy aims to become the greatest hero of all.', 13),
  ('AN007', 'GE002', 'Demon Slayer', 15000, 'Follow Tanjiro Kamado as he fights demons and seeks a cure for his sister who has been turned into one.', 16),
  ('AN008', 'GE006', 'Hunter x Hunter', 15000, 'Gon Freecss sets out to become a Hunter and uncover the mysteries of his absent father.', 13),
  ('AN009', 'GE009', 'One Punch Man', 25000, 'Saitama, a superhero who can defeat any opponent with a single punch, seeks excitement in his monotonous life.', 16),
  ('AN010', 'GE010', 'Tokyo Ghoul', 30000, 'Ken Kaneki, a college student turned half-ghoul, struggles to navigate the world of ghouls and humans.', 16);

INSERT INTO PurchaseHeader VALUES
    ('PU001', 'SF001', 'SD001', '2023-01-15'),
    ('PU002', 'SF002', 'SD002', '2023-03-12'),
    ('PU003', 'SF003', 'SD003', '2023-06-13'),
    ('PU004', 'SF004', 'SD004', '2023-07-24'),
    ('PU005', 'SF005', 'SD005', '2023-09-12 '),
    ('PU006', 'SF006', 'SD006', '2023-12-06'),
    ('PU007', 'SF007', 'SD007', '2023-02-07'),
    ('PU008', 'SF008', 'SD008', '2023-06-08'),
    ('PU009', 'SF009', 'SD009', '2023-08-09'),
    ('PU010', 'SF010', 'SD010', '2023-02-10'),
    ('PU011', 'SF001', 'SD002', '2023-07-11'),
    ('PU012', 'SF002', 'SD003', '2023-04-12'),
    ('PU013', 'SF003', 'SD004', '2023-09-13'),
    ('PU014', 'SF004', 'SD005', '2023-03-14'),
    ('PU015', 'SF005', 'SD006', '2023-11-15');

INSERT INTO SalesDetail VALUES
('SA001', 'AN001', '10'),
('SA002', 'AN002', '10'),
('SA003', 'AN003', '30'),
('SA004', 'AN004', '20'),
('SA005', 'AN005', '30'),
('SA006', 'AN006', '30'),
('SA007', 'AN007', '50'),
('SA008', 'AN008', '60'),
('SA009', 'AN009', '70'),
('SA010', 'AN010', '10'),
('SA011', 'AN001', '80'),
('SA012', 'AN002', '30'),
('SA013', 'AN002', '40'),
('SA014', 'AN003', '30'),
('SA015', 'AN003', '20'),
('SA006', 'AN002', '80'),
('SA007', 'AN005', '10'),
('SA008', 'AN009', '10'),
('SA009', 'AN010', '20'),
('SA010', 'AN008', '30'),
('SA001', 'AN007', '60'),
('SA002', 'AN003', '90'),
('SA003', 'AN010', '20'),
('SA004', 'AN009', '90'),
('SA009', 'AN005', '20');


INSERT INTO PurchaseDetail VALUES
    ('PU001', 'AN001'),
    ('PU001', 'AN002'),
    ('PU002', 'AN003'),
    ('PU002', 'AN004'),
    ('PU003', 'AN001'),
    ('PU003', 'AN005'),
    ('PU004', 'AN006'),
    ('PU004', 'AN002'),
    ('PU005', 'AN007'),
    ('PU005', 'AN003'),
    ('PU006', 'AN008'),
    ('PU006', 'AN009'),
    ('PU007', 'AN001'),
    ('PU007', 'AN004'),
    ('PU008', 'AN010'),
    ('PU008', 'AN006'),
    ('PU009', 'AN005'),
    ('PU009', 'AN007'),
    ('PU010', 'AN001'),
    ('PU012', 'AN003'),
    ('PU014', 'AN002'),
    ('PU011', 'AN009'),
    ('PU014', 'AN003'),
    ('PU012', 'AN002'),
    ('PU013', 'AN008');


