Opis bazdy danych dla projektu PLSQL i T-SQL:
Baza danych obejmuje informacje o kinie, klientach, ocenach filmów, filmach, gatunkach filmowych, seansach, rezerwacjach,
salach kinowych, typach sali i adresach - czyli wszystkie kluczowe elementy związane z funkcjonowaniem kina.
Pozwala na śledzenie informacji dotyczących filmów, ich ocen, seansów, miejsca ich przedstawienia i rezerwacji klientów.

Projekt T-SQL:
Procedura bedzie umozliwiala odwolanie danego seansu z repertuaru(w najdalszym terminie wynoszacym
5 dni od daty biezacej) jesli ilosc rezerwacji bedzie mniejsza niz argument podawany przez uzytkownika. Uzytkownik oprocz tego podaje
date poczatkowa i koncowa miedzy ktorymi bedzie wyszukiwany seans. Zostaja rowniez odwolane rezerwacje klientow na dany film, ktory ma
ilosc rezerwacji ponizej argumentu.

Wyzwalacz sprawdza, czy wprowadzona ocena i komentarz dotyczą filmu, ktory juz mial swoja premiere w tym kinie.
Sprawdza on rowniez czy dany klient nie wystawił już oceny temu filmowi.
Jesli ocena i komentarz są na temat filmu, który nie miał jeszcze premiery, lub klient dał już ocenę temu filmowi,
to zmiany zostają wycofane. Dodatkowo zostaje updateowana kolumna SredniaOcena w tabeli OcenaFilmu, dla filmu, dla którego został
dodany poprawny komentarz.

Projekt PLSQL:
W ramach tego projektu została odwzorowana procedura z projektu T-SQL - jej funkcjonalność jest niemalże identyczna.
