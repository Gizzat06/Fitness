SELECT * FROM Paidalanushy;
SELECT * FROM Abonement;
SELECT * FROM Trenazher;
SELECT * FROM VirtualdyKezek;
SELECT * FROM AqauOtinimi;
GO

UPDATE Abonement
SET kuyi = N'Аяқталған'
WHERE id = 2

DELETE FROM Abonement
WHERE id = 6