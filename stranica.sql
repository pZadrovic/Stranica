-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 13, 2024 at 09:45 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `stranica`
--

-- --------------------------------------------------------

--
-- Table structure for table `korisnik`
--

CREATE TABLE `korisnik` (
  `id` int(11) NOT NULL,
  `ime` varchar(64) NOT NULL,
  `prezime` varchar(64) NOT NULL,
  `korisnicko_ime` varchar(64) NOT NULL,
  `lozinka` varchar(255) NOT NULL,
  `razina` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `korisnik`
--

INSERT INTO `korisnik` (`id`, `ime`, `prezime`, `korisnicko_ime`, `lozinka`, `razina`) VALUES
(1, 'aaaa', 'bbbb', 'ababa', '$2y$10$sIgBwt0t3pwXNgxVPaX4/uGR0cTS.FK0O4tBo8KzpU5eWc0wFrp1G', 0),
(2, 'Petra', 'Zad', 'petra123', '$2y$10$BlOg9ESW0HBzcuAz5wyS6uqT6sCZv3EklFDnb9w/Uu0MxRppb7l5i', 1),
(3, 'ghghg', 'ttttttttt', 'pliz123', '$2y$10$GTqoGflSZIg97FMbZHHcoe6eFxAthA3n9STKDm3q5MPxLj9svKnTu', 0);

-- --------------------------------------------------------

--
-- Table structure for table `vijesti`
--

CREATE TABLE `vijesti` (
  `id` int(11) NOT NULL,
  `datum` varchar(32) NOT NULL,
  `naslov` varchar(100) NOT NULL,
  `sazetak` text NOT NULL,
  `tekst` text NOT NULL,
  `slika` varchar(100) NOT NULL,
  `kategorija` varchar(64) NOT NULL,
  `arhiva` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vijesti`
--

INSERT INTO `vijesti` (`id`, `datum`, `naslov`, `sazetak`, `tekst`, `slika`, `kategorija`, `arhiva`) VALUES
(32, '13.06.2024.', 'Vijesttttt', 'Ovo se ukratko dogodilo... ili nije?!?', 'Događaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaj', 'ref.jpg', 'hrvatska', 0),
(33, '13.06.2024.', 'Stigla prva reakcija Rusije na odluku moćnih zemalja: \"Odgovor će biti bolan za EU\"', 'GLASNOGOVORNICA ruskog ministarstva vanjskih poslova Maria Zaharova rekla je danas da su pokušaji Zapada da uzme prihod od zamrznute ruske imovine kriminalni i da bi doveli do odgovora Moskve koji bi bio vrlo bolan za Europsku uniju.', 'G7 i Europska unija razmišljaju kako iskoristiti dobit ostvarenu zamrznutom ruskom imovinom na Zapadu da Ukrajini daju velik zajam, kojim bi se osiguralo financiranje Kijeva za 2025. Zaharova je danas prijetnjom odgovorila i na inicijativu dijela članica Unije da se ruskim diplomatima ograniči kretanje.\r\n\"Zapad je zaražen rusofobijom\"\r\n\r\nGlasnogovornica ruskog ministarstva rekla je novinarima da je Zapad zaražen rusofobijom i da će Moskva poduzeti protumjere ako budu uvedena takva ograničenja. \"Rusija će odgovoriti na sva ograničenja kretanja koja europske zemlje budu nametnule njezinim diplomatima\", najavila je Zaharova.\r\n\r\nU pismu visokom predstavniku EU za vanjsku politiku Josepu Borrellu osam ministara vanjskih poslova Europske unije pozvalo je EU da zabrani ruskim diplomatima slobodno kretanje po Uniji i ograniči ih na zemlje u kojima su akreditirani.', 'a.jpg', 'svijet', 0),
(34, '13.06.2024.', 'Čovjek koji je sjekirom razbijao aute dugo živio s mrtvom majkom? Otkriven motiv', 'ZAGREBAČKA policija danas u 14:25 zaprimila je dojavu o muškarcu koji na području Susedgrada bez odjeće hoda ulicom i sjekirom oštećuje automobile.', 'Muškarac se zatim uputio na svoju kućnu adresu, gdje su ga policajci zatekli i priveli u službene prostorije. U kući je pronađeno tijelo. Iz policije su naveli kako se najvjerojatnije radi o starijoj članici obitelji. RTL Danas neslužbeno doznaje kako je riječ o majci privedenog muškarca. \r\nNe zna se je li žena ubijena\r\n\r\nU ovom trenutku nije moguće utvrditi uzrok smrti s obzirom na zatečeno stanje tijela zbog posljedica dužeg proteka vremena.\r\n\r\nDakle, policija još ne zna je li ženska osoba ubijena ili je umrla prirodnom smrću. Jedino što je dosad jasno jest da je smrt nastupila prije nekog vremena, što otežava utvrđivanje uzroka smrti.\r\nMuškarac je pod nadzorom policije\r\n\r\nTek nakon što se utvrdi uzrok smrti, policija će moći priopćiti javnosti za što tereti muškarca. Nije isključen scenarij da je žena umrla prirodnom smrću, a da je on držao njeno tijelo u kući i da nikome nije prijavio smrt. \r\n\r\nMuškarac je pod nadzorom policije, a na teren je izišla ekipa za očevid Policijske uprave zagrebačke. Kriminalističko istraživanje je u tijeku. \r\n\"Nije bio agresivan nikad\"\r\n\r\nDnevnik Nove TV javlja kako je muškarac ušao u tuđe dvorište pa sjekirom razbio staklo na automobilu, a zatim i na kući. Ljudi koji su bili u kući tada su pozvali policiju.\r\n\r\nSusjedi su za Dnevnik Nove TV ispričali kako ništa nije ukazivalo na ovakav razvoj događaja jer je muškarac bio miran i nije pravio nikakve probleme. Ipak, sumnjivo im je bilo što više od dvije godine nisu vidjeli njegovu majku. Opisali su i što se danas događalo.\r\n\r\n\"Vidjela sam da je on bio gol i imao je sjekiru. Išao je k susjedu i rekao mu je da je on iskopčao struju\", kazala je susjeda. \r\nOtkriven motiv\r\n\r\n\"Došao je sa sjekirom i udario je po staklu od auta, po staklu od kuće. Možda je imao namjeru nekoga ozlijediti, ali nije bio agresivan nikad. Prije dvije godine se povukao potpuno od svih drugih ljudi. Ne znamo što se dogodilo, u šoku smo svi\", dodao je susjed. \r\n\r\nPrema neslužbenim informacijama, povod agresivnog ponašanja muškarca bio je dolazak radnika Elektre koji su mu željeli isključiti struju. Muškarcu se to nije svidjelo te je za sve navodno optužio susjede. ', 'b.jpg', 'hrvatska', 0),
(35, '13.06.2024.', 'Kekin o Renatu Peteku: Svatko ima svog Davora Bernardića ', 'ZASTUPNICA stranke Možemo osvrnula se na prozivke zagrebačke oporbe na račun gradske vlasti i Tomislava Tomaševića.', '\r\n\r\nIVANA Kekin, saborska zastupnica stranke Možemo, bila je gošća N1, gdje je govorila o današnjem prosvjedu radnika Gradske plinare Zagreb i prozivkama zastupnika u saboru.\r\n\r\nNa pitanje zašto su se radnici Gradske plinare danas odlučili na prosvjed, Kekin odgovara da ne može \"izvana ulaziti u konkretnu motivaciju radnika za tu odluku\", ali, kako ističe, \"razgovori s radnicima se vode i o svemu ih se pravodobno obavještava\".\r\n\"Neće biti otpuštanja\"\r\n\r\n\"Izlazi se na tržište i ide se pravnim putevima osporavati odluka HERA-e, ali i neće biti dovedena u pitanje opskrba Zagrepčana plinom. Neće biti opuštanja, firma normalno posluje, njihova radna mjesta ni na kakav način nisu ugrožena.\r\n\r\nOtkad je došla ova gradska vlast na poziciju, usprkos lošim odlukama i izrazito nepovoljnim ugovorima činilo se sve i sadašnji direktor Holdinga nastoji činiti sve da se to riješi\", kazala je Kekin za N1.\r\n\"Prozivke HDZ-a su fake news\"\r\n\r\nUpitana oko HDZ-ovih prozivki vezanih uz stanje u Zagrebu, Kekin govori da je većina tih prozivki \"neutemeljena i nema veze s činjenicama\".\r\n\r\n\"To što prođe u javnom prostoru je dijelom fake news. Primjer toga je i vijest da se u Holdingu kupuju skupocjeni automobili, a tko god je htio provjeriti se mogao uvjeriti da su kupljeni za klasu povoljniji od onih koji su se nudili. Govore da su Bandić i Tomašević isti, a sadašnji gradonačelnik je prosvjedovao upravo protiv Audija A6 u kojem se pokojni Bandić vozio.\r\n\r\nBandića se prozivalo jer je nakon potresa 2020. išao u nabavu najskupljih automobila, a Tomislava Tomaševića se proziva iako je upola smanjio automobile u gradskoj upravi. Taj primjer zorno dočarava vrstu optužbi kojima se u parlamentu ponekad granatira gradska vlast.\r\n\r\nMi se onda svaki put kad je naručen automobil možemo pitati zašto nije naručen bicikl ili kada je naručen bicikl – zašto nije jeftiniji. Možemo doći i do romobila, a na koncu i do tenisica\", komentirala je Kekin.\r\nO Renatu Peteku: Svatko ima svog Bernardića\r\n\r\nKekin je komentirala prozivke zastupnika oporbe, SDP-ovog Renata Peteka. Podsjetimo, Petek je jučer objavio na Fejsu da je Tomašević nabavio luksuzne Audije za Upravu Holdinga od iste firme kao Bandić. Na Petekove prozivke reagirao je Holding, iz kojeg je rečeno da su traženi automobili srednje klase.\r\n\r\n\"Svatko svog Davora Bernardića ima. To je njegov standardni način pokazivanja vlastite političke ambicije, zasad bez previše uspjeha\", rekla je Kekin o Peteku za N1.\r\n', 'c.jpg', 'hrvatska', 0),
(36, '13.06.2024.', 'Kina: Umirovljenik jeftino kupio stare knjige pa u njima našao vojne tajne', 'KINESKO ministarstvo državne sigurnosti objavilo je kako je zaljubljenik u vojnu povijest došao do povjerljivih vojnih dokumenata.', 'KINESKO ministarstvo državne sigurnosti objavilo je kako je zaljubljenik u vojnu povijest došao do povjerljivih vojnih dokumenata tako što je kupio četiri odbačene knjige za šest kineskih juana (77 centa) u centru za recikliranje u susjedstvu.\r\n\r\nVlasti su pohvalile umirovljenika jer je navodno nazvao dežurnu liniju kako bi prijavio incident. Identificirali su ga samo po obiteljskom prezimenu, Zhang, i nisu precizirali do kakvih je dokumenata on navodno došao. \r\n\r\n\"Zhang je u kupio vojne tajne zemlje i donio ih kući. Da ih je kupio netko sa skrivenim motivima, posljedice bi bile nezamislive\", stoji u priopćenju kojeg su prenijele najmanje dva popularna kineska news portala. \r\nNapetosti između Kine i SAD-a\r\n\r\nAssociated Press piše da je ovaj događaj vjerojatno osmišljen kako bi se podigla svijest o važnosti nacionalne sigurnosti u vrijeme kada rastu napetosti između Kine i Sjedinjenih Država. Obje zemlje su sve više zabrinute zbog moguće krađe ili prijenosa povjerljivih i tajnih informacija.\r\n\r\nZhang se u priči opisuje kao bivši zaposlenik državne tvrtke koji voli skupljati vojne novine i časopise. Navodi se kako su agenti pohitali u centar za recikliranje nakon što im je Zhang prijavio što je tamo pronašao. \r\n\r\nDodaje se kako su dva državna zaposlenika optužena jer su prodala više od 200 knjiga centru za recikliranje, iako su dobili zadatak da ih unište. Agenti su navodno zaplijenili preostale knjige, a vojska je uvela nove kontrole kako se ovakvi događaji ne bi ponavljali u budućnosti. ', 'd.jpg', 'svijet', 0),
(37, '13.06.2024.', 'Načelnik ličke općine odobrio vatrogascima 1 euro regresa. \"To je čista uvreda\" ', 'SINDIKATI kažu da je najveći problem što vlada ni mjesec dana nakon prosvjeda nije donijela uredbu pa se načelnici, gradonačelnici i župani mogu ponašati kako žele.', '\r\n\r\nNAČELNIK Općine Plitvička Jezera je zaposlenicima JVP-a Plitvička Jezera odobrio isplatu od jednog eura za regres, dar za djecu, božićnicu i uskrsnicu, javlja RTL.\r\n\r\nNačelnik Ante Kovač, profesor književnosti, nezavisni načelnik općine i prvi načelnik Plitvičkih Jezera koji nije u HDZ-u, svoju odluku opravdava rastom plaća vatrogasaca u posljednja dva mjeseca.\r\n\r\nVatrogasci smatraju da je riječ o čistoj uvredi. \"Omalovažavanje sigurno…\", kaže za RTL Vlado Marković, zapovjednik JVP-a Plitvička Jezera.\r\nSindikalistica najavljuje prosvjed\r\n\r\n\"Aneks kolektivnog ugovora bio je sklopljen s trećim mjesecom 2023. i za sve te četiri stavke bilo je oko 596 eura, gotovo 600 eura za sve četiri stavke. Sad sve stane u 4 eura\", pojašnjava Marko Mišić, vatrogasac JVP-a Plitvička Jezera.\r\n\r\nSindikati kažu da je najveći problem što vlada ni mjesec dana nakon prosvjeda nije donijela uredbu pa se načelnici, gradonačelnici i župani mogu ponašati kako žele.\r\n\r\n\"Mislim da vatrogasci u ovom trenutku, s obzirom na to kada su jučer vidjeli ovakvu odluku koja ih je dodatno uvrijedila, razjarila - neće stati i da će tražiti svoja prava na drugačiji način\", rekla je Iva Šušković, predsjednica Sindikata državnih i lokalnih službenika i namještenika.\r\n\r\nNa pitanje slijedi li novi prosvjed, Šušković je odgovorila: \"Zasigurno novi prosvjed.\"\r\n', 'e.jpg', 'hrvatska', 0),
(38, '13.06.2024.', 'Drava nabujala. Vodostaj će i dalje rasti. Počele pripreme zbog moguće poplave', 'OČEKUJE se daljni porast vodostaja.', 'NA SASTANKU Stožera civilne zaštite Koprivničko-križevačke županije na kojem se danas razgovaralo o rastu vodostaja Drave zbog većih oborina u Austriji i Sloveniji, proglašeno je pripremno stanje mjera obrane od poplava.\r\n\r\nNačelnik Stožera Ratimir Ljubić kazao je kako su sve sastavnice sustava civilne zaštite u stalnom kontaktu te da se pomno prati kretanje Drave, posebno na područjima općina kroz koje protječe. Svih deset načelnika općina uz riječno područje obaviješteno je o stanju vodostaja te poduzetim mjerama. Vodočuvari redovno obilaze rijeku i prate vodostaj.   \r\nOčekuje se daljni porast vodostaja\r\n\r\nPrema informacijama Hrvatskih voda, koje su nadležne za upravljanje rizicima od poplava i neposrednu provedbu mjera obrane od poplava, vodostaj na mjernoj postaji u Botovu trenutno iznosi +424 centimetara. \r\n\r\nU narednih 48 sati očekuje se daljnji porast vodostaja Drave na području Botova, ali za sad se ne očekuje uvođenje redovnih mjera obrane od poplava koje stupaju na snagu nakon prelaska vodostaja od +460 centimetara.', 'f.jpg', 'hrvatska', 0),
(39, '13.06.2024.', 'Papa ponovio vulgarnu riječ za LGBT osobe', 'PAPA Franjo je ponovno upotrijebio vrlo uvredljivu riječ za homoseksualne osobe za što se već ispričao prošli mjesec.', 'PAPA Franjo je ponovno upotrijebio vrlo uvredljivu riječ za homoseksualne osobe za što se već ispričao prošli mjesec, izvijestila je u utorak novinska agencija ANSA.\r\n\r\nTalijanski mediji pripisali su Papi riječ \"frociaggine\", vulgarnog izraza na talijanskom jeziku koji se ugrubo prevodi kao \"pederluk\", kada se 20. svibnja iza zatvorenih vrata sastao s talijanskim biskupima.\r\n\r\nPrema ANSA-i, Franjo je u utorak ponovio tu riječ na susretu s rimskim biskupima, rekavši da \"se pederluk osjeti u zraku u Vatikanu\" i da bi bilo bolje da se mladićima homoseksualnih sklonosti ne dopusti ulazak u sjemenište.\r\n\r\nZamoljen za komentar te vijesti, vatikanski ured za medije uputio je na priopćenje sa sastanka u kojem se kaže da je Papa ponovio potrebu da se prigrle gay ljudi u Crkvi, no da se zadrži oprez prema njima kad postaju sjemeništarci.\r\n\r\nNakon što je pogrdan izraz za gay osobe upotrijebio prvi put, novine Corriere della Sera citirale su anonimne biskupe koji su bili u prostoriji i sugerirali da Papa, kao Argentinac, možda nije shvatio da je talijanski izraz koji je upotrijebio uvredljiv.\r\n\r\nFranjo (87) je tijekom svoga 11-godišnjeg pontifikata zauzimao otvoreniji pristup LGBT zajednici.\r\n\r\nNa početku svog papinstva 2013. je rekao: \"Ako je osoba gay i traži Boga i ima dobru volju, tko sam ja da sudim?\" i prošle je godine dopustio svećenicima da blagoslivljaju istospolne parove, što je izazvalo otpor konzervativnog svećenstva.\r\n\r\nNeki vatikanski promatrači kažu da mu posljednji potezi podrivaju autoritet i otvaraju pitanja o njegovim stvarnim uvjerenjima i reformama koje je imao na umu za Crkvu.', 'g.jpg', 'svijet', 0),
(40, '13.06.2024.', 'Buenos Aires u plamenu, veliki prosvjedi zbog kontroverzne reforme predsjednika', 'INTERVENTNA policija u glavnom gradu Argentine Buenos Airesu ispalila je suzavac i vodene topove kako bi rastjerala prosvjednike ispred zgrade Kongresa nakon što su zastupnici u argentinskom senatu dali početno odobrenje za reforme predsjednika Javiera Mileija.', 'INTERVENTNA policija u glavnom gradu Argentine Buenos Airesu ispalila je suzavac i vodene topove kako bi rastjerala prosvjednike ispred zgrade Kongresa nakon što su zastupnici u argentinskom senatu dali početno odobrenje za reforme predsjednika Javiera Mileija.\r\n\r\nProsvjednici tvrde da će mjere naštetiti milijunima Argentinaca jer predviđaju smanjenje proračuna i socijalnih davanja. \r\n\r\nLokalni mediji izvještavaju o brojnim ozlijeđenima, a scene su opisali kao \"bojno polje\". Prosvjednici su na suzavac i vodene topove policije uzvratili bacanjem kamenja i zapaljivih sredstava, pri čemu je zapaljeno nekoliko automobila, prenosi BBC.\r\n\r\nPaket reformi, koji je predložio desničarski predsjednik Javier Milei za oživljavanje posrnulog gospodarstva zemlje, uključuje proglašavanje izvanrednog gospodarskog stanja, rezanje mirovina i liberalizaciju tržišta rada, što mnogi ocjenjuju kao najavu narušavanja radničkih prava. Mjerama se protive ljevičarske političke stranke, radnički sindikati i društvene organizacije.', 'h.jpg', 'svijet', 0),
(41, '13.06.2024.', 'Papa poručio svećenicima da drže kraće propovijedi kako ljudi ne bi zaspali', 'PAPA govorio o tome koliko bi svećenici dugo trebali držati propovijedi.', '\r\n\r\nSVEĆENICI bi trebali držati kratke propovijedi i govoriti najviše osam minuta kako vjernici ne bi zaspali, rekao je papa Franjo.\r\n\r\nPropovijed ili poruka koju svećenik izgovara na misi \"mora biti kratka: slika, misao, osjećaj\", rekao je papa tijekom svoje tjedne audijencije.\r\nOsam minuta\r\n\r\nNe bi smjela trajati duže od osam minuta \"jer nakon tog vremena ljudi gube pažnju i zaspu, i u pravu su\", rekao je 87-godišnji papa.\r\n\r\n\"Svećenici ponekad puno govore, a ne razumijete o čemu govore.\"\r\n', 'i.jpg', 'svijet', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `korisnik`
--
ALTER TABLE `korisnik`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `korisnicko_ime` (`korisnicko_ime`);

--
-- Indexes for table `vijesti`
--
ALTER TABLE `vijesti`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `korisnik`
--
ALTER TABLE `korisnik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `vijesti`
--
ALTER TABLE `vijesti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
