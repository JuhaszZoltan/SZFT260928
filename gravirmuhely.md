# gravirmuhely adatbázis

## termek tábla:
gravírozóműhely kínálatában szereplő ajándéktárgyak

| mező | típus | megszorítás | leírás |
| :--- | :--- | :--- | :--- |
| termekid | egész | elsődleges kulcs, automatikusan növekvő | a termék egyedi azonosítója |
| tnev | szöveg, változó hossz (100) | kötelező kitöltés | a termék neve |
| anyag | szöveg, változó hossz (30) | kötelező kitöltés | a termék alapanyaga |
| technologia | szöveg, változó hossz (50) | nem kötelező kitöltés | az alkalmazott gravírozási technológia |
| keszlet | előjel nélküli egész | kötelező kitöltés, alapértelmezetten 0 | aktuális készlet (darab) |
| ajandekdobozos | logikai | nem kötelező kitöltés | díszdobozban kapható-e (1,0) |
| kepurl | szöveg, változó hossz (300) | nem kötelező kitöltés | a terméket ábrázoló kép elérési útvonala (jelenleg csak fájlnév) |
| egysegar | előjel nélküli egész | kötelező kitöltés | egy darabra vonatkozó ár forintban |

## ugyfel tábla:
magánszemélyként regisztrált vásárlók

| mező | típus | megszorítás | leírás |
| :--- | :--- | :--- | :--- |
| ugyfelid | egész | elsődleges kulcs, automatikusan növekvő | az ügyfél egyedi azonosítója |
| nev | szöveg, változó hossz (100) | kötelező kitöltés | az ügyfél teljes neve |
| email | szöveg, változó hossz (150) | kötelező kitöltés, egyedi érték | az ügyfél email címe |
| telefon | szöveg, változó hossz (20) | nem kötelező kitöltés, egyedi érték | az ügyfél telefonszáma |
| iranyitoszam | szöveg, fix hossz (4) | kötelező kitöltés | az ügyfél lakhelyének irányítószáma |
| telepules | szöveg, változó hossz (50) | kötelező kitöltés | az ügyfél lakhelyének városa |
| cim | szöveg, változó hossz (150) | kötelező kitöltés | az ügyfél lakhelyének címe |
| regisztracio | dátum-idő | kötelező kitöltés, alapértelmezetten current_timestamp() | a regisztráció pontos időpontja |

## rendeles tábla:
rendelések (egy rendelés ezzel a struktúrával csak egyféle terméket tartalmazhat)

| mező | típus | megszorítás | leírás |
| :--- | :--- | :--- | :--- |
| rendelesid | egész | elsődleges kulcs, automatikusan növekvő | a rendelés egyedi azonosítója |
| ugyfelid | egész | külső kulcs -> ugyfel.ugyfelid | megrendelő ügyfél azonosítója |
| termekid | egész | külső kulcs -> termek.termekid | megrendelt termék azonosítója |
| rendelesido | dátum-idő | kötelező kitöltés, alapértelmezetten current_timestamp() | megrendelés pontos ideje |
| mennyiseg | előjel nélküli egész | kötelező kitöltés | rendelés mennyisége |
| rendelesi_egysegar | előjel nélküli egész | kötelező kitöltés | a rendelés leadásakor aktuális egységár |
| atveteldatum | dátum | nem kötelező kitöltés | a rendelés átvételének dátuma (null, ha még nem vették át) |
| megjegyzes | szöveg, változó hossz (500) | nem kötelező kitöltés | a megrendeléshez kapcsolódó ügyféligények |

## táblák kapcsolata

```mermaid
erDiagram
    termek ||--o{ rendeles : "termekid"
    ugyfel ||--o{ rendeles : "ugyfelid"

    termek {
        int(11) termekid PK "NOT NULL, AUTO_INCREMENT"
        varchar(100) tnev "NOT NULL"
        varchar(30) anyag "NOT NULL"
        varchar(50) technologia "NULL"
        smallint(5) keszlet "NOT NULL, DEFAULT 0"
        tinyint(1) ajandekdobozos "NULL"
        varchar(300) kepurl "NULL"
        int(10) egysegar "NOT NULL"
    }

    rendeles {
        int(11) rendelesid PK "NOT NULL, AUTO_INCREMENT"
        int(11) ugyfelid FK "NOT NULL"
        int(11) termekid FK "NOT NULL"
        datetime rendelesido "NOT NULL, DEFAULT current_timestamp()"
        smallint(5) mennyiseg "NOT NULL"
        int(10) rendelesi_egysegar "NOT NULL"
        date atveteldatum "NULL"
        varchar(500) megjegyzes "NULL"
    }

    ugyfel {
        int(11) ugyfelid PK "NOT NULL, AUTO_INCREMENT"
        varchar(100) nev "NOT NULL"
        varchar(150) email UNIQUE "NOT NULL"
        varchar(20) telefon UNIQUE "NULL"
        char(4) iranyitoszam "NOT NULL"
        varchar(50) telepules "NOT NULL"
        varchar(150) cim "NOT NULL"
        datetime regisztracio "NOT NULL, DEFAULT current_timestamp()"
    }

```