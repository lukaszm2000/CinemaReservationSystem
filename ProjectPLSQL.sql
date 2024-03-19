CREATE TABLE ADRES(
    ID NUMBER CONSTRAINT PK_Adres PRIMARY KEY,
    Miasto VARCHAR2(20) NOT NULL,
    Ulica VARCHAR2(30) NOT NULL,
    NrDomu NUMBER NOT NULL,
    NrLokalu NUMBER,
    KodPocztowy VARCHAR2(6) NOT NULL
);
/
CREATE TABLE Klient(
    ID NUMBER CONSTRAINT PK_Klient PRIMARY KEY,
    Imie VARCHAR2(30) NOT NULL,
    Nazwisko VARCHAR2(30) NOT NULL,
    AdresId NUMBER CONSTRAINT FK_Klient_AdresID REFERENCES Adres(ID)
);
/
CREATE TABLE Film(
    ID NUMBER CONSTRAINT PK_Film PRIMARY KEY,
    Tytul VARCHAR2(30) NOT NULL,
    RokProdukcji NUMBER NOT NULL,
    Rezyser VARCHAR2(30) NOT NULL,
    CzasTrwania INTERVAL DAY TO SECOND NOT NULL,
    GatunekFilmID NUMBER CONSTRAINT FK_Film_GatunekFilmID REFERENCES GatunekFilm(ID)
);
/
CREATE TABLE GatunekFilm (
    ID NUMBER CONSTRAINT PK_GatunekFilm PRIMARY KEY,
    Nazwa VARCHAR2(20) NOT NULL
);
/
CREATE TABLE Seans(
    ID NUMBER CONSTRAINT PK_Seans PRIMARY KEY,
    DataSeansu DATE NOT NULL,
    GodzinaSeansu TIMESTAMP NOT NULL,
    Cena NUMBER(4,2) NOT NULL,
    FilmId NUMBER CONSTRAINT FK_Seans_FilmID REFERENCES Film(ID),
    SalaId NUMBER CONSTRAINT FK_Seans_SalaID REFERENCES Sala(ID),
    CzyOdwolany NUMBER(1,0) CHECK (CzyOdwolany IN (0, 1)) NOT NULL
);
/
CREATE TABLE Rezerwacja(
    ID NUMBER CONSTRAINT PK_Rezerwacja PRIMARY KEY,
    StatusRezerwacji VARCHAR2(20) NOT NULL,
    KlientID NUMBER CONSTRAINT FK_Rezerwacja_KlientID REFERENCES Klient(ID),
    SeansID NUMBER CONSTRAINT FK_Rezerwacja_SeansID REFERENCES Seans(ID),
    DataRezerwacji DATE NOT NULL
);
/
CREATE TABLE Sala(
    ID NUMBER CONSTRAINT PK_Sala PRIMARY KEY,
    Nr NUMBER NOT NULL,
    Pojemnosc NUMBER NOT NULL,
    TypSaliID NUMBER CONSTRAINT FK_Sala_TypSaliID REFERENCES TypSali(ID)
);
/
CREATE TABLE TypSali(
    ID NUMBER CONSTRAINT PK_TypSali PRIMARY KEY,
    Nazwa VARCHAR2(20) NOT NULL
);
/

--Tabela Adres
INSERT INTO Adres (ID, Miasto, Ulica, NrDomu, NrLokalu, KodPocztowy)
VALUES
    (1, 'Warszawa', 'Mazowiecka', 10, NULL, '00-001');

INSERT INTO Adres (ID, Miasto, Ulica, NrDomu, NrLokalu, KodPocztowy)
VALUES
    (2, 'Kraków', 'Zlota', 5, 3, '30-002');

INSERT INTO Adres (ID, Miasto, Ulica, NrDomu, NrLokalu, KodPocztowy)
VALUES
    (3, 'Gdańsk', 'Zielona', 15, NULL, '80-001');

INSERT INTO Adres (ID, Miasto, Ulica, NrDomu, NrLokalu, KodPocztowy)
VALUES
    (4, 'Poznań', 'Kolorowa', 20, 5, '60-002');

INSERT INTO Adres (ID, Miasto, Ulica, NrDomu, NrLokalu, KodPocztowy)
VALUES
    (5, 'Wrocław', 'Polska', 8, 2, '50-003');

INSERT INTO Adres (ID, Miasto, Ulica, NrDomu, NrLokalu, KodPocztowy)
VALUES
    (6, 'Kraków', 'Kopernika', 25, 4, '30-003');

INSERT INTO Adres (ID, Miasto, Ulica, NrDomu, NrLokalu, KodPocztowy)
VALUES
    (7, 'Gdynia', 'Kolejowa', 18, NULL, '81-001');

--Tabela Klient
INSERT INTO Klient (ID, Imie, Nazwisko, AdresId)
VALUES
    (1, 'Jan', 'Kowalski', 1);

INSERT INTO Klient (ID, Imie, Nazwisko, AdresId)
VALUES
    (2, 'Anna', 'Nowacka', 2);

INSERT INTO Klient (ID, Imie, Nazwisko, AdresId)
VALUES
    (3, 'Katarzyna', 'Karolek', 3);

INSERT INTO Klient (ID, Imie, Nazwisko, AdresId)
VALUES
    (4, 'Tomasz', 'Poznanski', 4);

INSERT INTO Klient (ID, Imie, Nazwisko, AdresId)
VALUES
    (5, 'Magdalena', 'Kordas', 5);

INSERT INTO Klient (ID, Imie, Nazwisko, AdresId)
VALUES
    (6, 'Michał', 'Dąbrowski', 6);

INSERT INTO Klient (ID, Imie, Nazwisko, AdresId)
VALUES
    (7, 'Karolina', 'Nowakowska', 7);

INSERT INTO Klient (ID, Imie, Nazwisko, AdresId)
VALUES
    (8, 'Piotr', 'Piotrowski', 2);

INSERT INTO Klient (ID, Imie, Nazwisko, AdresId)
VALUES
    (9, 'Aleksandra', 'Tulipan', 3);

INSERT INTO Klient (ID, Imie, Nazwisko, AdresId)
VALUES
    (10, 'Grzegorz', 'Jasinski', 4);

--Tabela GatunekFilm
INSERT INTO GatunekFilm (ID, Nazwa)
VALUES
    (1, 'Horror');

INSERT INTO GatunekFilm (ID, Nazwa)
VALUES
    (2, 'Komedia');

INSERT INTO GatunekFilm (ID, Nazwa)
VALUES
    (3, 'Akcja');

--Tabela Film
INSERT INTO Film (ID, Tytul, RokProdukcji, Rezyser, CzasTrwania, GatunekFilmID)
VALUES
    (1, 'Martyrs', 2023, 'Pascal Raugier', TO_DSINTERVAL('0 02:30:00'), 1);

INSERT INTO Film (ID, Tytul, RokProdukcji, Rezyser, CzasTrwania, GatunekFilmID)
VALUES
    (2, 'Nietykalni', 2024, 'Oliver Nakache', TO_DSINTERVAL('0 01:45:00'), 2);

INSERT INTO Film (ID, Tytul, RokProdukcji, Rezyser, CzasTrwania, GatunekFilmID)
VALUES
    (3, 'Maqball', 2025, 'Vishal Bhardwaj', TO_DSINTERVAL('0 01:55:00'), 3);

INSERT INTO Film (ID, Tytul, RokProdukcji, Rezyser, CzasTrwania, GatunekFilmID)
VALUES
    (4, 'Jas Fasola', 2023, 'Robert Henricks', TO_DSINTERVAL('0 01:30:00'), 1);

--Tabela TypSali
INSERT INTO TypSali (ID, Nazwa)
VALUES
    (1, 'Sala Standard');

INSERT INTO TypSali (ID, Nazwa)
VALUES
    (2, 'Sala Premium');

--Tabela Sala
INSERT INTO Sala (ID, Nr, Pojemnosc, TypSaliID)
VALUES
    (1, 101, 60, 1); -- Sala Standard

INSERT INTO Sala (ID, Nr, Pojemnosc, TypSaliID)
VALUES
    (2, 102, 20, 2); -- Sala Premium

--Tabela Seans
INSERT INTO Seans (ID, DataSeansu, GodzinaSeansu, Cena, FilmId, SalaId, CzyOdwolany)
VALUES
    (1, TO_DATE('2023-11-25', 'YYYY-MM-DD'), TO_TIMESTAMP('19:30:00', 'HH24:MI:SS'), 20.00, 1, 1, 0);

INSERT INTO Seans (ID, DataSeansu, GodzinaSeansu, Cena, FilmId, SalaId, CzyOdwolany)
VALUES
    (2, TO_DATE('2023-11-26', 'YYYY-MM-DD'), TO_TIMESTAMP('21:30:00', 'HH24:MI:SS'), 15.50, 2, 2, 0);

INSERT INTO Seans (ID, DataSeansu, GodzinaSeansu, Cena, FilmId, SalaId, CzyOdwolany)
VALUES
    (3, TO_DATE('2023-11-27', 'YYYY-MM-DD'), TO_TIMESTAMP('17:30:00', 'HH24:MI:SS'), 18.50, 3, 1, 0);

INSERT INTO Seans (ID, DataSeansu, GodzinaSeansu, Cena, FilmId, SalaId, CzyOdwolany)
VALUES
    (4, TO_DATE('2023-10-20', 'YYYY-MM-DD'), TO_TIMESTAMP('17:00:00', 'HH24:MI:SS'), 30.00, 4, 1, 0);

--Tabela Rezerwacja
INSERT INTO Rezerwacja (ID, StatusRezerwacji, KlientID, SeansID, DataRezerwacji)
VALUES
    (1, 'Potwierdzona', 1, 1, TO_DATE('2023-11-20', 'YYYY-MM-DD'));

INSERT INTO Rezerwacja (ID, StatusRezerwacji, KlientID, SeansID, DataRezerwacji)
VALUES
    (2, 'Potwierdzona', 2, 2, TO_DATE('2023-11-18', 'YYYY-MM-DD'));

INSERT INTO Rezerwacja (ID, StatusRezerwacji, KlientID, SeansID, DataRezerwacji)
VALUES
    (3, 'Potwierdzona', 3, 3, TO_DATE('2023-11-01', 'YYYY-MM-DD'));

INSERT INTO Rezerwacja (ID, StatusRezerwacji, KlientID, SeansID, DataRezerwacji)
VALUES
    (4, 'Potwierdzona', 4, 1, TO_DATE('2023-11-20', 'YYYY-MM-DD'));

INSERT INTO Rezerwacja (ID, StatusRezerwacji, KlientID, SeansID, DataRezerwacji)
VALUES
    (5, 'Potwierdzona', 5, 2, TO_DATE('2023-11-18', 'YYYY-MM-DD'));

INSERT INTO Rezerwacja (ID, StatusRezerwacji, KlientID, SeansID, DataRezerwacji)
VALUES
    (6, 'Potwierdzona', 6, 3, TO_DATE('2023-11-20', 'YYYY-MM-DD'));

INSERT INTO Rezerwacja (ID, StatusRezerwacji, KlientID, SeansID, DataRezerwacji)
VALUES
    (7, 'Potwierdzona', 7, 1, TO_DATE('2023-11-18', 'YYYY-MM-DD'));

INSERT INTO Rezerwacja (ID, StatusRezerwacji, KlientID, SeansID, DataRezerwacji)
VALUES
    (8, 'Potwierdzona', 8, 2, TO_DATE('2023-11-18', 'YYYY-MM-DD'));

INSERT INTO Rezerwacja (ID, StatusRezerwacji, KlientID, SeansID, DataRezerwacji)
VALUES
    (9, 'Potwierdzona', 9, 3, TO_DATE('2023-11-01', 'YYYY-MM-DD'));

INSERT INTO Rezerwacja (ID, StatusRezerwacji, KlientID, SeansID, DataRezerwacji)
VALUES
    (10, 'Potwierdzona', 10, 1, TO_DATE('2023-11-20', 'YYYY-MM-DD'));

INSERT INTO Rezerwacja (ID, StatusRezerwacji, KlientID, SeansID, DataRezerwacji)
VALUES
    (11, 'Potwierdzona', 1, 2, TO_DATE('2023-11-01', 'YYYY-MM-DD'));

INSERT INTO Rezerwacja (ID, StatusRezerwacji, KlientID, SeansID, DataRezerwacji)
VALUES
    (12, 'Potwierdzona', 2, 3, TO_DATE('2023-11-18', 'YYYY-MM-DD'));

INSERT INTO Rezerwacja (ID, StatusRezerwacji, KlientID, SeansID, DataRezerwacji)
VALUES
    (13, 'Potwierdzona', 3, 1, TO_DATE('2023-11-01', 'YYYY-MM-DD'));

INSERT INTO Rezerwacja (ID, StatusRezerwacji, KlientID, SeansID, DataRezerwacji)
VALUES
    (14, 'Potwierdzona', 3, 2, TO_DATE('2023-11-18', 'YYYY-MM-DD'));

INSERT INTO Rezerwacja (ID, StatusRezerwacji, KlientID, SeansID, DataRezerwacji)
VALUES
    (15, 'Potwierdzona', 9, 2, TO_DATE('2023-11-20', 'YYYY-MM-DD'));

INSERT INTO Rezerwacja (ID, StatusRezerwacji, KlientID, SeansID, DataRezerwacji)
VALUES
    (16, 'Potwierdzona', 10, 3, TO_DATE('2023-11-01', 'YYYY-MM-DD'));

INSERT INTO Rezerwacja (ID, StatusRezerwacji, KlientID, SeansID, DataRezerwacji)
VALUES
    (17, 'Potwierdzona', 10, 2, TO_DATE('2023-11-18', 'YYYY-MM-DD'));

INSERT INTO Rezerwacja (ID, StatusRezerwacji, KlientID, SeansID, DataRezerwacji)
VALUES
    (18, 'Potwierdzona', 5, 1, TO_DATE('2023-11-20', 'YYYY-MM-DD'));

INSERT INTO Rezerwacja (ID, StatusRezerwacji, KlientID, SeansID, DataRezerwacji)
VALUES
    (19, 'Potwierdzona', 6, 2, TO_DATE('2023-11-18', 'YYYY-MM-DD'));

INSERT INTO Rezerwacja (ID, StatusRezerwacji, KlientID, SeansID, DataRezerwacji)
VALUES
    (20, 'Potwierdzona', 7, 2, TO_DATE('2023-11-01', 'YYYY-MM-DD'));
INSERT INTO Rezerwacja (ID, StatusRezerwacji, KlientID, SeansID, DataRezerwacji)
VALUES
    (21, 'Potwierdzona', 1, 4, TO_DATE('2023-11-01', 'YYYY-MM-DD'));

-- Procedura bedzie umozliwiala odwolanie danego seansu z repertuaru(w najdalszym terminie wynoszacym
-- 5 dni od daty biezacej)jesli ilosc rezerwacji bedzie mniejsza niz argument podawany przez uzytkownika. Uzytkownik oprocz tego podaje
-- date poczatkowa i koncowa miedzy ktorymi bedzie wyszukiwany seans. Zostaja rowniez odwolane rezerwacje klientow na dany film, ktory ma
-- ilosc rezerwacji ponizej argumentu.

CREATE OR REPLACE PROCEDURE Aktualizuj_Filmy_W_Podanym_Przedziale_Czasowym (
    DataPoczatkowa DATE,
    DataKoncowa DATE,
    MinimalnaLiczbaRezerwacji INT
)
IS
BEGIN
    IF DataPoczatkowa <= SYSDATE THEN
        RAISE_APPLICATION_ERROR(-20001, 'Nie możesz podać daty mniejszej niż dzisiejsza.');
    END IF;

    IF DataPoczatkowa > DataKoncowa THEN
        RAISE_APPLICATION_ERROR(-20002, 'Data początkowa nie może być terminem dalszym niż 5 dni od daty bieżącej.');
    END IF;

    IF MinimalnaLiczbaRezerwacji < 0 THEN
        RAISE_APPLICATION_ERROR(-20003, 'Minimalna liczba rezerwacji nie może być mniejsza niż 0.');
    END IF;

    IF DataKoncowa > SYSDATE + 5 THEN
        RAISE_APPLICATION_ERROR(-20004, 'Data końcowa nie może być dalsza niż 5 dni od bieżącej daty.');
    END IF;

    FOR SeansRec IN (
        SELECT s.ID, s.FilmID, COUNT(r.ID) AS IloscRezerwacji
        FROM Seans s
        LEFT JOIN Rezerwacja r ON s.ID = r.SeansID
        WHERE s.DataSeansu BETWEEN DataPoczatkowa AND DataKoncowa
        AND r.StatusRezerwacji <> 'Anulowana'
        GROUP BY s.ID, s.FilmID
    )
    LOOP
        DECLARE
            v_NowyFilmID INT;
            v_CenaSeansu DECIMAL(4, 2);
            v_SalaID INT;
            v_NoweID INT;
            v_DataSeansu DATE;
            v_GodzinaSeansu DATE;
            v_czyOdwolany int;
            v_FilmId int;
        BEGIN
            if seansrec.IloscRezerwacji < MinimalnaLiczbaRezerwacji then
                SELECT FilmID INTO v_NowyFilmID
                FROM (
                    SELECT s.FilmID, COUNT(r.ID) AS IloscRezerwacji
                    FROM Seans s
                    LEFT JOIN Rezerwacja r ON s.ID = r.SeansID
                    WHERE s.DataSeansu BETWEEN DataPoczatkowa AND DataKoncowa
                    AND r.StatusRezerwacji <> 'Anulowana'
                    GROUP BY s.FilmID
                    ORDER BY COUNT(r.ID) DESC
                ) WHERE ROWNUM = 1;

                select CZYODWOLANY into v_czyOdwolany from seans where id = SeansRec.ID;

                -- Odwołanie seansu, jeśli nie zostało to jeszcze zrobione
                IF SeansRec.FilmID <> v_NowyFilmID AND v_CzyOdwolany = 0 THEN
                    UPDATE Rezerwacja SET StatusRezerwacji = 'Anulowana'
                    WHERE SeansID = SeansRec.ID;

                    UPDATE Seans SET CzyOdwolany = 1 WHERE ID = SeansRec.ID;
                END IF;

                -- Pobierz dane dla najbardziej popularnego filmu
                SELECT DataSeansu, GodzinaSeansu, Cena, SalaID
                INTO v_DataSeansu, v_GodzinaSeansu, v_CenaSeansu, v_SalaID
                FROM Seans
                WHERE ID = SeansRec.ID;
                commit;
                -- Pobierz cenę dla najbardziej popularnego filmu
                SELECT MAX(Cena) INTO v_CenaSeansu
                FROM Seans
                WHERE FilmID = v_NowyFilmID
                GROUP BY FilmID
                ORDER BY COUNT(ID) DESC
                FETCH FIRST 1 ROWS ONLY;
                select filmid into v_FilmId from SEANS where id = SeansRec.ID;
                --select * from emp;
                -- Wstaw nowy seans, jeśli nie zostaje ten sam film
                IF v_FilmID <> v_NowyFilmID THEN
                    select NVL(max(id),0)+1 into v_NoweID from seans;
                    INSERT INTO Seans (ID, DataSeansu, GodzinaSeansu, Cena, FilmID, SalaID, CzyOdwolany)
                    VALUES (v_NoweID, v_DataSeansu, v_GodzinaSeansu, v_CenaSeansu, v_NowyFilmID, v_SalaID, 0);
                END IF;
            end if;
        END;
    END LOOP;
END Aktualizuj_Filmy_W_Podanym_Przedziale_Czasowym;


declare
    DataPoczatkowa DATE;
    DataKoncowa DATE;
    MinimalnaLiczbaRezerwacji INT;
begin
    DataPoczatkowa := '2024-01-29';
    DataKoncowa := '2024-01-30';
    MinimalnaLiczbaRezerwacji := 6;
    Aktualizuj_Filmy_W_Podanym_Przedziale_Czasowym(DataPoczatkowa, DataKoncowa, MinimalnaLiczbaRezerwacji);
end;


SELECT s.ID, s.FilmID, COUNT(r.ID) AS IloscRezerwacji, s.DataSeansu, s.GodzinaSeansu
        FROM Seans s
        LEFT JOIN Rezerwacja r ON s.ID = r.SeansID
        WHERE r.StatusRezerwacji <> 'Anulowana'
        GROUP BY s.ID, s.FilmID, s.DataSeansu, s.GodzinaSeansu;


select * from seans;
update seans set CzyOdwolany = 0 where id > 0;
delete from seans where id > 3;
select * from REZERWACJA;
update REZERWACJA set STATUSREZERWACJI = 'Potwierdzona';

update seans set DATASEANSU = '2024-01-25';

SELECT * FROM Emp WHERE EmpNo=EmpNo AND NULL=EmpNo;

SELECT MAX(hiredate) FROM emp GROUP BY deptno);

SELECT deptno, ename, hiredate FROM emp e WHERE (hiredate) = (SELECT MAX(hiredate) FROM emp WHERE deptno=e.deptno GROUP BY deptno);

select * from emp;


SELECT job, AVG(sal) FROM emp HAVING AVG (sal) >= 3000 GROUP BY job;

INSERT INTO @ename SELECT ename FROM emp WHERE deptno = 10;
