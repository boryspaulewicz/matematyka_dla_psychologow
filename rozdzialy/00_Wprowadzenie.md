# Skąd się ta książka wzięła

Ta książka była najpierw krótkim skryptem dla studentów. Planując ćwiczenia do kursu neuronauka i
psychologia poznawcza zapisałem w sylabusie, że na zajęciach dotyczących teorii normatywnych
będziemy omawiać jakiś bliżej nieokreślony mój "skrypt własny". Korzystając z okazji,
przeprowadziłem eksperyment, polegający na próbie przekonania studentów, że przy odrobinie wysiłku
mogą nauczyć się dowodzenia prostych twierdzeń, a dzięki temu trochę lepiej zrozumieć, a już na
pewno lepiej zapamiętać, na przykład twierdzenie Bayesa. Skrypt stał się serią komentarzy
ilustrowanych fragmentami kodu, które były jednocześnie zadaniami wymagającymi dowodzenia twierdzeń
w języku [Lean](https://lean-lang.org/).

Miałem wątpliwości, czy to się uda, więc najpierw sprawdziłem, jak sobie z tym poradzi mój syn,
siedemnastoletni wtedy Tymek. Szło mu to dość wolno, dlatego wprowadziłem kilka zmian i poprawioną
wersję dałem doktorantom, którzy chodzili wtedy na moje zajęcia dotyczące wnioskowania bayesowskiego
i przyczynowego. Dzięki temu (jeszcze raz dziękuję!) spora część studentów wykonała poprawnie
zadanie, a kilkoro wyraziło nawet zainteresowanie dalszym ciągiem.

Ponieważ sam zacząłem się niedawno uczyć Leana, postanowiłem robić to nadal, poprawiając i
rozwijając to, co już napisałem. Pisząc wcześniej na zamówienie [wprowadzenie do wnioskowania
przyczynowego dla psychologów](https://czasopisma.uwm.edu.pl/index.php/pp/article/view/9731/7171)
(wersja w języku angielskim jest bardziej dopracowana) przekonałem się, po raz kolejny, że to
znakomity sposób, żeby nauczyć się czegoś lepiej. Ten artykuł zamówił u mnie [Arek
Białek](https://arekbialek.github.io/), za co mu serdecznie dziękuję, ponieważ zmusiło mnie to do
dłuższych rozmyślań na temat rachunku przyczynowego. Nie jest to chyba mój najgorszy tekst, skoro
[spodobał się](https://x.com/yudapearl/status/1737769250511843448) samemu
[Pearlowi](https://en.wikipedia.org/wiki/Judea_Pearl), który raczej nie prawi chętnie komplementów
na temat tego typu artykułów, dlatego zamierzam bezwstydnie skorzystać z niego (z artykułu, nie z
Pearla) w dalszej części książki.

Po wstawieniu skryptu w nieco bardziej estetycznej formie na GitHuba tak się w to wciągnąłem, że po
chwili z jednego skryptu zrobiły się dwa, potem trzy, a niedługo potem siedem i to wszystko zaczęło
wyglądać jak taka jakby trochę może książka. W dodatku książka, którą - po dopracowaniu jej przez
autora (czyli w tym wypadku mnie) - sam chciałbym przeczytać, zanim jeszcze zacząłem się o tych
sprawach uczyć. Przy okazji odkryłem także inny cel.

Większość psychologów, mam na myśli również utytuowanych pracowników naukowych z bogatym dorobkiem,
polega w ogromnym stopniu na matematyce, na przykład używając wnioskowania statystycznego, ale nie
tylko wtedy, i próbuje zrozumieć złożone i trudne do wyjaśnienia zjawiska, takie jak zachowania
ludzi czy strukturę i przebieg procesów umysłowych. Jednak wielu z nich nie ma najczęściej pojęcia o
matematyce. Dobrymi przykładami poważnych błędów, wynikających z niezrozumienia matematycznej
nieuchronności kilku *prostych* przecież zasad są powszechne [wnioskowanie o braku efektu na
podstawie samego tylko nieistotnego wyniku testu
statystycznego](https://en.wikipedia.org/wiki/Type_I_and_type_II_errors), albo wnioskowanie o
wpływie czy innych własnościach przyczynowych bez wprowadzenia i uzasadnienia koniecznych założeń
(wielu psychologów wciąż nie zdaje sobie sprawy, jak poważne konsekwencje wynikają z faktu, że
[przyczynowość została zmatematyzowana](https://en.wikipedia.org/wiki/Causal_inference)).

Nic więc dziwnego, że tacy, niestety w psychologii dość liczni, matematyczni półanalfabeci nierzadko
wyciągają z własnych i cudzych badań nieuzasadnione wnioski, popełniając przy tym często najprostsze
nawet błędy. Mimo to udaje im się publikować w wysokopunktowanych czasopismach, bo ich manuskrypty
są zwykle recenzowane i dopuszczane do druku przez innych matematycznych półanalfabetów. Rezultatem
tej zabawy w chowanego jest powszechna w psychologii już od dawna rozczarowująca [gra
pozorów](https://pl.wikipedia.org/wiki/Kulty_cargo).

Matematyczny półanalfabetyzm zdecydowanej większości psychologów jest łatwym do zaobserwowania
faktem. Równie łatwo jest wskazać jedną z głównych przyczyn, o ile nie przyczynę najważniejszą, tego
smutnego stanu rzeczy: Praktycznie *nikt*, włączając w to osoby prowadzące zajęcia ze statystyki,
nie wymaga od psychologów znajomości nawet tylko tej odrobiny matematyki, którą trzeba poznać, żeby
trochę głębiej zrozumieć o co tak naprawdę chodzi między innymi w testowaniu istotności albo w
poprawnym uzasadnianiu wniosków przyczynowych. A przecież te dwa rodzaje rozumowań odgrywają
*centralną* rolę w *niemal każdym* artykule empirycznym. Co ambitniejsi studenci uzupełniają
samodzielnie braki w wiedzy, ale akurat matematyki mało kto uczy się systematycznie z własnej woli.

Mam wrażenie, że studenci i młodsi pracownicy naukowi często mniej boją się programowania niż
matematyki, a poza tym z programowaniem można się oswajać w interakcji z dostarczającym informacji
zwrotnych komputerem. Wtedy obecność nauczyciela nie jest aż tak potrzebna. Ta książka ma między
innymi pomóc w oswajaniu się z matematyką, czyli głównie z **konsekwentnym, abstrakcyjnym myśleniem
i rozwiązywaniem problemów teoretycznych opartym na kontrolowanym przełączaniu się między różnymi
punktami widzenia, i na wyrażaniu nowych punktów widzenia w postaci języków formalnych** przede
wszystkim właśnie zainteresowanym samodzielnym poszerzaniem wiedzy studentom psychologii i
pracownikom akademickim zajmującym się badaniami psychologicznymi, którzy są gotowi w tym celu
podjąć próbę poznania nowego, pięknego i wyjątkowo ekspresyjnego języka programowania.

Uprzedzam jednak, że ta książka *może zawierać błędy we fragmentach napisanych w języku naturalnym*,
czyli tam, gdzie mniej lub bardziej po swojemu objaśniam kod albo zapędzam się w dygresje. To ryzyko
nie wydaje mi się pomijalnie małe, bo jestem matematycznym amatorem. Co prawda coś tam mogę pokazać
jako "dowód", że trochę o matematyce wiem, ale nie ma tego wiele. Gdybyś więc znalazła błąd, będę
wdzięczny, jeśli mi o tym napiszesz (boryslaw.paulewicz@uj.edu.pl).

Mogę Cię za to zapewnić, że ta książka *prawie na pewno nie zawiera błędów w częściach formalnych*,
to jest zakodowanych w pewnej wersji języka teorii typów, z której korzysta asystent dowodzenia
Lean. To jest o ile te części sprawdziłem przed posłaniem zmian do repozytorium. Zwykle tak robię,
ale zdarza mi się o tym zapominać kiedy dużo piszę albo dużo zmieniam. Jeżeli akurat sprawdziłem kod
po wprowadzeniu zmian, to znaczy, że wszystkie formalne części zostały sprawdzone przez algorytm,
którego używa do tego Lean, a wtedy mało czego można być tak pewnym jak tego, że są
[bezbłędne](https://royalsocietypublishing.org/doi/10.1098/rsta.2005.1650). A gdybyś miała
wątpliwości, zawsze możesz wkleić kod do Leana i przekonać się w ten sposób, czy jest poprawny.

Muszę Cię też ostrzec, że jeżeli dotrzesz do końca rozdziału szóstego i uda Ci się zrobić poprawnie
zadania, których do tego momentu będzie zresztą niewiele, możliwe, że poczujesz coś w rodzaju
zagubienia. Będziemy się zajmować bardzo abstrakcyjnymi sprawami, dlatego takie poczucie jest na
początku niemal nieuchronne. Ja też się tak czułem, kiedy zaczynałem się uczyć teorii typów i teorii
kategorii. To poczucie może się stopniowo zmieniać w coraz głębsze zrozumienie, ale to wymaga **ci
erpliwości i unikania frustracji** (albo upierania się przy tym, żeby nauka była *przyjemna*).

W związku z tym oto moja sugestia: Daj sobie czas, żeby wszystko zdążyło się trochę "uleżeć" i
pogódź się z tym, że dobre opanowanie tego rodzaju materiału może wymagać wracania do przeczytanych
już fragmentów. O ile nie zabraknie wytrwałości, może w końcu stanie się to, co dzieje się, kiedy
przez dłuższy czas dokądś idziemy, niekoniecznie dążąc stale do jednego celu, a powietrze jest
bardzo wilgotne. Nie ma wtedy wyraźnego momentu, gdy zachodzi jakościowa zmiana, odkrywamy jednak w
końcu, że choć nie padał deszcz, jesteśmy przemoczeni[^1].

Gdy pojawi się frustracja, a *na pewno* czasem się pojawi, poczekaj, albo wróć do tego, co wydaje Ci
się, że już dobrze zrozumiałaś. To nie jest psychologia, w której zwykle to, o czym się czyta,
wydaje się na początku w miarę zrozumiałe i intuicyjne, ale im dłużej się nad tym zastanawiamy, tym
więcej mamy wątpliwości; w matematyce jest często *odwrotnie*; rezultatem pierwszego kontaktu z
definicją, twierdzeniem, albo teorią może być dezorientacja, która z czasem ustępuje wrażeniu, że
wszystko jest w zasadzie oczywiste, proste i nieuchronne. A właśnie, niedawno postanowiłem, że
ponieważ większość studentów psychologii to wcale nie studenci, tylko studentki, będę zwracał się do
Ciebie w formie żeńskiej. Jest też inny dobry moim zdaniem powód.

Poznałem wiele kobiet zajmujących się psychologią, które w mojej ocenie mają więcej oleju w głowie,
niż wielu znanych mi mężczyzn, którzy też się nią zajmują. Wśród pracowników akademickich nie
spotkałem jednak prawie wcale kobiet, które dorównywałyby większości mężczyzn pewnością siebie i
łatwością wypowiadania stanowczych opinii. Wiem, co mówię, bo sam jestem znany z aroganckich
wypowiedzi. A poza tym, gdy zacząłem pisać do wyobrażonego czytelnika w formie żeńskiej, przyszło mi
do głowy, że ewentualny brak tupetu przestaje mieć znaczenie, kiedy swoje tezy można *formalnie
udowodnić* i bardzo spodobała mi się wizja kobiet prezentujących *wnioski z badań* z pełną
świadomością, że ponieważ te są już udowodnione, zakładając wiarygodność źródła danych, *nie da się*
ich skutecznie podważyć.

Wracając już do przerwanego wątku, poczucie zrozumienia często jest zwodnicze. Wiele razy uczyłem
się trudnego materiału, wykonując, czasem przez wiele miesięcy albo nawet kilka lat, coraz
odleglejsze w czasie, generatywne powtórki. I wiele razy w trakcie powtarzania zauważałem, że moje
wcześniejsze poczucie zrozumienia było złudne. Może to truizm, ale taki, o którym łatwo jest
zapomnieć: Ponieważ nawet na najprostsze sprawy można popatrzeć z nowego punktu widzenia (co
będziemy zresztą od pewnego momentu robić niemal nieustannie), rozumienie to jest coś, do czego
można stale *dążyć*, ale czego *nie da się* tak całkiem *osiągnąć*. Dlatego też nigdy nic nie
przestanie być ciekawe[^4].

Rozdziały od czwartego do szóstego nie są długie. Przeczytanie ich i wykonanie poleceń powinno Ci
zająć nie więcej niż półtorej albo dwie godziny. Poza tym ta książka jest całkowicie
samowystarczalna w tym znaczeniu, że nie zakłada specjalistycznej wiedzy; *wszystko* jest wyjaśnione
od podstaw, a jedyny program, którego będziesz potrzebować, jest dostępny za darmo i można go używać
również w przeglądarce.

Jeżeli utkniesz, nie zrażaj się proszę. A jeżeli utkniesz, będziesz próbować nadal i znów Ci się nie
uda, po prostu się tym nie przejmuj i **czytaj dalej**, zakładając oczywiście, że będziesz
zainteresowana tym, co będzie dalej. Zrozumienie, że ucząc się matematyki *nie trzeba rozwiązywać
większości zadań* i że upieranie się przy tym może przeszkadzać w nauce zajęło mi naprawdę dużo
czasu, o wiele za dużo. Żałuję, że nikt mi tego nie tłukł już dawno do głowy (albo jeszcze lepiej,
cierpliwie tłumaczył).

Tylko z tego powodu wiele razy zdarzało mi się niepotrzebnie porzucać naukę, bo myślałem, że skoro
nie przyswoiłem sobie dobrze czegoś na danym etapie tak dobrze, żeby rozwiązać większość zadań, to
*nie powinienem* czytać dalej. A przecież rozumienie w zasadzie nigdy nie rozwija się w taki
"liniowy" sposób. Wydaje mi się, że świetnie zdają sobie z tego sprawę informatycy, bo są
przyzwyczajeni do traktowania bibliotek programistycznych i dokumentacji jak *skrzynek z
narzędziami*, które mają przede wszystkim *działać* i którym nie muszą się przyglądać z bliska czy
analizować jak są zbudowane, jeśli akurat nie mają na to ochoty.

Żeby Cię przekonać do uczenia się ze mną na luzie, opowiem Ci, jak zmiana nastawienia do matematyki
zmieniła moje życie. W trakcie wakacji 2023 roku, rojąc sobie, że może jakimś cudem będę miał szansę
to niebawem wykorzystać, zacząłem uczyć się z cudownej książki Geuversa i Nederpelta [Type Theory
and Formal
Proof](https://www.cambridge.org/core/books/type-theory-and-formal-proof/0472640AAD34E045C7F140B46A57A67C). Ta
książka jest napisana w bardzo jasny sposób i na każdej niemal stronie widać, że autorzy starają się
wszystko wytłumaczyć najlepiej jak potrafią. W mojej ocenie to jest też wybitna *literatura* w tym
znaczeniu, że styl jest jednocześnie elegancki i lekki, a ton wydaje mi się czasami wręcz ciepły.

Niektórzy wybitni matematycy potrafią tak pisać. A że temat bywa abstrakcyjny, złożony i pełen
głębokich niespodzianek, rezultatem może być porażające połączenie treści z formą. Taki efekt jest
osiągalny chyba tylko wtedy, gdy autorzy, pisząc o złożonych zagadnieniach, mają rzeczywiście coś do
powiedzenia i nie tylko dobrze rozumieją to, co chcą powiedzieć, ale także to, jakie trudności mogą
się pojawić u odbiorcy. No więc to jest, moim zdaniem, właśnie taka książka. W dodatku poza dobrą
znajomością angielskiego autorzy nie zakładają żadnej wcześniejszej wiedzy. Mimo to uczenie się z
niej o teorii typów nie było dla mnie ani trochę łatwe.

Przez dłuższy czas zaczynałem prawie każdy dzień od 30 minutowej jednostki (tak to sobie nazywam),
polegającej albo na czytaniu *po raz kolejny* tego samego *krótkiego* fragmentu, albo na robieniu
notatek czy zaplanowanych powtórek. Później tego samego dnia zdarzało się, że jeszcze do tego
wracałem, ale nie zawsze. Na początku rozwiązywałem też wszystkie zadania. I to był *bardzo wolny
proces*.

xKtóregoś dnia, z czystej ciekawości, zacząłem swobodnie czytać dalej, a potem wróciłem do
fragmentu, na którym wcześniej skończyłem. W ten sposób miałem pewną przerwę między momentem, w
którym pierwszy raz przeczytałem ten późniejszy fragment, ale nie robiłem żadnych pojawiających się
tam zadań ani notatek, a momentem, kiedy znowu zacząłem go czytać. Zauważyłem wtedy, że rozumiem ten
fragment znacznie lepiej. Postanowiłem więc, po raz pierwszy w życiu i tylko na próbę, *w ogóle nie
robić zadań, gdy nie mam na to ochoty*. A przy okazji, niektóre z zadań w książce, którą właśnie
czytasz, są integralną częścią tekstu, ale oczywiście można je pominąć, o ile późniejsze treści będą
nadal do pewnego stopnia zrozumiałe.

Dalej robiłem więc notatki i zaplanowane, generatywne powtórki, ale nie robiłem zadań, które mnie
nie zainteresowały i które nie wydawały mi sie ważne. Z czasem zacząłem też zauważać błędy. Czytając
zawsze szukam błędów, po prostu tak mam i moje doświadczenia wskazują, że w dłuższych tekstach
napisanych w języku naturalnym jakieś [błędy](https://www.youtube.com/watch?v=6LqnBrBSFyU) zawsze
są. W moich dłuższych tekstach są z pewnością. Ponieważ czułem, że mam rację, napisałem do [Roba
Nederpelta](https://wsinrpn.win.tue.nl/), który potraktował mnie niezwykle życzliwie i
poważnie. Jednym z efektów tej przygody jest to, że moje nazwisko pojawiło się w oficjalnej erracie
do tej książki, jako nazwisko jednej z osób, której autorzy dziękują. A mi akurat dziękują za
wskazanie (w tym momencie, to jest 2024-12-11) około połowy wszystkich wymienionych błędów, i nie
chodzi tu o literówki czy inne tego rodzaju drobiazgi, a o błędy rzeczowe. Z niewielu rzeczy jestem
tak dumny jak z tego, dlatego często się tym chwalę. Nie wpadłbym na pomysł napisania czegoś choćby
tylko odlegle zbliżonego do tego tekstu, który masz właśnie przed oczami, gdyby nie ta wspaniała
książka i kontakt z tym niezwykłym człowiekiem. No więc z ambicjami lepiej nie przesadzać; moim
zdaniem, jak już wspominałem, najważniejszy jest *czas*.

Skoro mówimy o pożytkach płynących ze znajdywania błędów, może przyda Ci się patent, który odkryłem
podczas pisania [doktoratu]((./praca_doktorska.pdf)). Ponieważ jedną z większych przyjemności
związanych z tym procesem była dla mnie zabawa różnymi mniej lub bardziej skomplikowanymi
narzędziami teoretycznymi, musiałem jakoś rozwiązać problem polegający na tym, że nie było w okolicy
żadnych specjalistów, których mógłbym poprosić o pomoc. Gdy czułem, że muszę się w czymś szybko
podszkolić, szukałem więc najlepszych żyjących autorów zajmujących się tematem, potem zdobywałem,
nie powiem w jaki sposób (ani nie powiem, czy na przykład z istniejącego już wtedy serwisu
[AvaxHome](https://avaxhome-mirrors.pw/), dla którego istnieją teraz znacznie lepsze
[alternatywy](http://open-slum.org/)) ich najlepsze książki, przebijałem się przez pierwsze
kilkadziesiąt stron szukając błędów, po czym pisałem maile. Zwykle w tych mailach wyrażałem w nich
szczery podziw i głęboką wdzięczność, również szczerą, a niejako przy okazji wspominałem tak
ostrożnie, jak tylko umiałem (czyli pewnie niezbyt) o znalezionych błędach. A te zawsze można było
znaleźć. Listę autorów, którym to zrobiłem, znajdziesz na dziewiątej stronie mojego doktoratu.

Zwykle im *bardziej* wybitni i uznani byli Ci autorzy, tym szybciej, bardziej życzliwie i
wyczerpująco mi odpowiadali. Chyba najlepszym przykładem, jak to może działać, jest jedna z
odpowiedzi, jaką otrzymałem wtedy od [Saula
Sternberga](https://en.wikipedia.org/wiki/Saul_Sternberg). Napisałem mu wyraźnie, że to kwestia
drugorzędna, ale gdyby to było możliwe, chciałbym zrobić po swojemu analizę wyników klasycznego już
eksperymentu, który przeprowadził w latach 60tych. Jak się potem dowiedziałem, pomiar czasu reakcji
polegał wtedy na *nanoszeniu dziur na rolce papieru*, zawiniętej bodaj wokół obracającego się w
miarowym tempie bębna. Pisząc w odpowiedzi, o ile pamiętam zresztą szybkiej, Saul zaproponował, że
*zleci digitalizację swojej sekretarce*. Zawstydzony odpisałem zaraz, że nie trzeba.

Coś innego, co też na zawsze zmieniło moje życie, a co jest związane z tym, o czym przed chwilą
mówiłem, przytrafiło mi się w szkole podstawowej na lekcji fizyki. Moja nauczycielka z tego
przedmiotu, Pani Płucienniczak, którą bardzo dobrze wspominam (jednak moją ulubioną nauczycielką na
zawsze pozostanie Pani Wójcik, która uczyła mnie matematyki), tłumaczyła coś właśnie na tablicy i
kiedy zrozumiałem (ale czy na pewno?), o czym mówiła, zrozumiałem też jednocześnie coś ważniejszego
od fizyki: *Wszystko, co da się zrozumieć, ja też mogę zrozumieć, o ile tylko będę miał dość
informacji i czasu*. Uważam, że jeżeli sięgnęłaś po tą ksiażkę, to Ty też możesz zrozumieć
*wszystko*, co da się zrozumieć. Jak to ujął Silvanus Thompson w swoim popularnym i dostępnym za
darmo [podręczniku do rachunku różniczkowo-całkowego](https://calculusmadeeasy.org/), *What one fool
can do, another can*. Thompson podaje, że to jest *Ancient Simian Proverb*, ale to żart (sprawdź, co
znaczy "Simian", jeśli chcesz się dowiedzieć więcej).

Zawsze byłem chudy[^3], dobry z matematyki i dobry z programowania, bo taki się
[urodziłem](https://en.wikipedia.org/wiki/Three_Identical_Strangers). Z pewnością nie byłem jednak
nigdy ani tym bardziej nie jestem żadnym geniuszem. Po prostu w szkole podstawowej nie potrafiłem
nie myśleć często o matematyce. Mój wspaniały przyjaciel z licealnej szkolnej ławki, wybitny
teoretyk prawa i filozof Wojtek Załuski, jest zdaje mi się prawdziwym geniuszem. Inny mój również
wspaniały przyjaciel, filozof matematyczny (jeśli wolno mi tak nazwać to, czym się zajmuje) Szymon
Szymczak też jak sądzę jest. To oczywiście głuptasy, jak my wszyscy, ale to są akurat głuptasy w
pewnych - zbyt licznych! - obszarach genialne. Dzięki nim wiem doskonale, jaki ze mnie dureń.

Myślisz, że z tym durniem przesadziłem? W *pierwszej klasie szkoły podstawowej* nie zapisałem prawie
nic w zeszycie i mój szkolny poziom wykonania był tak niski, że, jak się później dowiedziałem,
nauczyciele poważnie zastanawiali się, czy nie powinienem zostać w niej na drugi rok. Czytać ksiażki
zacząłem późno i z trudem, a z powodu licznych nieobecności (których co prawda sporą część spędziłem
w bibliotece) i bardzo słabych ocen z kilku przedmiotów, o mało co nie powtarzałem też klasy w
liceum; uratowała mnie wtedy olimpiada z filozofii. Na studia z psychologii jest tylu chętnych, że
niektórzy z Was z pewnością przerastają mnie wrodzoną mocą procesora, a poza tym nie jestem już
młody.

No to skąd się tu w ogóle wziąłem? Uczyłem się długo i systematycznie różnych trudnych rzeczy, a
robiłem to, ponieważ znalazłem na siebie sposób. Pracuję na uczelni między innymi dzięki temu, że
najpierw z popularnej książki Tony'ego Buzana [*Rusz
głową*](https://lubimyczytac.pl/ksiazka/3822524/rusz-glowa), a potem jeszcze na pierwszym albo
drugim roku psychologii z podręcznika Johna Andersona, z którego nadal czasem korzystam na
zajęciach, dowiedziałem się, jak się skuteczniej uczyć, a ze znakomitej [książki
Rachlina](https://www.hup.harvard.edu/books/9780674013575) (ale uprzedzam, polskie tłumaczenie "nie
jest optymalne") dowiedziałem się z kolei, w jaki sposób sobie radzić z ekstremalną wręcz
prokrastynacją. Dlatego, żeby zachęcić Cię do dalszej lektury i odwdzięczyć się w jakiś sposób tym
autorom, w następnym rozdziale opowiem Ci krótko, w jaki sposób się uczyłem i czasami wciąż to
robię, a także jak udało mi się robić to zarazem regularnie i przez dłuższy czas.

Skoro już mówię o takich sprawach, to muszę podkreślić, że nie zostałbym pracownikiem uczelni, gdyby
nie wsparcie, życzliwość i wyrozumiałość - moich przyjaciół, niezrównanego Michała Wierzchonia, od
którego dopiero niedawno (bo jestem aż taki głupi) zacząłem się uczyć, że praca dopiero wtedy może
być prawdziwie satysfakcjonująca, kiedy polega na *współ*pracy, i uczciwej, skromnej, mądrej (i
dowcipnej!)[^2] Marty Siedleckiej, która od dawna dostarcza mi sensownych zajęć - a także Kasi
Popiołek, która była dla mnie wymarzoną wprost szefową przez te 10 lat, kiedy pracowałem na SWPSie w
Katowicach. A doktoratu, napisanego najpierw pod kierunkiem bardzo dla mnie ważnego dr
hab. Krzysztofa Krzyżewskiego, a później prof. Edwarda Nęcki, któremu, podobnie jak temu Pierwszemu,
zawdzięczam swobodę zajmowania się w owym czasie czym tylko miałem ochotę się zajmować, być może
wcale bym nie skończył, gdyby nie liczne rozmowy z dodającym mi stale odwagi Tomkiem Grzegorkiem,
moim najważniejszym chyba przyjacielem, któremu akurat zawdzięczam znacznie więcej niż to, gdzie
dzisiaj pracuję.

Z kolei Adasiowi Chuderskiemu, który jest teraz szefem krakowskiej kognitywistyki, zawdzięczam
przygodę z [Lispem](https://www.youtube.com/watch?v=-J_xL4IGhJA&list=PLE18841CABEA24090), która
zmieniła na zawsze mój sposób myślenia o programowaniu. Podszedł kiedyś do mnie, gdy będąc jeszcze
na studiach magisterskich pisałem w C++ jakąś procedurę do eksperymetu. Zapytał, w jakim języku ją
piszę, na co odpowiedziałem, że w C++. On wtedy powiedział, żartując, że gdyby jego koledzy
dowiedzieli się, że pisze w C++, to by go wyśmiali. No to zapytałem, niezrażony, w czym On pisze, na
co odpowiedział, że w Lispie. Wtedy nie miałem zielonego pojęcia, co to Lisp, a niedługo później to
był już mój ulubiony język i na długo nim pozostał. Właśnie dlatego piszę tą książkę w
[Emacsie](https://www.gnu.org/fun/jokes/gospel.en.html), z którym jestem od dawna tak mocno
zrośnięty, że czasami nawet zapominam, że go w ogóle używam. Wygląda więc na to, że trzeba czasu,
być może jakiegoś sposobu na siebie i jednego czy dwóch dobrych przyjaciół; wtedy można zrozumieć,
co tylko się chce. What one fool can do, another can.

### Przypisy

[^1]: To jest luźna parafraza cytatu, ale nie pamiętam czyjego. Chyba jakiegoś buddysty.

[^2]: Brane były pod uwagę również takie, zasugerowane mi przez nie powiem kogo epitety jak
    bezkompromisowa i przezabawna, niezłomna i wiekopomna, czy mądra i krnąbra. Epitety te zostały
    przez moją osobę autorską uznane za trafne i jako takie trafiły do tego przypisu.

[^3]: ang. [*lean*](https://en.wikipedia.org/wiki/Lean_(proof_assistant)).

[^4]: Na przykład, negacja nigdy nie będzie nieciekawa.
