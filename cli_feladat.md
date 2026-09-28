# Gravírműhely CLI

> Ebben a feladatban az [ajándéktárgyak gravírozásával](https://en.wikipedia.org/wiki/Engraving) foglalkozó kisvállalkozás megrendelési adataival kell dolgoznia.

A `gravirmuhely.csv` vesszővel (`,`) tagolt `UTF-8`-as karakterkódolású állomány. Az állomány első pár sora:

![1. ábra: forrásfile eleje](https://raw.githubusercontent.com/JuhaszZoltan/SZFT260928/refs/heads/main/imgs/figures/cli_fig_01.png)

Az adattagok a következők:
| adattag | típus/formátum |
| ------- | -------------- |
| megrendelő neve | karakterlánc |
| termék megnevezése | karakterlánc |
| termék anyaga | karakterlánc |
| gravírozási technológia | karakterlánc |
| rendelés ára | egész szám |
| rendelési idő | dátum-idő `yyyy-MM-dd HH:mm:ss` formátumban [^1] |
| átvételi dátum | dátum `yyyy-MM-dd` formátumban |

-  Készítsen olyan projektet `EngravingWorkshopCLI` néven, mely rendszerkonzolos vagy terminálos kimenet megjelenítésére alkalmas!
-  Definiáljon saját osztályt `Order` néven, amely egy-egy megrendelési tétel felépítését írja le a leírtaknak megfelelően!
-  Bírálja felül az `Order` osztály `.ToString()` virtuális metódusát, hogy hívás esetén a rendelés minden részletét tartalmazó karakterlánccal térjen vissza[^2]!
-  Olvassa be a `gravirmuhely.csv` tartalmát egy `Order` osztálypéldányokat tartalmazó kollekcióba, a további problémákat ezen kollekció felhasználásával oldja meg! **Ügyeljen rá, hogy az első sor a fejlécet tartalmazza!**
---
1. írja ki a megrendelések számát!
2. írja ki, hogy hány alkalommal adtak le megrendelést üveg anyagú tárgy gravírozására!
3. kérje be egy termék nevét, határozza meg, írja ki, hogy volt-e ilyen termékre leadott megrendelés!
4. írja ki a legnagyobb értékű rendelés adatait!
5. írja ki azon megrendelők neveit, akik több alkalommal is adtak le megrendelést a műhelynek a jegyzett időszakban!
---
- a .csv-ben található minden megrendelés 2025-ös. kérje be egy hónap sorszámát, és írja ki az adott hónap bevételét
- határozza meg a teljes jegyzett időszakra az összbevételt
- határozza meg a jegyzett időszakra az átlagos havi árbevételt
- határozza meg, hogy melyik gravírozási technikára való megrendelés a leggyakoribb
- listázza ki azon megrendelések adatait, akik nem vették át a rendelést 3 napon belül
- határozza meg a 10.000 HUF alatti megrendelések számát
- határozza meg, hogy mely termékekre hány darab megrendelés érkezett, írja ki azokat és a rájuk vonatkozó megrendelések számát, ahol egynél több megrendelés volt
- határozza meg, hogy ki adta le a legalacsonyabb árú hokogfúvásos technikával készített megrendelést

### minta[^3]:
```plaintext
1. feladat: A megrendelések száma: 20 db
2. feladat: Üveg anyagú tárgy gravírozására 3 alkalommal adtak le megrendelést.
3. feladat: Kérem, adja meg egy termék nevét: Zsebóra
        Volt megrendelés a megadott termékre!
4. feladat: A legnagyobb értékű rendelés adatai:
        Megrendelő neve: Gál Bettina
        Rendelt termék: Bortartó doboz (fa)
        Gravírozási technológia: lézergravírozás
        Rendelés összára: 20 500 Ft
        Rendelési idő: 2025. 10. 06. 16:45
        Átvételi dátum: 2025. 10. 10.
 5. feladat: Több alkalommal rendelő ügyfelek:
        - Barta Gergely
        - Németh Balázs
        - Major Dániel
        - Lengyel Csilla
```
---
[^1]: a másodperc (`:ss`) mindig nulla (`:00`) - mind a kiírásból, mind a tárolásból szükség szerint elhagyható
[^2]: a mintában látható formátumtól eltérhet, a lényeg, hogy minden adattak jelennyen meg
[^3]: a minta csak a számozott feladatokhoz van (kb. ennyi reális a VZ időkeret és pontszám-súlyozás szempontjából)