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
        int(11) termekid PK
        varchar(100) tnev
        varchar(30) anyag
        varchar(50) technologia
        smallint(5)_unsigned keszlet
        tinyint(1) ajandekdobozos
        varchar(300) kepurl
        int(10)_unsigned egysegar
    }

    rendeles {
        int(11) rendelesid PK
        int(11) ugyfelid FK
        int(11) termekid FK
        datetime rendelesido
        smallint(5)_unsigned mennyiseg
        int(10)_unsigned rendelesi_egysegar
        date atveteldatum
        varchar(500) megjegyzes
    }

    ugyfel {
        int(11) ugyfelid PK
        varchar(100) nev
        varchar(150) email UK
        varchar(20) telefon UK
        char(4) iranyitoszam
        varchar(50) telepules
        varchar(150) cim
        datetime regisztracio
    }
```