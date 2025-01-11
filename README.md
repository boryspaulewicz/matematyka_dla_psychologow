<div align="right"><em>Wszystko, co można zrozumieć, da się powiedzieć jasno.<br/>Wszystko, co da
się powiedzieć jasno, można zapisać w języku <a
href="https://en.wikipedia.org/wiki/Type_theory">teorii typów</a>.<br/> A wszystko, co zostało
zapisane w języku teorii typów, można sprawdzić za pomocą algorytmu i zredukować do unikalnej
najprostszej możliwej postaci.</em></div>

<br/>
<br/>
<br/>

First things first, podziękowania są [tutaj](#podziekowania). I pamiętajcie, co powiedziała [Julia
Rohrer](https://juliarohrer.com/) - [feedback is love, love is
feedback](https://www.the100.ci/2024/12/01/writing-about-technical-topics-in-an-accessible-manner/#feedback-is-life),
a mówiąc bardziej rozwlekle:

Moje pióro nie jest lekkie, ale to jeszcze pół biedy (case in point). Gorzej, że często słabo zdaję
sobie sprawę z tego, co odbiorczyni lub odbiorca wie i co dzięki temu może na danym etapie z
łatwością zrozumieć. Dlatego mam nadzieję, że widząc w historii zmian wszystkie moje błędy i
niezgrabne sformułowania i widząc też, że staram się tego rodzaju wady usuwać, sprowokuję Cię do
tego, żebyśmy tą książkę napisali *razem*. Bo to nie jest "moja" książka - zresztą żadna książka nie
jest tak naprawdę "czyjaś" - ani ona nie jest dla mnie, a w każdym razie nie przede wszystkim dla
mnie. Zwłaszcza taka książka, która ma *służyć nauce*, nie powinna moim zdaniem, choćby tylko
pozornie, "należeć" do żadnej konkretnej osoby, ani nawet do kilku wybitnych autorów, bo wtedy *nie
może* dobrze spełniać swojej roli. Żaden autor nie ma przecież uprzywilejowanego dostępu do
trudności, jakie będą napotykać czytelnicy. Dlatego efekt końcowy musi być - i zawsze do pewnego
stopnia jest - wynikiem *współpracy*. Jeżeli więc tylko interesuje Cię to, co mam tu do powiedzenia
i chcesz to zrozumieć, to masz szansę, tak długo jak tylko będę w stanie to robić, pomóc sobie i
innym do Ciebie podobnym odbiorcom *rozmawiając ze mną*; w ten sposób możesz stać się w jakimś
stopniu współautorką albo współautorem. W stwierdzeniu, że "dzieła" tworzą ludzie, liczba mnoga
jest przecież konieczna.  
(Tylko proszę, nie pisz wtedy o błędach ortograficznych czy innych tego rodzaju drobiazgach, chyba,
że pojawiły się na głównej stronie. Mam co prawda lekką dysgrafię, ale w tym momencie to już nie ma
większego znaczenia.)

**Aktualności**: 11 stycznia. Dodałem właśnie nowy rozdział 21-15 pod tytułem [Wprowadzenie już na
dobre do języka teorii
kategorii](./rozdzialy/Wprowadzenie_do_jezyka_teorii_kategorii.md). Czytelniczki i czytelników,
*którzy mają już za sobą co najmniej rozdziały od R4 do R8=R02, a także R19=R13* (który "się"
niedawno znowu trochę zmienił) *i R20=R14*, zapraszam do testowania (!), zgłaszania trudności i w
ogóle jakichkolwiek spostrzeżeń lub uwag, *zwłaszcza* tych *krytycznych*. Przy okazji pragnę
nadmienić odnośnie ewentualnego marketingu szeptanego, że można tą książkę śmiało odradzać innym, co
jest o tyle ławe, że nie widać jej w wyszukiwarce.

**O formie żeńskiej**: Jak można się dowiedzieć z rozdziału pierwszego, na początku pisałem używając
form mieszanych w rodzaju mógłbyś/mogłabyś, ale to się szybko stało uciążliwe i nie sprzyjało
czytelności, dlatego pomyślałem sobie, że skoro zdecydowana większość studentów psychologii to
studentki, a nie studenci, będę się zwracał do czytelniczki. Miałem jednak w związku z tym długo
wątpliwości, bo pojawia się z tego powodu problem odpowiedniego *tonu*. Dlatego na wypadek, gdyby
zdarzało mi się sprawiać niewłaściwe wrażenie, wyjaśniam: Sam chciałbym, żeby ktoś pisał do mnie w
ten sposób (i o takich sprawach), kiedy jeszcze byłem studentem, tylko wtedy oczywiście
odpowiadałaby mi pewnie bardziej forma męska, chociaż forma żeńska też by mi wcale nie przeszkadzała
(i zdaje się zresztą, o dziwo, że nie przeszkadza czytelnikom). A poza tym piszę również w pewnym
sensie do obecnej i (przede wszystkim) przyszłej psychologii, która jest przecież (abstrakcyjną, ale
jednak) Kobietą.

Znalazłem niedawno tweeta, który idealnie oddaje moje obecne podejście do pisania:

<blockquote class="twitter-tweet"><p lang="en" dir="ltr">my father always told me: “if you want to
go for a run, go for a run, don’t look for company. sooner or later, on your fifth run or your
twentieth, like-minded people will find you themselves.” and only recently have i realized that this
principle works everywhere.</p>&mdash; blue (@bluewmist) <a
href="https://twitter.com/bluewmist/status/1873281405100408867?ref_src=twsrc%5Etfw">29 grudnia
2024</a></blockquote>

Widząc tempo zachodzących zmian, możesz zobaczyć, że - przynajmniej na razie - dokądś *biegnę*. I
ten cytat, jak podają niektórzy pochodzący od Feynmana, również dobrze tu pasuje:

> If you want to master something, teach it.

Jeżeli więc chcesz dostawać wiadomości na temat aktualizacji i być może dodać coś od siebie, wyślij
mi wiadomość, dopiszę Cię wtedy do listy adresatów.

**Poza znajomością języka polskiego i umiejętnością korzystania z przeglądarki ta książka nie wymaga
specjalnego przygotowania**, a dokładniej, rozdziały *pierwszy*, *drugi* i *od czwartego w górę*
powinny być zrozumiałe dla *licealistów*. Informacje zwrotne, które otrzymałem do tej pory,
wskazują, że jak dotąd faktycznie tak jest, a jeśli przestanie tak być, to spróbuję sprawić, żeby
znowu było. Piszę tą książkę przede wszystkim dla studentów psychologii, ale wydaje mi się, że
mogliby z niej skorzystać również badacze i teoretycy (chociaż teoretycy to w psychologii prawie
nieistniejący gatunek) zajmujący się psychologią naukową. To między innymi wprowadzenie, niemal
[równolegle](https://en.wikipedia.org/wiki/Everything_Everywhere_All_at_Once), do programowania i
teorii typów, a tą drogą - zarazem na skróty i od podstaw - do matematyki i meta-matematyki, później
zaś do wnioskowania przyczynowego i wnioskowania statystycznego w wersjach bayesowskiej i
częstościowej. Korzystając z tych narzędzi omówię kilka podstawowych zagadnień z obszaru szeroko
rozumianej metodologii badań. Z kolei w planowanej drugiej części mam nadzieję uzasadnić, objaśnić i
zilustrować przykładami zastosowań pewną propozycją nowego spojrzenia na psychologię w szczególności
i nauki empiryczne w ogólności (więcej na ten temat znajdziesz [tutaj](./rozdzialy/02_Cel.md)). Ta
propozycja będzie kontynuacją i rozwinięciem wątków z [doktoratu](./rozdzialy/praca_doktorska.pdf),
którymi zacząłem się zajmować jeszcze na etapie pisania pracy magisterskiej, a niektórymi nawet
wcześniej.

**Dlaczego teoria typów i dlaczego akurat
[Lean](https://en.wikipedia.org/wiki/Lean_(proof_assistant)), a nie na przykład znacznie dłużej
rozwijany [Coq](https://en.wikipedia.org/wiki/Coq_(software))?** Teoria typów dlatego, że pozwala
sformalizować w pełni i we względnie naturalny sposób, bo do pewnego stopnia *czytelny dla
niespecjalistów*, niemal dowolne treści o charakterze matematycznym i jest jednocześnie
pełnowartościowym ([funkcyjnym i czystym](https://pl.wikipedia.org/wiki/Programowanie_funkcyjne))
językiem programowania. W dodatku to nie jest jakiś tam kolejny taki język, tylko taki, którego
składnia kształtowała się stopniowo jako rezultat badań wybitnych matematyków i filozofów
zajmujących się podstawami matematyki. Ale teoria typów także dlatego, że być może najciekawszym i
najważniejszym zastosowaniem matematyki w psychologii *nie* jest moim zdaniem wcale testowanie
hipotez statystycznych ani wnioskowanie przyczynowe. Według mnie *nie* jest nim również formalizacja
wyrażonych w języku naturalnym teorii lub modeli psychologicznych w postaci matematycznych modeli
rozmaitych zjawisk. Być może najważniejszym zastosowaniem matematyki we współczesnej psychologii
jest w mojej ocenie *formalizacja rozumowań*, które psychologowie wyrażają często dosyć nieczytelnie
i niejasno w swoich publikacjach. A teoria typów wyposażona w [typy
zależne](https://en.wikipedia.org/wiki/Dependent_type) jest wydaje mi się czymś najbliższym, co
obecnie mamy, do realizacji wizji[^2] [Russella](https://pl.wikipedia.org/wiki/Bertrand_Russell),
którą ten przedstawił w wykładzie zatytułowanym *Logika jako istota filozofii* w 1914 roku w
Londynie, a który w wersji przetłumaczonej na język polski można znaleźć
[tutaj](https://ejournals.eu/pliki_artykulu_czasopisma/pelny_tekst/6bef0ebd-7ba5-407b-a167-d8bd49697ee6/pobierz).
Wreszcie akurat Lean dlatego, że ma znacznie mniej od Coq'a "przegadaną" składnię, rozwija się
ostatnio dość gwałtownie, a w dodatku sprawdził się już znakomicie jako narzędzie
[dydaktyczne](https://github.com/ImperialCollegeLondon/formalising-mathematics-2024)
([tutaj](https://adam.math.hhu.de/#/g/leanprover-community/nng4) na przykład można znaleźć
zaimplementowaną w Leanie *grę*, polegającą na dowodzeniu twierdzeń o liczbach naturalnych).

**Pierwsze trzy rozdziały**, za wyjątkiem **wybiegających w przyszłość i wymagających pewnego
przygotowania części rozdziału trzeciego**, mają charakter ogólnowprowadzający i chociaż nie
zawierają ani fragmentów kodu ani żadnych zadań, to polecam je przynajmniej przejrzeć. Można tam
znaleźć nie tylko oparte na wynikach badań i moich doświadczeniach *wskazówki praktyczne* dotyczące
tego, jak warto podchodzić do nauki jakichkolwiek treści, ale również uwagi dotyczące *nastawienia*,
które może zwiększyć szanse na sukces w zmaganiach z tymi dość nietypowymi jak na książkę skierowaną
do psychologów tematami. Staram się je objaśnić najlepiej jak umiem, ale nie umiem tego robić
lepiej, niż umiem (to niekoniecznie [tautologia](https://pl.wikipedia.org/wiki/Tautologia_(logika)),
za to te, z którymi spotkasz się w [rozdziale ósmym](./rozdzialy/Logika_na_Leanie_nowa_wersja.md) i
[dziesiątym](./rozdzialy/Implikacja_w_zadaniach.md) są nimi z pewnością).

**Piszę tą (tę[^3]) książkę w taki a nie inny sposób**, to jest posyłając czasem mniejsze a czasami
większe zmiany i poprawki do publicznie dostępnego repozytorium GitHuba, bo dzięki temu publicznie
dostępna historia zachodzących zmian może być ilustracją sposobu, w jaki zacząłem ostatnio myśleć o
tym [czym jest zachowanie](./rozdzialy/02_Cel.md). 

Akt pisania książki jest co prawda długim, ale jednak w pewnym sensie pojedynczym aktem zachowania,
choćby dlatego, że można orientacyjnie wskazać początek i koniec tego procesu. Jest w dodatku aktem
*w ramach którego*, dzięki stałej autorefleksji (a może lepiej: *autor-*re*fleksji*) i informacjom
zwrotnym pochodzącym od jej czytelników, zachodzi proces uczenia *się* - choć nie da się powiedzieć
jednoznacznie czego[^4] - i proces odkrywania czy raczej *ustalania się* być może jakiegoś *chwilowo
dominującego*, ale nadal z konieczności *nieunikalnego celu*.

W dodatku na pewnym poziomie abstrakcji nie ma różnicy między napisaniem całej książki a na przykład
tylko tego zdania. Byłoby wskazane, gdyby ten proces zaczął być regulowany w większym niż to ma na
razie miejsce stopniu na podstawie informacji zwrotnych "z zewnątrz", bo zachowania ludzi powstają
zwykle w ramach społecznych interakcji i nabierają dzięki takim interakcjom (również nieunikalnego)
sensu. Na przykład, *to konkretne zdanie* powstało jako rezultat interakcji wielu bardzo sobie
bliskich, bo mających wiele wspólnych cech, ale jednak *różnych* osób, bo *różnych wersji tej samej
osoby*, z których każda istniała tylko *wirtualnie* i tylko *przez chwilę* i wniosła coś do
końcowego rezultatu, rozwijając albo kwestionując to, co zrobiły te poprzednie (wersje), a następnie
to, co w ten sposób powstało lub uległo przekształceniu, przekazując dalej. Nad *zewnętrznymi*
źródłami takich informacji mam jednak bardzo ograniczoną kontrolę, a szkoda, bo przecież, z (pewnej,
którą poznasz później) definicji, im więcej punktów widzenia bierze udział w tym procesie i im
bardziej te punkty widzenia są różne, tym większa jest szansa na zbliżenie się do czegoś dobrego.

Trudno mi powiedziec, czy powyższe uwagi brzmią dla Ciebie "głęboko" lub "filozoficznie", bo nie
jestem Tobą, ale niezależnie od tego, czy tak brzmią, czy nie, na zachętę pozostawię tutaj w wersji
dyndającej (ang. [*dangling*](https://en.wikipedia.org/wiki/Dangling_modifier)) następujące pytanie:
Jak sądzisz, jak by to wszystko zabrzmiało, gdyby miało się okazać, że da się takie jak te wyżej
obserwacje zapisać bez znaczącej utraty ich treści w języku formalnym i przekonać się w ten sposób,
że są właściwie *płytkie*?

[*Radosna działalność*](https://www.youtube.com/watch?v=AZzcE04ssoQ) (ang. *fun activity*): Żeby
zachęcić do lektury, w różnych miejscach umieściłem linki do treści, które nie są blisko związane z
tematem. I w przypisach też czasami zjeżdżam troszkę na pobocze. Nie ma za co.

Kiedy szukam błędów lub fragmentów, które mógłbym jakoś poprawić, chętnie korzystam z oficialnej
[aplikacji](https://play.google.com/store/apps/details?id=com.github.android&hl=en) do przeglądania
repozytoriów GitHuba, którą mam zainstalowaną w telefonie. Nie da się wtedy co prawda wygodnie
przełączać na Leana, ale do czytania na wyrywki sprawdza się wspaniale, więc i Tobie ją polecam.

[R1 Skąd się ta książka wzięła?](./rozdzialy/00_Wprowadzenie.md)

[R2 Co można z tą książką zrobić?](./rozdzialy/01_Jak_sie_uczyc.md)

Ten rozdział napisałem głównie z myślą o *psychologach* i omawiam w nim przede wszystkim to, o czym
będę pisał w planowanej *drugiej* części. Obawiam się jednak, że dobre zrozumienie tego, o czym
tutaj piszę, może wymagać pewnych kompetencji filozoficznych i matematycznych. Ale zerknąć zawsze można.  
[R3 Do czego autor zmierza?](./rozdzialy/02_Cel.md)

A czytając ten rozdział zaczniesz się uczyć (ze mną, chociaż w tym momecie jestem trochę dalej \{ale
wcale nie tak *dużo* dalej\}), w dosyć nietypowy sposób i niemal od zera, podstaw samej *matematyki* .  
[R4 Kilka trywialnych mechanicznych operacji](./rozdzialy/Pierwszy_spacerek.md)

[R5 Pierwszy spacer po Leanie, wersja pierwsza](./rozdzialy/Spacerek_po_Leanie_1.md)

[R6 Pierwszy spacer po Leanie, wersja druga](./rozdzialy/Spacerek_po_Leanie_2.md)

[R6,5 = R00](./rozdzialy/Ewaluacja.md)

[R7 = R01 Być może nie wiesz, że już wiesz, czym jest izomorfizm, a niebawem dowiesz się jeszcze, czym
jest izomorfizm Curry'ego-Howarda](./rozdzialy/Izomorfizm_Curryego_Howarda.md)

[R8 = R02 Logika na Leanie, pierwsze kroki](./rozdzialy/Logika_na_Leanie_nowa_wersja.md)

[R9 = R03 Kilka naiwnych obserwacji na temat języków formalnych](./rozdzialy/Jezyk_matematyki.md)

[R10 = R04 Implikacja w praktyce dowodzenia](./rozdzialy/Implikacja_w_zadaniach.md)

[R11 = R05 Modus ponens, obliczenia w dwóch wymiarach i nieważność
dowodu](./rozdzialy/Modus_Ponens_Niewaznosc_Dowodu.md)

[R12 = R06 Duży kwantyfikator, predykaty, mały fragment całkowicie zmyślonego artykułu i dowód na
istnienie Boga Anzelma z Canterbury](./rozdzialy/Duzy_predykaty_Bog.md)

[R13 = R07 Duży kwantyfikator, predykaty i implikacja w
zadaniach](./rozdzialy/Duzy_predykaty_implikacja_zadania.md)

[R14 = R08 Negacja w praktyce dowodzenia](./rozdzialy/Negacja_w_praktyce.md)

[R15 = R09 Negacja, absurd, fałsz, sprzeczność i eksplozja](./rozdzialy/Negacja.md)[^1]

[R16 = R10 Logika, aksjomaty, fakty empiryczne, wybory, postawy i
wolność](./rozdzialy/Logika_aksjomaty_wybory_postawy_wolnosc.md)

[R17 = R11 ∧ 1](./rozdzialy/Koniunkcja_jako_para.md)

[R18 = R12 ∧ 2](./rozdzialy/Koniunkcja_ze_strzalek.md)

[R19 = R13 Ἐὰν ταῖς γλώσσαις τῶν ἀνθρώπων λαλῶ καὶ τῶν ἀγγέλων](./rozdzialy/Teoria_kategorii.md)

[R20 = R14 Teoria mnogości w zarysie](./rozdzialy/Teoria_mnogosci_w_zarysie.md)

[R21 = R15 Wprowadzenie już na dobre do języka teorii kategorii](./rozdzialy/Wprowadzenie_do_jezyka_teorii_kategorii.md)

Notatki robocze do których można zaglądać:

[R? Teoria mnogości](./rozdzialy/teoria_mnogosci.md)

<a name="podziekowania"></a>
### Podziękowania należą się między innymi

*Wymieniam tu z nazwiska tylko te osoby, które wyraziły na to zgodę*.

Tymoteuszowi Paulewiczowi, za pierwsze informacje zwrotne na temat skryptu.

Uczestnikom kursu [Introduction to causal inference with elements of Bayesian data
analysis](https://www.usosweb.uj.edu.pl/kontroler.php%3F_action%3Dkatalog2%252Fprzedmioty%252FpokazPrzedmiot%26prz_kod%3DSDS-E901-DItc%26callback%3Dg_1d86a895%26lang%3Den),
za uwagi i opinie na temat poprawionej wersji skryptu.

Nienazwanym (niestety) studentom biorącym udział w kursie [Psychologia i neuronauka poznawcza
II](https://www.usosweb.uj.edu.pl/kontroler.php?_action=katalog2/przedmioty/pokazPrzedmiot&kod=WFz.IPs-N-A33b),
którzy wyrazili zainteresowanie dalszym ciągiem.

Renate Rutiku, między innymi za otwartość, zainteresowanie, jak zwykle przenikliwe obserwacje i
zaraźliwy entuzjam, z jakim cierpliwie słuchała moich brzmiących pewnie niezbyt wiarygodnie
opowieści o tej książce, którymi raczyłem Ją gdy ta (książka, nie Renate) dopiero zaczynała się
wykluwać z postaci jajowej i początkowo, co dopiero teraz widzę, również trochę zbyt jajcarskiej.

Autorom maili zawierających zachęcające opinie na temat wcześniejszych wersji.

Emilowi Chammasowi, za pozytywną reakcję i zaangażowanie - o którym zresztą dowiedziałem się
częściowo pośrednio, a przecież nie ma lepszej reklamy niż marketing szeptany - i to jeszcze na
etapie, kiedy to wszystko wyglądało znacznie bardziej podejrzanie.

Tomkowi Smoleniowi, za bardzo miłe słowa zachęty i wykrycie wady polegającej na tym, że nie dość
wcześnie tłumaczyłem sens ostrzeżenia o stylu, widocznego jako podświetlenie nazwy parametru na
szaro.

I jeszcze raz Tomkowi Smoleniowi, za znalezienie w rozdziale *Negacja w praktyce dowodzenia* błędu w
kodzie zadania `tn3`. Zapisując to zadanie musiałem pewnie przekleić z otaczającego tekstu wyrażnie
`¬ P n → (P n → Q n)`, sformatowane tak, żeby wyświetlało się jako fragment kodu, a więc jako
fragment tekstu otoczony *grawisami* (ang. *backtick*) - \`¬ P n → (P n → Q n)\` - i zapomniałem je
usunąć. W ten sposób wyróżnia się w tekście fragmenty kodu w formacie
[Markdown](https://en.wikipedia.org/wiki/Markdown), którego tu używam. Dzięki tej informacji
zwrotnej [TIL](https://en.wiktionary.org/wiki/TIL), że to się nazywa
[grawis](https://pl.wikipedia.org/wiki/Grawis). Note to self: Borek, sprawdzaj częściej kod, bo nie
masz w głowie Leana.

Kubie Szewczykowi, za dodającą odwagi, pozytywną, rzeczową i przemyślaną reakcję.

Mai Strypling, za wskazanie błędu ortograficznego, który wisiał sobie długo tu na głównej stronie i
za cenne meta-refleksje na temat terapii i w ogóle zainteresowanie tematem.

Szymonowi Stryplingowi, który jak dotąd jest najmłodszym, bo *czternastoletnim*, znanym mi
czytelnikiem tej książki i któremu opanowanie treści i wykonanie poleceń zawartych w rozdziale
piątym zajęło, jak się dowiedziałem, około pół godziny. Z tej okazji, na Jego cześć, przed
fragmentem, którego zrozumienie wymagało od Niego nieco więcej skupienia i wytrwałości - co ani
trochę mnie nie dziwi, bo dokładnie o tym fragmencie napisałem wcześniej, że jest w tym rozdziale
najtrudniejszy - dodałem dłuższe ostrzeżenie i zachętę.

I jeszcze raz Szymonowi Stryplingowi, któremu udało się (jeszcze szybciej niż przez piąty)
przelecieć przez rozdział szósty i o którym to rozdziale powiedział, że był *prostszy*. Szymon
rozwiązał wszystkie zawarte w rozdziałach piątym i szóstym zadania, w tym również to, które
określiłem jako przeznaczone dla osób *nadmiernie ambitnych*.

Marcinowi Charlińskiemu, za bardzo miłe słowa, dotyczące zresztą nie tylko tej książki, za wykrycie
w rozdziale drugim wadliwego linku do dostępnej za darmo, znakomitej książki Sheldona Axlera
[*Linear Algebra Done Right*](https://linear.axler.net/) (na początek polecam raczej *drugie*
wydanie, ale to tylko moja opinia) i za wskazanie możliwości napisania czegoś lepiej.

Jeszcze raz Tomkowi Smoleniowi, za dociekliwość, zaangażowanie i wykrycie potencjalnego źródła
nieporozumień polegającego na tym, że nie napisałem dość wcześnie i wystarczająco wyraźnie, że *typ
funkcyjny* znaczy dokładnie to samo, co *typ funkcji* (chyba, że mówimy na przykład *typ funkcji `f`
to...*), a także za zainspirowanie mnie do mam nadzieję lepszego wytłumaczenia szczególnego
charakteru typu `Absurd` w rozdziale o negacji.

Marynie Kołeczek, mojej byłej, niezwykle przenikliwej i samodzielnie myślącej studentce, za
wspaniałą, zachęcającą do dalszej pracy reakcję i - przynajmniej chwilowe - rozwianie wątpliwości
dotyczących formy żeńskiej.

Tomkowi Smoleniowi, Emilowi Chammasowi i Szymonowi Stryplingowi, za pomoc w napisaniu rozdziału
dziewiętnastego-trzynastego. Tomek wykrył niespójności i wskazał mi niejasne fragmenty w jednej z
wersji początkowych, Emil zmotywował mnie, żeby napisać więcej na pewien kluczowy dla tego rozdziału
i całej książki temat, a Szymon dostarczył mi dowód (który dla mnie musi odgrywać rolę aksjomatu),
że ten rozdział może w całości zrozumieć czternastolatek, o ile tylko ma za sobą rozdziały od
czwartego do szóstego. Muszę jednak zaznaczyć, że nie polecam omijania wcześniejszych rozdziałów, bo
wtedy rozdział dziewiętnasty-trzynasty może nie spełniać dostatecznie dobrze swojej roli. Szymon
stwierdził nawet, że to był dla Niego jak dotąd rozdział *najprostszy*, a przecież zaczynam w nim (w
rozdziale i "w czytelniku") wprowadzać język teorii kategorii, którą matematycy nazywają czasem
[*abstrakcyjnym nonsensem*](https://en.wikipedia.org/wiki/Abstract_nonsense) (chociaż może
określenie [abstrakcyjny Absurd](https://en.wikipedia.org/wiki/Reductio_ad_absurdum) też by
pasowało).

I jeszcze raz Tomkowi Smoleniowi, za wskazanie błędu w opisie funkcji `And.intro` w rozdziale
18-12. Pisząc ten fragment musiałem chyba już spać, bo było tam podane (no czemu tak bezosobowo,
przecież przeze mnie było \{no tak, faktycznie\}), że aby stworzyć dowód koniunkcji za pomocą
`And.intro` wystarczy podać *jeden* argument, w dodatku to był *dowód koniunkcji*, czyli całkiem bez
sensu. Trzeba oczywiście podać *dwa* argumenty, będące dowodami *członów* koniunkcji.

Barłomiejowi Pankowi, za bardzo miłą i zachęcającą do dalszej zabawy reakcję na moją sugestię, żeby
zapoznać się z tą książką i za podzielenie się obserwacjami, dzięki którym odkryłem, że myślimy
bardzo podobnie o niektórych ważnych moim zdaniem sprawach.

Piotrowi Wolskiemu, za błyskawiczne przeczytanie (w niedzielę wieczorem!) całego bodaj wprowadzenia
niedługo po mojej wiadomości o tej książce, za bardzo miłe słowa zachęty, które potem padły, za
podzielenie się cennymi refleksjami i za ujawnienie, zresztą nie po raz pierwszy i pewnie nie
ostatni, jak podobnie myślimy o metodologii i o tym, jak się jej (niestety) zwykle uczy psychologów.

Iwonie Dudek, którą pamiętam jako zaangażowaną i otwartą uczestniczkę kursu z wnioskowania
przyczynowego i bayesowskiego, za bardzo miłe słowa na temat tego kursu i entuzjastyczną reakcję na
tą książkę.

Sofii Honcharovej, uzdolnionej i obiecującej uczestniczce mojego kursu dotyczącego wnioskowania
przyczynowego i bayesowskiego, za to, że powiedziała mi szczerze coś, dzięki czemu zmieniłem
zakończenie rozdziału czwartego na takie, które moim zdaniem pomoże innym czytelniczkom i
czytelnikom.

I jeszcze raz czternastoletniemu Szymonowi Stryplingowi, pierwszemu testerowi rozdziału
dwudziestego, będącego krótkim wprowadzeniem do teorii mnogości, który podzielił się swoimi
doświadczeniami. Najwyraźniej bez większych trudności wykonał wszystkie zadania w tym rozdziale, a
końcówkę określił nawet jako "banalną".

[Informacja chce być wolna.](https://en.wikipedia.org/wiki/Information_wants_to_be_free)

### Przypisy

[^1]: O prawie [podwójnej negacji](https://kawaly.tja.pl/dowcip,profesor-filologii-polskiej-na) będę
    pisał w innym rozdziale.

[^2]: Więcej na ten fascynujący temat można poczytać w
    [tej](https://global.oup.com/academic/product/modal-homotopy-type-theory-9780198853404?cc=it&lang=en&)
    interesującej i wartościowej książce, ale niestety nie jest to lektura lekka, łatwa i przyjemna,
    to znaczy może stać się w końcu względnie łatwa i przyjemna, ale żeby tak się stało, to przez
    dłuższy czas nie może być lekka, bo dotyczy podobnych zastosowań, tyle, że jednocześnie
    [*homotopijnej* teorii typów](https://homotopytypetheory.org/book/) i [teorii
    kategorii](https://pl.wikipedia.org/wiki/Teoria_kategorii), którą nawet zawodowi matematycy
    określają czasem (czule!) jako [*abstract
    nonsense*](https://en.wikipedia.org/wiki/Abstract_nonsense).

[^3]: Napisałem, co myślę o tej konwencji, w przypisie do jednego z rozdziałów.

[^4]: Tak naprawdę da się - pisanie ksiażki jest uczeniem *się* kolejnych, wirtualnych wersji
    "siebie", a więc procesem *iteracyjnego wykształcenia (nomen omen \{się\})* w *dialogu* z
    poprzednimi i przyszłymi wirtualnymi wersjami ("siebie") - ale *wyraźnie* i *jasno*, czyli
    formalnie, powiemy to najprawdopodobniej dopiero w drugiej części.
