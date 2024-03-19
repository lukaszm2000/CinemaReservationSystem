--OPIS - BAZA DANYCH KINA
    --Baza danych obejmuje informacje o kinie, klientach, ocenach filmów, filmach, gatunkach filmowych, seansach, rezerwacjach,
    --salach kinowych, typach sali i adresach - czyli wszystkie kluczowe elementy związane z funkcjonowaniem kina.
    --Pozwala na śledzenie informacji dotyczących filmów, ich ocen, seansów, miejsca ich przedstawienia i rezerwacji klientów.

--Adres - Informacje o lokalizacji, takie jak miasto, ulica, numer domu, numer lokalu (jeśli istnieje) i kod pocztowy.
--Klient - Dane identyfikujące klientów, takie jak imię, nazwisko, oraz odniesienie do ich adresu.
--OcenaFilmu - Informacje o ocenach filmów wystawionych przez klientów, wraz z dodatkowym komentarzem.
--Film - Informacje o filmach, takie jak tytuł, rok produkcji, reżyser, czas trwania oraz przypisany gatunek filmowy.
--GatunekFilm - Kategorie gatunków filmowych, które mogą być przypisane do różnych filmów.
--Seans - Dane dotyczące konkretnego seansu filmowego, takie jak data, godzina, cena biletu, oraz informacje o filmie i sali kinowej.
--Rezerwacja - Informacje o rezerwacjach klientów na konkretne seanse filmowe, wraz z danymi o statusie rezerwacji i dacie dokonania rezerwacji.
--Sala - Informacje o salach kinowych, takie jak numer, pojemność oraz odniesienie do typu sali.
--TypSali - Kategorie typów sal kinowych, które mogą różnić się pod względem wyposażenia lub przeznaczenia.


--DDL-----------------------------------------------------------

CREATE TABLE ADRES(
    ID int not null constraint PK_Adres primary key,
    Miasto varchar(20) not null,
    Ulica varchar(30) not null,
    NrDomu int not null,
    NrLokalu int,
    KodPocztowy varchar(6) not null,
);

GO

CREATE TABLE Klient(
    ID int not null constraint PK_Klient primary key,
    Imie varchar(30) not null,
    Nazwisko varchar(30) not null,
    AdresId int constraint FK_Klient_AdresID references Adres(ID),
);

GO

CREATE TABLE OcenaFilmu(
    ID int not null constraint PK_OcenaFilmu primary key ,
    Ocena int not null,
    Komentarz varchar(200),
    KlientId int constraint FK_OcenaFilmu_KlientID references Klient(ID),
    FilmID int constraint FK_OcenaFilmu_FilmID references Film(ID),
);

GO

CREATE TABLE Film(
    ID int constraint PK_Film primary key,
    Tytul varchar(30) not null,
    RokProdukcji int not null,
    Rezyser varchar(30) not null,
    CzasTrwania time not null,
    GatunekFilmID int constraint FK_Film_GatunekFilmID references GatunekFilm(ID),
);

GO

CREATE TABLE GatunekFilm (
    ID int constraint PK_GatunekFilm primary key,
    Nazwa varchar(20) not null,
);

GO

CREATE TABLE Seans(
    ID int constraint PK_Seans primary key,
    DataSeansu date not null,
    GodzinaSeansu time not null,
    Cena Decimal(4,2) not null,
    FilmId int constraint FK_Seans_FilmID references Film(ID),
    SalaId int constraint FK_Seans_SalaID references Sala(ID),
    CzyOdwolany decimal(1,0) CHECK (Seans.CzyOdwolany IN (0, 1)) not null,
);

GO

CREATE TABLE Rezerwacja(
    ID int constraint PK_Rezerwacja primary key,
    StatusRezerwacji varchar(20) not null,
    KlientID int constraint FK_Rezerwacja_KlientID references Klient(ID),
    SeansID int constraint FK_Rezerwacja_SeansID references Seans(ID),
    DataRezerwacji date not null,
);

GO

CREATE TABLE Sala(
    ID int constraint PK_Sala primary key,
    Nr int not null,
    Pojemnosc int not null,
    TypSaliID int constraint FK_Sala_TypSaliID references TypSali(ID),
);

GO

CREATE TABLE TypSali(
    ID int constraint PK_TypSali primary key,
    Nazwa VARCHAR(20) not null,
);


--INSERTY ---------------------------------------------
INSERT INTO Adres (ID, Miasto, Ulica, NrDomu, NrLokalu, KodPocztowy)
VALUES
    (1, 'Warszawa', 'Mazowiecka', 10, NULL, '00-001'),
    (2, 'Kraków', 'Zlota', 5, 3, '30-002'),
    (3, 'Gdańsk', 'Zielona', 15, NULL, '80-001'),
    (4, 'Poznań', 'Kolorowa', 20, 5, '60-002'),
    (5, 'Wrocław', 'Polska', 8, 2, '50-003'),
    (6, 'Kraków', 'Kopernika', 25, 4, '30-003'),
    (7, 'Gdynia', 'Kolejowa', 18, NULL, '81-001');


INSERT INTO Klient (ID, Imie, Nazwisko, AdresId)
VALUES
    (1, 'Jan', 'Kowalski', 1),
    (2, 'Anna', 'Nowacka', 2),
    (3, 'Katarzyna', 'Karolek', 3),
    (4, 'Tomasz', 'Poznanski', 4),
    (5, 'Magdalena', 'Kordas', 5),
    (6, 'Michał', 'Dąbrowski', 6),
    (7, 'Karolina', 'Nowakowska', 7),
    (8, 'Piotr', 'Piotrowski', 2),
    (9, 'Aleksandra', 'Tulipan', 3),
    (10, 'Grzegorz', 'Jasinski', 4)

INSERT INTO GatunekFilm (ID, Nazwa)
VALUES
    (1, 'Horror'),
    (2, 'Komedia'),
    (3, 'Akcja');

INSERT INTO Film (ID, Tytul, RokProdukcji, Rezyser, CzasTrwania, GatunekFilmID)
VALUES
    (1, 'Martyrs', 2023, 'Pascal Raugier', '02:30:00', 1),
    (2, 'Nietykalni', 2024, 'Oliver Nakache', '01:45:00', 2),
    (3, 'Maqball', 2025, 'Vishal Bhardwaj', '01:55:00', 3),
    (4, 'Jas Fasola', 2023, 'Robert Henricks', '1:30', 1);

INSERT INTO TypSali (ID, Nazwa)
VALUES
    (1, 'Sala Standard'),
    (2, 'Sala Premium');

INSERT INTO Sala (ID, Nr, Pojemnosc, TypSaliID)
VALUES
    (1, 101, 60, 1), -- Sala Standard
    (2, 102, 20, 2); -- Sala Premium

INSERT INTO Seans (ID, DataSeansu, GodzinaSeansu, Cena, FilmId, SalaId, CzyOdwolany)
VALUES
    (1, '2023-11-26', '19:30:00', 20.00, 1, 1, 0),
    (2, '2023-11-27', '21:30:00', 15.50, 2, 2, 0),
    (3, '2023-11-28', '17:30:00', 18.50, 3, 1, 0),
    (4, '2023-10-20', '17:00:00', 30.00, 4, 1, 0);


INSERT INTO Rezerwacja (ID, StatusRezerwacji, KlientID, SeansID, DataRezerwacji)
VALUES
    (1, 'Potwierdzona', 1, 1, '2023-11-20'),
    (2, 'Potwierdzona', 2, 2, '2023-11-18'),
    (3, 'Potwierdzona', 3, 3, '2023-11-01'),
    (4, 'Potwierdzona', 4, 1, '2023-11-20'),
    (5, 'Potwierdzona', 5, 2, '2023-11-18'),
    (6, 'Potwierdzona', 6, 3, '2023-11-20'),
    (7, 'Potwierdzona', 7, 1, '2023-11-18'),
    (8, 'Potwierdzona', 8, 2, '2023-11-18'),
    (9, 'Potwierdzona', 9, 3, '2023-11-01'),
    (10, 'Potwierdzona', 10, 1, '2023-11-20'),
    (11, 'Potwierdzona', 1, 2, '2023-11-01'),
    (12, 'Potwierdzona', 2, 3, '2023-11-18'),
    (13, 'Potwierdzona', 3, 1, '2023-11-01'),
    (14, 'Potwierdzona', 3, 2, '2023-11-18'),
    (15, 'Potwierdzona', 9, 2, '2023-11-20'),
    (16, 'Potwierdzona', 10, 3, '2023-11-01'),
    (17, 'Potwierdzona', 10, 2, '2023-11-18'),
    (18, 'Potwierdzona', 5, 1, '2023-11-20'),
    (19, 'Potwierdzona', 6, 2, '2023-11-18'),
    (20, 'Potwierdzona', 7, 2, '2023-11-01'),
    (21, 'Potwierdzona', 1, 4, '2023-10-01');


INSERT INTO OcenaFilmu (ID, Ocena, Komentarz, KlientId, FilmID)
VALUES
    (1, 4, 'Bardzo dobry film!', 1, 1),
    (2, 3, 'Ciekawe doświadczenie.', 2, 2),
    (3, 5, 'Rewelacyjny!', 3, 3),
    (4, 2, 'Nie podobał mi się.', 4, 1);

Alter table OcenaFilmu Add SredniaOcena decimal(3,1);

--Procedura bedzie umozliwiala odwolanie danego seansu z repertuaru(w najdalszym terminie wynoszacym
--5 dni od daty biezacej)jesli ilosc rezerwacji bedzie mniejsza niz argument podawany przez uzytkownika. Uzytkownik oprocz tego podaje
--date poczatkowa i koncowa miedzy ktorymi bedzie wyszukiwany seans. Zostaja rowniez odwolane rezerwacje klientow na dany film, ktory ma
--ilosc rezerwacji ponizej argumentu.

create procedure Aktualizuj_Filmy_W_Podanym_Przedziale_Czasowym @DataPoczatkowa Date, @DataKoncowa Date, @MinimalnaLiczbaRezerwacji int
    as
    begin

        IF @DataPoczatkowa <= GETDATE()
        BEGIN
            RAISERROR ('Nie mozesz podaj daty mniejszej niz dzisiejsza.', 16, 1);
        end

        IF @DataPoczatkowa > @DataKoncowa
        BEGIN
            RAISERROR ('Data początkowa nie moze byc terminem dalszym niz 5 dni od daty biezacej', 16, 1);
        END
        IF @MinimalnaLiczbaRezerwacji < 0
        BEGIN
            RAISERROR('Minimalna liczba rezerwacji nie może być mniejsza niż 0.', 16, 1);
        END

        IF @DataKoncowa > DATEADD(DAY, 5, GETDATE())
        BEGIN
            RAISERROR('Data końcowa nie może być dalsza niż 5 dni od bieżącej daty.', 16, 1);
        END

        DECLARE @SeansID int, @FilmID int, @IloscRezerwacji int;

        DECLARE KursorSeansu CURSOR FOR
        SELECT s.ID, s.FilmID, COUNT(r.ID) AS IloscRezerwacji
        FROM Seans s
        LEFT JOIN Rezerwacja r ON s.ID = r.SeansID
        WHERE s.DataSeansu BETWEEN @DataPoczatkowa AND @DataKoncowa
        AND r.StatusRezerwacji <> 'Anulowana'
        GROUP BY s.ID, s.FilmID;


        open KursorSeansu;
        fetch next from KursorSeansu INTO @SeansID, @FilmID, @IloscRezerwacji

        WHILE @@FETCH_STATUS = 0
    BEGIN
        IF @IloscRezerwacji < @MinimalnaLiczbaRezerwacji
        BEGIN
            -- Znajdź film z największą liczbą rezerwacji w danym terminie i zamien go
            DECLARE @NowyFilmID INT;
            SELECT TOP 1 @NowyFilmID = FilmID
            FROM Seans
            WHERE DataSeansu BETWEEN @DataPoczatkowa AND @DataKoncowa
            GROUP BY FilmID
            ORDER BY COUNT(ID) DESC;

            -- Odwołanie seansu, jeśli nie zostało to jeszcze zrobione
            IF (SELECT CzyOdwolany FROM Seans WHERE ID = @SeansID) = 0
            BEGIN
                IF (@FilmID <> @NowyFilmID) --tu takie zabezpieczenie zeby nie odwolywalo rezerwacji dla najpopularniejszego filmu
                    BEGIN
                    UPDATE Rezerwacja SET StatusRezerwacji = 'Anulowana'
                    WHERE SeansID = @SeansID;

                    UPDATE Seans SET CzyOdwolany = 1 WHERE ID = @SeansID;
                END
            END

            DECLARE @DataSeansu date, @GodzinaSeansu time, @Cena decimal(4,2), @SalaID int, @NoweID int;
            SELECT @DataSeansu = DataSeansu, @GodzinaSeansu = GodzinaSeansu, @Cena = Cena, @SalaID = SalaID
            FROM Seans where id = @SeansID;

            -- Pobierz cenę dla najbardziej popularnego filmu
            SELECT TOP 1 @Cena = MAX(Cena)
            FROM Seans
            WHERE FilmID = @NowyFilmID
            GROUP BY FilmID
            ORDER BY COUNT(ID) DESC;

            IF(SELECT FilmId FROM Seans WHERE ID = @SeansID) <> @NowyFilmID --tutaj bez sensu dodawac nowy rekord jesli zostaje ten sam film
                begin
            SET @NoweID = (SELECT ISNULL(MAX(ID), 0) + 1 FROM Seans);
            INSERT INTO SEANS (ID,DataSeansu, GodzinaSeansu, Cena, FilmID, SalaID, CzyOdwolany) VALUES
            (@NoweID, @DataSeansu, @GodzinaSeansu, @Cena,@NowyFilmID, @SalaID, 0)
                end
        END
        ELSE
        BEGIN
            -- Wyświetlanie informacji, gdy liczba rezerwacji jest wystarczająca
            PRINT 'Nie ma potrzeby aktualizacji filmu na seansie o ID: ' + CAST(@SeansID AS VARCHAR) + '. Liczba rezerwacji jest wystarczająca.';
        END

        FETCH NEXT FROM KursorSeansu INTO @SeansID, @FilmID, @IloscRezerwacji;
    END

    CLOSE KursorSeansu;
    DEALLOCATE KursorSeansu;
end


EXECUTE Aktualizuj_Filmy_W_Podanym_Przedziale_Czasowym '2023-11-25', '2023-11-29', 6;

SELECT * FROM Seans;

delete from seans where id >= 5;

update seans set CzyOdwolany = 0 where id > 0;

SELECT * FROM Rezerwacja;

update Rezerwacja set StatusRezerwacji = 'Potwierdzona' where id>0;

SELECT s.ID, s.FilmID, COUNT(r.ID) AS IloscRezerwacji
        FROM Seans s
        LEFT JOIN Rezerwacja r ON s.ID = r.SeansID
        GROUP BY s.ID, s.FilmID;


---WYZWALACZ-------------------------------------------------------------------------------------

--Jest to wyzwalacz, który sprawdza, czy wprowadzona ocena i komentarz dotyczą filmu, ktory juz mial swoja premiere w tym kinie.
--Sprawdza on rowniez czy dany klient nie wystawił już oceny temu filmowi.
--Jesli ocena i komentarz są na temat filmu, który nie miał jeszcze premiery, lub klient dał już ocenę temu filmowi,
--to zmiany zostają wycofane. Dodatkowo zostaje updateowana kolumna SredniaOcena w tabeli OcenaFilmu, dla filmu, dla którego został
--daodany poprawny komentarz


CREATE TRIGGER SprawdzOcenePrzedWstawieniem
ON OcenaFilmu
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @OcenaID int, @Ocena int, @KlientID int, @FilmID int;

    DECLARE KursorOceny CURSOR FOR
    SELECT ID, Ocena, KlientID, FilmID
    FROM inserted;

    OPEN KursorOceny;
    FETCH NEXT FROM KursorOceny INTO @OcenaID, @Ocena, @KlientID, @FilmID;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Sprawdź, czy ocena jest zakresie od 1 do 5
        IF @Ocena < 1 OR @Ocena > 5
        BEGIN
            RAISERROR('Ocena musi być w zakresie od 1 do 5.', 16, 1);
            ROLLBACK;
            CLOSE KursorOceny;
            DEALLOCATE KursorOceny;
            RETURN;
        END

        -- Sprawdź, czy ocena i komentarz dotyczą filmu, który już miał swoją premierę w kinie
        IF NOT EXISTS (
            SELECT 1
            FROM Seans
            WHERE FilmID = @FilmID AND DataSeansu <= GETDATE()
        )
        BEGIN
            RAISERROR('Ocena i komentarz muszą dotyczyć filmu, który już miał swoją premierę w kinie.', 16, 1);
            ROLLBACK;
            CLOSE KursorOceny;
            DEALLOCATE KursorOceny;
            RETURN;
        END

        -- Sprawdź, czy klient nie ocenił już wcześniej tego samego filmu
        IF EXISTS (
            SELECT 1
            FROM OcenaFilmu
            WHERE KlientID = @KlientID AND FilmID = @FilmID
        )
        BEGIN
            RAISERROR('Klient nie może ocenić tego samego filmu więcej niż raz.', 16, 1);
            ROLLBACK;
            CLOSE KursorOceny;
            DEALLOCATE KursorOceny;
            RETURN;
        END

        -- Pobierz kolejny wiersz
        FETCH NEXT FROM KursorOceny INTO @OcenaID, @Ocena, @KlientID, @FilmID;
    END

    -- Zamknij i zwolnij kursor
    CLOSE KursorOceny;
    DEALLOCATE KursorOceny;

    -- Wstaw oceny do tabeli jesli wszystko jest git
    INSERT INTO OcenaFilmu (ID, Ocena, Komentarz, KlientId, FilmID)
    SELECT ID, Ocena, Komentarz, KlientID, FilmID
    FROM inserted;

    -- Wyświetl średnią ocenę dla danego filmu po wstawieniu ocen
    DECLARE @SredniaOcena decimal(4, 2);
    DECLARE @NazwaFilmu Varchar(20);

    --Update sredniej oceny dla filmu
    UPDATE OcenaFilmu
    SET SredniaOcena = (
    SELECT AVG(Ocena)
    FROM OcenaFilmu
    WHERE FilmID = @FilmID
    ) WHERE FilmID = @FilmID;

    SELECT @SredniaOcena = AVG(Ocena)
    FROM OcenaFilmu
    WHERE FilmID = @FilmID;

    SELECT @NazwaFilmu = (SELECT Tytul FROM Film WHERE ID = @FilmID);


    PRINT 'Średnia ocena dla filmu pt. ' + @NazwaFilmu + ', po dodaniu Twojej oceny wynosi: ' + CAST(@SredniaOcena AS VARCHAR);

END


INSERT INTO OcenaFilmu (ID, Ocena, Komentarz, KlientId, FilmID)
VALUES (5, 4, 'Superowo!', 3, 4);

UPDATE OcenaFilmu SET SredniaOcena = NULL WHERE ID = 4;

SELECT * FROM OcenaFilmu;

DELETE FROM OcenaFilmu Where id = 5;



