## O czym teraz będzie

Nie chcę psuć niespodzianki.

# Nie ma to jak **_Rysowanie_**

W tej książce nie ma na razie rysunków i nie wiem jeszcze, czy w ogóle jakieś będą. Mam powód, żeby
ich unikać, ale na razie trudno mi to wyjaśnić. A teraz akurat będziemy potrzebowali rysunku, a
właściwie kilku, a tak naprawdę będziemy potrzebowali kilku *diagramów*.

**Polecenie**: Przygotuj czystą kartkę papieru i długopis, albo cokolwiek innego do pisania. Może
najlepiej kartkę formatu *A4*, ale nie warto się przy tym upierać. Jeżeli masz kartkę formatu *A4*,
to może połóż ją poziomo. Zaczniemy w lewym górnym rogu.

1. Zapisz literę *A*, a zaraz *po prawej* od niej mały
   [okrąg](https://pl.wikipedia.org/wiki/Okr%C4%85g) (nie
   [koło](https://pl.wikipedia.org/wiki/Ko%C5%82o)), jakbyś chciała zaznaczyć tylko pewien *punkt*,
   w którym właściwie nic nie ma, albo którego prawie nie ma, i oznaczyć go literą *A*.

2. Po prawej od *punktu A*, w odległości równej powiedzmy mniej więcej połowie długości Twojego
   palca wskazującego (naprawdę nie musi być dokładnie), zaznacz drugi podobny okrąg, a *po prawej*
   od tego okręgu zapisz literę *B*. Odtąd dla własnej wygody pisania i Twojej wygody czytania będę
   nazywał tą odległość *krokiem*, a kiedy powiem, dla `X : Litera`, *oznacz* dany *punkt literą*
   `X` *z prawej*, albo *z lewej*, albo *z góry*, albo *z dołu*, to będzie mi chodziło o to, żebyś
   zapisała tą literę zaraz po prawej, albo zaraz z lewej, albo zaraz nad, albo zaraz pod tym
   punktem odpowiednio.

3. Narysuj strzałkę wychodzącą z punktu *A* i wchodzącą do punktu *B*, czyli taką z grotem
   wskazującym na punkt *B*. Może narysuj ją tak, żeby nie stykała się całkiem z punktami, ale to
   tylko sugestia. Ja robię to raz tak, a raz inaczej i często się waham, którą wersję
   wybrać. Zgodnie z instrukcjami ta strzałka powinna być narysowana poziomo. Odtąd będę mówił
   krócej, na przykład: Jeżeli na kartce `X : Punkt` i `Y : Punkt` (typowanie można czytać jak
   zdanie, pamiętasz?), to powiem *narysuj strzałkę z* `X` *do* `Y`, a właściwie powiem to nawet
   krócej (to tylko objaśnienie języka, jakim będę się w coraz większym stopniu posługiwał, nie
   instrukcja).

4. `Krok` poniżej `B : Punkt` narysuj kolejny `Punkt` i oznacz go z dołu literą `C`, a potem tak
   samo narysuj `Strzalka B C`, czyli strzałkę z punktu `B` do punktu `C`.

5. Zaraz nad `Strzalka A B` zapisz literę `f`, a zaraz po prawej od `Strzalka B C` zapisz literę
   `g`.

Masz teraz dwie strzałki, o których, gdy wymienimy je *w określonej kolejności*, możemy powiedzieć,
że są `Skladalne`, rozumiejąc przez to, że jedna strzałka (tutaj `f`) wchodzi do punktu (tutaj `B`),
z którego wychodzi druga (tutaj `g`). Ten fakt możemy zapisać jako zdanie `Skladalne f g`. Zwróć
uwagę, że *kolejność* strzałek ma tutaj znaczenie, bo nie jest prawdą, że `Skladalne g f`. I teraz
muszę zacząć pisać ostrożniej, a Ty będziesz musiała uzbroić się w cierpliwość, czekając, aż to co
powiem stanie się w miarę jasne.

## [*Absence of evidence is not evidence of absence*](https://en.wikipedia.org/wiki/Evidence_of_absence)

Napisałem, że *nie jest prawdą, że* `Skladalne g f`, ale *nie* miałem na myśli, że *jest nieprawdą,
że* `Skladalne g f`. Wbrew pozorom to nie jest to samo, a w każdym razie to niekoniecznie to
samo. Żeby stwierdzić, że *nieprawda, że* `Skladalne g f`, musimy dysponować *dowodem* `¬(Skladalne
g f)`. Mówiąc, że *nie jest prawdą, że* `Skladalne g f` miałem na myśli *tylko* tyle, że *póki co
nie dysponujemy żadnym dowodem, że* `Skladalne g f`, ale *nie możemy wykluczyć*, że taki dowód się
pojawi. Żeby to wykluczyć, musielibyśmy albo udowodnić, albo założyć, że punkty `A` i `C` są
*różne*. Wtedy faktycznie *nie mogłoby* być prawdą, że `Skladalne g f`.

W tym momencie, albo już wcześniej, mogła Ci się pojawić wątpliwość, że przecież punkty `A` i `C`
*nie nachodzą na siebie na rysunku*, a więc *nie może być tak*, że `A` i `C` są tym samym *punktem*,
a więc *to różne punkty*. I myśląc tak miałabyś rację!

Rysunek *sugeruje* tutaj, że `A`, `B` i `C` to *różne punkty* i że `f` i `g` to *różne strzałki* i
to faktycznie *są* różne punkty i różne strzałki *na tym rysunku*, ale *tym razem* **to nie jest kod
Leana**, tylko pewne formalne *reprezentacje*, które w ogólnym przypadku mają coś *oznaczać*. Te
punkty i strzałki mogą, ale nie muszą *reprezentować różne obiekty* (odpowiedniego typu). Punkty
`A`, `B` i `C` pełnią tu więc role abstrakcyjnych reprezentacji czegoś, co spełnia pewne wymagania
(jak się okaże, będą to wymagania kategorii), czyli są **rysunkowymi zmiennymi** i tak samo
zmiennymi są również wszystkie strzałki; chyba, że z jakiś powodów przyjmiemy określone *definicje*
niektórych lub wszystkich tych symboli i te staną się przez to *stałymi*.

Czyli te punkty i strzałki są tutaj jak litery *n* i *m* w wyrażeniu *n + m = m + n*, zapisanym jako
fragment prozy matematycznej, z którym zetknęłaś się w rozdziale czwartym. Chociaż to, że *litery*
były tam różne, zdawało się *sugerować*, że te litery oznaczają różne liczby, to wiedziałaś, albo
przypomniałaś sobie szybko, że obie te litery mogą oznaczać *dowolne* liczby naturalne, mogą więc
oznaczać również *te same* liczby, czyli jakąś jedną liczbę, na przykład *1*. Gdyby na przykład obie
te litery oznaczały liczbę *1*, równanie przyjęłoby postać *1 + 1 = 1 + 1* (i nadal byłoby
prawdziwe, bo jest prawdziwe dla *każdej* pary liczb).

Kiedy czytając rozdział czwarty wyprowadzałaś, zgodnie z moimi instrukcjami, dowód twierdzenia
Bayesa, nie używaliśmy jeszcze Leana, a więc to *Ty* musiałaś konsekwentnie podstawiać pewne
wartości (wtedy symbole *y* i *x* oznaczające zdarzenia) za pewne zmienne (wtedy za zmienne *x* i
*y* *jako części definicji pionowej kreski*), a więc musiałaś też oczywiście *rozumieć, co masz
zrobić*.

Wiesz, o co mi chodzi? Teraz, gdy na jakiś czas przestaliśmy polegać na Leanie i znowu sama
*tworzysz kod* (rysując), a niebawem będziesz też sama *przekształcać wyrażenia zapisane w tym
języku*, to **Ty jesteś funkcją** i jednocześnie to **Ty dokonujesz** (stale) **ewaluacji**. W
szczególności, *jesteś funkcją, która widzi, że dostała* **jakieś**, *niekoniecznie różne obiekty,
które dla Ciebie są oznaczone* (albo *reprezentowane*) *przez `Punkt` `A`, `B` i `C`, jak również*
**jakieś**, *niekoniecznie różne obiekty, które dla Ciebie są oznaczone jako `Strzalka` `f` i `g`, o
których to obiektach wiesz tylko tyle, że `Skladalne f g`. Te* (bliżej nieokreślone) *obiekty są
więc dla Ciebie "opakowane" i nie możesz otworzyć tych opakowań.* 

Na razie nic nie jest "przyczepione" do tych elementów rysunku od spodu i (zgaduję) że nigdy nie
będzie, ani nic nie jest jeszcze *wystarczająco skutecznie związane* z tymi elementami *w Twojej
głowie*. Ale może być i będzie, w jednym z następnych rozdziałów.

Punkty `A`, `B` i `C` są różne *jako zmienne*, ale mogłabyś przecież dostać w przyszłości dowód, że
`A = C`, albo po prostu założyć taką hipotezę i wtedy okazałoby się, że zmienna / paczka z etykietą
`A` skrywała cały czas "pod" jakimś wirtualnym "spodem" *taki sam* (być może również tylko
wirtualny) *obiekt*, co zmienna / paczka z etykietą `C`, tylko wcześniej o tym nie wiedziałaś.

Zwróć proszę uwagę, że napisałem *taki sam*, a nie *ten sam*, a napisałem tak dlatego, że w
matematyce równość *nie* oznacza "absolutnej identyczności" tylko **nierozróżnialność w danym
języku** (albo z danego *punktu widzenia*). Na przykład, *1/2* to *ta sama liczba* co *2/4*, ale to
jednocześnie jest przecież *inny ułamek*. Kiedy więc posługujemy się "językiem liczbowym", to jest
to samo (a tak naprawdę takie samo), ale kiedy posługujemy się "językiem ułamkowym", to nie jest to
samo (ani tym bardziej takie samo).

A skoro niebawem to *Ty* będziesz operowała symbolami, podstawiając i dokonując w pewien sposób
ewaluacji różnych wyrażeń, to **"Ty" będziesz funkcją i ewaluatorką**. Jeżeli chodzi o te symbole
narysowane na kartce, to dopiero zaczynasz się przekształcać w funkcję, która będzie te symbole
traktowała tak, jakby były nazwami zmiennych. *To będzie wtedy* **"Twój" kontekst** *albo*
**kontekst "Ciebie" jako funkcji**.

*To całkiem dosłownie, bo fizycznie* (i zarazem *funkcjonalnie*, ale w innym znaczeniu słowa
"funkcja") *będzie* **"Twój" kontekst**, *ponieważ to będzie część* **fragmentu środowiska
fizycznego**, *który, chociaż się nieustannie zmienia i nie jest tak naprawdę oddzielony od reszty
świata żadną ścisłą i nieprzepuszczalną barierą, jest jednak dla "Ciebie" szczególnie ważną częścią
środowiska, bo jest zawsze przy "Tobie", albo "jest" - przynajmniej do pewnego stopnia - "Tobą",
zależnie od punktu widzenia. Tą zawsze dla "Ciebie" łatwo dostępną i stosunkowo kontrolowalną część
"swojego" środowiska nazywasz* **"własnym" ciałem**. *A część "Twojego" ciała, która* **pełni teraz
rolę kontekstu "Ciebie" jako pewnej** (jeszcze innej) **funkcji** *nazywasz "Twoją"* **pamięcią**.

*Tak się też przy okazji składa, że używasz lokalnego* (dla "Ciebie") *fragmentu środowiska
zewnętrznego* (to jest kartki, być może w formacie *A4*, ale tego nie wiem), *żeby pomóc "swojej"
pamięci korzystając z rysunku, ale ten rysunek ma dla "Ciebie"* **sens** *tylko dzięki temu, że*
**pamiętasz, co oznacza**, *czyli przede wszystkim pamiętasz co można, a czego - zachowując sens -
nie można z nim zrobić. Rzeczywisty kontekst znajduje się więc* (prawie) *w "Twoim" ciele, a rysunek
to tylko "tymczasowa proteza" albo "zewnętrzne rusztowanie" dla Twojej pamięci*.

Nie ma znaczenia, czy się z tym zgadzasz, czy nie, bo teraz, tworząc ten rysunek i stosując
zaproponowany przeze mnie język opisu, ale też bardzo wiele razy wcześniej, "*sama*" sprawiłaś, że
coś takiego się już *wielokrotnie stało*. A stało się to dzięki temu, że w ramach tej **naszej**
jakby rozmowy pozwoliłaś "mi" "siebie" w pewien sposób *zaprogramować*. Nie obraź się proszę, to
tylko tak brzmi, chodzi mi o coś najzwyczajniejszego w świecie (ludzi).

I co "Ty" na to? Właściwie dosyć zwyczajna (prawie) rozmowa, a jednocześnie nie taka całkiem
zwyczajna, prawda?  W zasadzie nie różni się to *niczym* od *każdej innej rozmowy*, ani od
wszystkich moich wcześniejszych prób wytłumaczenia Ci czegoś, bo pisząc musiałem zakładać, że
będziesz w określony sposób ze mną *współpracować*, a dokładniej *współ-działać*, a w każdym razie
miałem przez cały ten czas taką nadzieję. 

Kiedy na przykład pytasz kogoś o godzinę, to niby co innego się dzieje? Manifestuje się w zachowaniu
drugiej osoby magiczna wolna wola i tak się szczęśliwie składa, że - *prawie zawsze* - zwrotnica
wydarzeń przesuwa się na sprzyjający "Tobie" tor? *Być może*, bo tego się z definicji nie da
stwierdzić ani wykluczyć. *Na pewno* natomiast wypowiadając pytanie o godzinę uruchamiasz w "drugim"
człowieku pewien proces, o którym w takich sytuacjach z góry wiesz, że prawie na pewno zadziała. A
wiesz to, ponieważ posługujemy się językiem i mamy silną gatunkową tendencję do współdziałania,
której dosłownie prawie wszystko zawdzięczamy dosłownie każdego dnia.

I pamiętajmy proszę o lustrzanym odbiciu tej zasady, którą tak *celnie*[^3] wyraził [Thích Nhất
Hạnh](https://pl.wikipedia.org/wiki/Th%C3%ADch_Nh%E1%BA%A5t_H%E1%BA%A1nh) - <span
style="color:gray">na wojnie każdy jest ofiarą</span>.

Dlatego przywdziewając jakikolwiek pancerz, albo nawet tylko sięgając po tarczę, choćby taką z co
prawda dosyć śmiesznym, ale jednak budzącym u niektórych *automatycznie* większy szacunek [godłem
doktora](https://pl.wikipedia.org/wiki/Kogut_galijski), sami sobie przeszkadzamy w osiągnięciu
czegoś naprawdę dobrego.

Gdy pytasz kogoś o godzinę jest *jednocześnie* prawdą, że chwilowo *przekształcasz "drugiego"
człowieka w "swój" zegarek* i że to jest *autonomiczny, zasługujący na szacunek człowiek*. To samo
dzieje się z "Tobą" od momentu kiedy budzisz się rano do momentu, kiedy zasypiasz. Wykonując każdą
czynność inicjujesz ten sam proces, tylko że wtedy prowadzisz wewnętrzny dialog ze "sobą", to
znaczy, "sama" z przyszłą "sobą" współ-działasz, bo inaczej "Twoje" zachowanie nie byłoby tak
*elastyczne* i nie działałoby *tak* (to jest *zwykle wystarczająco*) *dobrze*, a ponieważ świetnie
"się" rozumiecie, "Ty" i powstająca za chwilę nowa wersja "Ciebie" (jednostronnie, ale jednak)
komunikujecie "się" zwykle - choć nie zawsze - bez słów i ten *sposób działania* "przychodzi Ci" tak
naturalnie, że może "Ci" być nawet trudno zauważyć albo uwierzyć, że jest *konieczny* do *zrobienia
czegokolwiek*.

Jeżeli tylko próbowałaś zrozumieć to, o czym do "Ciebie" mówiłem, a skoro czytasz teraz ten
fragment, to mogę założyć, że przynajmniej czasami tak, to działo się wtedy dokładnie to samo, teraz
tylko szczegóły są nowe. A właściwie przecież już
[wtedy](https://github.com/boryspaulewicz/matematyka_dla_psychologow/blob/main/rozdzialy/Pierwszy_spacerek.md#ten-tytu%C5%82-jest-tylko-po-to-%C5%BCeby-do-niego-p%C3%B3%C5%BAniej-wr%C3%B3ci%C4%87),
niemal na samym początku, nawet szczegóły były w zasadzie takie same.

Zgaduję jednak, a w każdym razie mam taką nadzieję, że "Twoje" *wrażenie*, na czym to polega, może
być tym razem w jakiś trudny do określenia sposób inne. Czy nie chodzi przypadkiem o to, że wtedy,
udowadniając twierdzenie Bayesa, czułaś się być może nawet dumna, a w każdym razie chociaż trochę
usatysfakcjonowana, że wszystkie elementy układanki trafiły na właściwe miejsce i "Tobie" wyszedł
dowód, a teraz miałaś przynajmniej przez chwilę trochę wrażenie, że zostałaś w pewien sposób
*zmanipulowana*? Czy faktycznie jest jakaś różnica? Nazywałem dotąd co prawda te "moje zadania"
"poleceniami", ale to była z konieczności za każdym razem *prośba*, bo za każdym razem musiałem
liczyć na "Twoją" *dobrą wolę* i *współpracę*. Nie mogłem przecież, ani też wcale nie chciałem, Cię
do niczego *zmusić*.

Być może trudno "Ci" zaakceptować to, że równość w matematyce to "tylko" pewien rodzaj jakby
"subiektywnej", bo relatywnej do języka albo do punktu widzenia nierozróżnialności, ale to jest
akurat ogromna *zaleta*. Tak, wiem; celowo zmieniłem nagle temat (i jednocześnie wcale nie
zmieniłem). Żeby coś dobrze zrozumieć i móc tego czegoś używać do wszystkiego, do czego tylko może
się nadawać, musimy nauczyć się patrzeć na to samo na różne sposoby. A to oznacza, że musimy
pogodzić się z pewnego rodzaju [nieszkodliwym
relatywizmem](https://pl.wikipedia.org/wiki/Realizm_wewn%C4%99trzny). Dopóki pamiętamy, że istnieją
zawsze rozmaite alternatywne, wewnętrznie niesprzeczne punkty widzenia na to samo i dopóki
korzystamy z nich w sposób konsekwentny, nie grozi nam przecież ryzyko, że znajdziemy uzasadnienie
albo dowód dla *każdego* możliwego zdania.

Jak się później przekonasz, język teorii kategorii, który zacząłem tu wprowadzać i którego podstawy
już częściowo opanowałaś, został stworzony właśnie po to, żeby formalnie, a więc w sposób
kontrolowany i mechanicznie sprawdzalny, operować najróżniejszymi pasującymi do siebie punktami
widzenia. Do tej pory mówiłem wprost o tylko jednym, bardzo ważnym rodzaju takiego dopasowania, to
jest o zachowujących strukturę izomorfizmach. A jak już wiesz, izomorfizmy to takie *ścisłe* albo
*doskonałe* analogie, ale przecież również *mniej* ścisłe analogie bywają, czasami nawet bardziej,
użyteczne.

Ponieważ język teoria kategorii służy przede wszystkim do *mówienia o* **różnych rodzajach**
*zgodności między dobrze określonymi punktami widzenia*, a więc o różnych, w tym także słabszych,
albo bardziej elastycznych niż izomorfizmy, rodzajach dopasowania między (formalnymi) językami albo
opisami, można powiedzieć, że teoria kategorii to ogólna teoria *analogii między analogiami*. A
teoria kategorii [*wyższego rzędu*](https://en.wikipedia.org/wiki/Higher_category_theory) to taka
teoria analogii między analogiami między analogiami ... Genialny polski matematyk [Stefan
Banach](https://pl.wikiquote.org/wiki/Stefan_Banach) powiedział kiedyś, że "dobry matematyk potrafi
dostrzegać fakty, matematyk wybitny - analogie między faktami, zaś matematyk genialny - analogie
między analogiami." Nie bez przesady można więc powiedzieć, że język teorii kategorii dostarcza
*protezę matematycznej genialności*, której w dodatku możemy, oczywiście tylko w pewnych sytuacjach,
używać stosunkowo *bezmyślnie*, to znaczy mechanicznie.

Musimy jednak ponieść wtedy pewną *cenę*, która polega na tym, że trzeba się czasem pogodzić z
*trudnościami w jasnym zrozumieniu tego, co się w tym języku mówi*. Tą cenę musimy do pewnego
stopnia zapłacić być może dlatego, że chociaż teoria kategorii może być, i często zresztą jest,
rozumiana jako *algebra [funkcji matematycznych](https://pl.wikipedia.org/wiki/Funkcja)*, to
definicje pojęć, które można za jej pomocą wypowiedzieć, polegają często na charakteryzacji
określonego rodzaju obiektów w kategoriach ich funkcji rozumianych jako *uniwersalne* albo w pewnym
abstrakcyjnym sensie *najlepsze rozwiązywania pewnego rodzaju problemów czy zadań*. Dlatego między
innymi na własny użytek pół-żartem nazywam sobie ten język językiem kosmitów albo językiem
aniołów. I kiedy mówię o nim, że jest jakby językiem aniołów, nie mówię tego wcale ironicznie.

Nie jestem wierzący w żadnym prostym sensie tego słowa i chyba nigdy nie byłem. Pamiętam nawet dość
dokładnie dzień i miejsce w którym to się stało, gdy będąc dzieckiem pomyślałem, że Święty Mikołaj
nie istnieje, a To, o czym ludzie mówią w Kościele, to taki jakby [Święty
Mikołaj](https://www.coca-colacompany.com/about-us/faq/did-coca-cola-invent-santa) dla
"dorosłych". To był, przynajmniej subiektywnie, nagły i niespodziewany wgląd i od tego czasu nigdy
nie miałem nawet *cienia* wątpliwości, że "mam rację". Ale przecież, zwłaszcza w logice, której
teraz używamy, tak samo jak w [testowaniu hipotez
statystycznych](https://pl.wikipedia.org/wiki/Test_istotno%C5%9Bci), absence of evidence is *not*
evidence of absence.

Mój najlepszy chyba przyjaciel, który jest wierzący, powiedział mi kiedyś, że "On" już tak po prostu
ma, że wie, a może raczej *czuje*, że *musi być coś więcej*. Ale "ja" *to* też zawsze wiedziałem i
czułem, co zrozumiałem trochę lepiej dopiero niedawno, mając czterdzieści sześć lat. Tylko może "ja"
*to samo* czuję inaczej albo nie tak *intensywnie*, tak jak można lepiej albo gorzej wyczuwać na
przykład smak soli (albo herbaty). A to by oznaczało, że w pewnych sprawach mogę mieć ([niczym
niezasłużoną](https://ccpress.pl/matryca-jak-dna-programuje-nasze-zycie/3-21-447)) przewagę, ale w
innych, być może nawet ważniejszych sprawach jestem ([nie z własnej
winy](https://www.filmweb.pl/film/Bliscy+nieznajomi-2018-801813)) bardziej *ułomny* niż ludzie,
którzy są w tradycyjnym znaczeniu wierzący. W drugiej części pokażę "Ci" nawet, jak można
*sformalizować* to pojęcie "czegoś więcej" albo "ponad" jako pewien rodzaj uniwersalnej i
abstrakcyjnie rozumianej *granicy*, ale już teraz mogę spróbować wyjaśnić, o co w tym będzie
chodziło, bo to pojęcie nie jest wcale bardzo oderwane od codziennego doświadczenia.

Kiedy na przykład "Ty" stałaś się na pewien czas funkcją na skutek "mojego" za-programowania, żadne
z nas nie było *tak naprawdę* żadnym abstrakcyjnym algorytmem. Ani "ja" "Ciebie" tak *całkiem* nie
zaprogramowałem, ani "Ty" nie wcieliłaś się *w pełni* w rolę żadnego programu, ponieważ jesteśmy
*organizmami biologicznymi*, a dokładniej
[*zwierzętami*](https://pl.wikipedia.org/wiki/Zwierz%C4%99ta)[^1]. Nasze przekonania i postawy nigdy
nie są całkiem spójne i każdy z nas popełnia czasem błędy nawet w najprostszych sytuacjach. Nawet
Lean nie jest tak naprawdę całkiem Leanem, bo działa na fizycznym urządzeniu, a *żadne* fizyczne
urządzenie nie jest, bo *nic* nie jest, *całkowicie niezawodne*.

Ale jednocześnie to, w jaki sposób działam "ja", w jaki sposób działasz "Ty" i w jaki sposób działa
Lean i jak działają *wszystkie narzędzia i inne [artefakty](https://pl.wikipedia.org/wiki/Artefakt)
stworzone przez wspólnotę ludzi*, łącznie z całą matematyką, jest jakby czymś w rodzaju "wektora",
albo ... palca, który przybliżając coś (a dokładniej *rozwiązania* pewnych *abstrakcyjnych zadań*)
wystarczająco dobrze *wskazuje* na pewien *ideał*, a dzięki temu, że na ten ideał wskazuje, sprawia
przecież, że On, to znaczy Ten Idaeł, albo Zewnętrzny Podmiot albo Agent, jak Go czasami prywatnie
nazywam, *istnieje jako kierunek wspólnego działania*. W tym sensie można więc powiedzieć, że jest
*w nas* pewien On i jednocześnie nie jest.

Niewątpliwie ma ten Niemalże Do Pomyślenia Podmiot coś z Λόγος-u, a ponieważ jest z konieczności
wytworem wspólnoty i (będzie w drugiej części) abstrakcyjnym ucieleśniem w języku formalnym
uniwersalnego pojęcia Oceny, to coś z Ἠθος-u (i
[Πάθος-u](https://en.wikipedia.org/wiki/Modes_of_persuasion)) też możemy chyba w Nim zobaczyć
(jeżeli tylko przymrużymy trochę jedno
[oko](https://www.goodreads.com/quotes/7169-the-eye-through-which-i-see-god-is-the-same)). Może więc
Anzelm nie był wcale taki głupi, jak mi się zdawało? I może wcale mi się tak wtedy nie zdawało?

A skoro jesteśmy zwierzętami, które potrafią wykonywać wiele różnych zadań, ale *żadnego* zadania
nie potrafią wykonywać w sposób *niezawodny* albo *doskonały*, czy może raczej *czysty*, to
należałoby właściwie powiedzieć, co *się* stało, tak: "Ja" wpadłem w pewnym momencie na prawie
pomysł, żeby napisać fragment tego rozdziału jako serię instrukcji dotyczących rysowania i
notatek. Stworzyłem aplikację "siebie" do pewnych argumentów, które zapisałem w "swojej" pamięci i
poprzez ewaluację - będącą jakby przejściem między dwiema chwilowymi, wirtualnymi wersjami
"siebie" - tej aplikacji przekształciłem "się"
([μεταμορφώσεις](https://en.wikipedia.org/wiki/Metamorphoses)), albo może raczej
[*wykształciłem*](https://pl.wikipedia.org/wiki/Wykszta%C5%82cenie) w taką wersję "siebie", która
[*wystarczająco dobrze*](https://en.wikipedia.org/wiki/Satisficing), bo skutecznie wykonała zadanie
zapisania pierwszego zdania tego rozdziału (oczywiście pomijam tutaj pewne pośrednie kroki) i tak
*krok za krokiem*, wracając czasem do wcześniejszych fragmentów, poprawiając różne rzeczy,
przerywając i robiąc coś innego, napisałem tyle, że prawie (ale mimo to wystarczająco skutecznie)
zwróciłem się z prośbą do moich "subskrybentów", żeby spróbowali ten rozdział (prawie)
przetestować. Zanim (prawie) napisałem *to* zdanie, zdążyłem już dostać kilka wiadomości i
przerobiłem kilka razy fragmenty tego rozdziału - takie, które poprzedzają ten akapit i takie, które
następują po nim. Nawiasem mówiąc, dokonując tych zmian czasami dosłownie (prawie) *pisałem do
"siebie"*, bo posyłałem zmiany do tego repozytorium z komentarzami, (prawie) mówiącymi (przyszłemu
"mi") krótko, o co w tych zmianach *chodziło*.

**Chodziło**, *czujesz*? Wszyscy jesteśmy wspaniałymi, działającymi biologicznie, wielorako ze sobą
splątanymi *prawie programami*, które nieustannie *prawie programują siebie samych i siebie
nawzajem*, tworząc ciągle następne, nowe *wersje nas*.

To taki wspólny spacer.

Na przykład "Ty", czytając ten rozdział, zaczęłaś w pewnym momencie [przekształcać "siebie" w
proces](https://pl.wikipedia.org/wiki/Logo_(j%C4%99zyk_programowania)) wykonujący (wystarczająco
dobrze) zadanie rysowania według "moich" instrukcji i robiłaś też ze "sobą" różne inne rzeczy,
próbując jakoś "mnie" zrozumieć (za co "Ci" bardzo dziękuję). I to były też tego samego rodzaju
kroki, polegające na tym, że zapisywałaś jakby w "swojej" *aktywnej pamięci* aplikacje "siebie",
które to aplikacje były ewaluowane, to jest ucieleśniałaś "sobą" wystarczająco dobre przybliżenia
pewnych funkcji, które coś *robiły*. Pozornie "Twój" rysunek jest więc rezultatem kilku odległych
fizycznie i fizycznie wyraźnie odrębnych procesów, ale przecież te procesy nie były i nie są tak
naprawdę fizycznie całkiem oddzielone, bo gdyby były, nie mogłabyś "mnie" czytać. Mimo odległości i
częściowej fizycznej odrębności, ten rysunek jednak powstał i to było możliwe tylko dzięki licznym
*funkcjonalnie splątanym procesom celowym*, bo przecież *między innymi* "ja" brałem w tym udział i
"osoby", które odpowiedziały w międzyczasie na moje wezwanie, też brały w tym
["udział"](https://en.wikipedia.org/wiki/Participation_(philosophy)) i to już było dosyć mocno
"poplątane", a teraz jeszcze "Ty" "się" w to "sama" (ale tak naprawdę w ogóle *nie sama*)
[*wplątałaś*](https://en.wikipedia.org/wiki/Entanglement_(film)).

Czy nie miałaś wrażenia, że coś próbuje się spod tego tekstu wyrwać i Cię opisać? Uspokajam, że
chociaż faktycznie już próbuje, to jeszcze nie może, bo brakuje nam kilku kluczowych
składników. Każdy opis świata albo jego części jest z konieczności fragmentaryczny, dlatego będziemy
potrzebować pojęcia prawdopodobieństwa. Żeby ten opis był dla nas zrozumiały i bardziej użyteczny,
będziemy musieli wprowadzić pojęcie (zewnętrznej) interwencji, a więc wpływu, a także możliwość
mówienia o tym, jak *mogłoby* być (ale nie było), a więc pojęcia kontrfaktyczne. Gdy dodamy do tego
pojęcie oceny, będziemy mogli mówić o "Tobie", o "mnie" i wszystkich innych zwierzętach, a także o
wszystkich narzędziach i innych artefaktach stworzonych przez istoty inteligentne, to jest o
przedmiocie badań psychologii. I będziemy również wtedy mówić w języku formalnym o moralności. A w
tych wszystkich bytach rozpoznamy *fizyczne przybliżenia Podmiotu Działań*.

### Ten wybiegający w przyszłość fragment jest przeznaczony raczej dla "prawie-ekspertów"

Jeżeli masz ochotę, może warto teraz popatrzeć "nowym okiem" na zawartość [rozdziału
trzeciego](02_Cel.md), w którym mówiłem o tym, co będzie w planowanej drugiej części. Wspominam tam
między innymi o rachunkach prawdopodobieństwa i przyczynowym. Rachunek przyczynowy, o którym tam
mówię, to tak zwany [przyczynowy model strukturaly](https://en.wikipedia.org/wiki/Causal_model) (nie
mylić z bardziej wyspecjalizowanym i niemal bezużytecznym [modelowaniem równań
strukturalnych](https://en.wikipedia.org/wiki/Structural_equation_modeling)) Pearla (jest jeszcze
równoważna teorii Pearla teoria [Neymana-Rubina](https://en.wikipedia.org/wiki/Rubin_causal_model)
\{tak, tego Jerzego von Neymana\}, ale z niej nie będziemy korzystać, bo moim i nie tylko moim
zdaniem nie warto). W teorii Pearla założenia na temat relacji przyczynowych są wyrażone jako pewne
*funkcje*, w dodatku takie, które mają być, przynajmniej potencjalnie, *zrealizowane przez* pewne
*procesy fizyczne*. A to oznacza, że funkcje strukturalne w teorii Pearla *muszą* być [*funkcjami
obliczalnymi*](https://pl.wikipedia.org/wiki/Funkcja_obliczalna).

Tak się dobrze dla nas składa, że teoria typów jest *ogólną teorią funkcji obliczalnych*, jednak
teoria typów jako taka *nie* jest jeszcze równoważna teorii Pearla, ponieważ w teorii typów *nie ma
[operacji przypisania](https://pl.wikipedia.org/wiki/Przypisanie)*, to jest operacji, która może
zmienić wartość takiej zmiennej, która *nie pełni tylko roli zaimka* i zamiast tego jest czymś w
rodzaju (nazwanego miejsca w) *pamięci*. Wystarczy jednak *dodać* do teorii typów operację
przypisania, żeby natychmiast uzyskać ogólną teorię przyczynowości, która będzie wtedy jeszcze co
prawda pozbawiona części stochastycznej albo probabilistycznej, ale ta część jest
["przyklejona"](https://mitpress.mit.edu/9780262045322/a-logical-theory-of-causality/) do rachunków
interwencyjnego i kontrfaktycznego *tylko* ze względów *praktycznych*. Mówię tam zresztą również o
Zewnętrznym Agencie albo Zewnętrznym Podmiocie (i wielu innych sprawach, do których spróbuję Cię
stopniowo przygotować).

<hr>

Wracając do diagramu.

Przydadzą nam się jeszcze słowa `Zrodlo` i `Cel`. Jeżeli `s : Strzalka` (na Twoim rysunku akurat
`f : Strzalka` i `g : Strzalka`, ale chcę podkreślić, że ta reguła obowiązuje ogólnie), to term
`Zrodlo s` będzie oznaczał odtąd (zauważyłaś, że to jest pół-formalna *definicja*?) `Punkt`, z
którego wychodzi `s`, a term `Cel s` będzie oznaczał `Punkt`, do którego wchodzi `s`.

Przyjmiemy teraz ważną *regułę* dotyczącą *strzałek*: Zawsze gdy mamy takie `f : Strzalka` i `g :
Strzalka`, że `Skladalne f g`, musimy *dorysować* (na razie *anonimową*) strzałkę, albo przynajmniej
*przyjąć, że istnieje* strzałka, której `Zrodlo` to `Zrodlo f` i której `Cel` to `Cel g`. Czyli w
przypadku tego rysunku to byłaby pewna narysowana ukośnie `Strzalka A C`. Ale w tej chwili jeszcze
nie będziemy jej rysować. Można to zapamiętać tak: *Każdą dwustrzałkową drogę* (którą będziemy
nazywać *ścieżką*) *można przejść w jakiś sposób na skróty, a więc jednostrzałkowo*.

`Skladalne` oznacza więc tylko, a właściwie będzie niebawem oznaczało (a dokładniej implikowało po
wprowadzeniu odpowiedniego aksjomatu), że da się zawsze zrobić taką (unikalną) strzałkę. Ogólne
konsekwencje niektórych jeszcze nie wprowadzonych aksjomat*ów* (liczba mnoga) dotyczących operacji
składania strzałek można zapamiętać w ten sposób: *Dla każdej skierowanej ścieżki* (a więc nie tylko
dla ścieżek skierowanych *dwustrzałkowych*) *istnieje unikalna jednostrzałkowa "ścieżka na skróty",
równa złożeniu wszystkich strzałek należących do tej ścieżki* (czyli strzałka, której `Zrodlo` jest
początkiem tej skierowanej ścieżki, a `Cel` jest jej końcem). Jeżeli to w tym momencie za dużo
informacji na raz, nie przejmuj się, nawet bez wykonywania żadnych zadań, dzięki nieuchronnym
zmianom reprezentacji pamięciowych tych pojęć dojdziesz do momentu, w którym z łatwością będziesz
konstruowała i przekształcała proste przykłady takich struktur "w głowie".

Żeby zwiększyć szanse, że przypomnisz sobie o tej ważnej własności gdy to pojęcie okaże się później
potrzebne, poproszę Cię teraz o narysowanie, po prawej od *diagramu* który już zaczęłaś rysować
pewien inny diagram z *komentarzem* (to cały czas *niejawna*, a więc też *nieformalna definicja*
stałej *diagram*, zauważyłaś?).

6. Narysuj, po prawej od diagramu ze `Strzalka`-mi `f` i `g`, dwie poziome `Strzalka` oznaczone z
   góry literami `i` i `j`, tworzące *ścieżkę skierowaną* zaczynającą się w `Punkt X`, przebiegającą
   przez `Punkt Y` i kończącą się na `Punkt Z`.
   
Powiedziałem to tym razem trochę inaczej, ale wiesz, o co mi chodzi, prawda? Na tym nowym diagramie
powinny być dwie poziome strzałki, `i` i `j`, takie, że `Zrodlo i` to `Punkt X`, `Cel i` to `Punkt
Y`, a `Zrodlo j` to `Punkt Y` i `Cel j` to `Punkt Z`.

7. Ponieważ komentarze nie są częściami diagramów, otocz ten diagram prostokątem i napisz pod nim:
   *Takie pary strzałek są składalne. Zawsze, gdy mówimy o składalności strzałek, ważna jest*
   **kolejność** *w jakiej wymieniamy strzałki. W tym przypadku możemy powiedzieć, że składalne są
   strzałki `i` i `j`, ale* **nie** *możemy powiedzieć, że składalne są strzałki `j` i `i`, bo*
   **nie wiemy**, *czy `Cel j` to `Zrodlo i`* (niedługo wyjaśnię jeszcze raz o co chodzi z tym "nie
   wiemy").

Teraz, gdy mam nadzieję będziesz mogła trochę swobodniej operować pojęciem składalności, możemy
wrócić do pierwszego diagramu.

8. Narysuj `Strzalka`, której `Zrodlo` to `Zrodlo f` i której `Cel` to `Cel g`. Oznacz tą strzałkę
   zapisując po zewnętrznej stronie trójkąta, który w ten sposób powstał, literę `h`.
   
Zanim oznaczyłaś ją literą `h`, ta `Strzalka` była anonimowa, ale już nie jest, bo właśnie nadałaś
jej nazwę, a więc dorysowanie litery `h` było tutaj *zdefiniowaniam stałej `h`*. Byłbym zapomniał, a
to jest przecież ważne - wróćmy na chwilę do drugiego diagramu.

9. Pod zapisanym już komentarzem dodaj jeszcze ten: **Trudne (więc wymaga czasu), ale ważne**:
   *Rysunek* **sugeruje** *tutaj, że `X`, `Y` i `Z` to* **różne** *punkty i że `i` i `j` to*
   **różne** *strzałki i to faktycznie* **są** *różne punkty i strzałki* **na tym rysunku**, *ale to
   nie jest kod Leana, tylko pewne* **formalne reprezentacje** *i te punkty i strzałki nie muszą*
   **oznaczać** *różnych obiektów* (odpowiedniego typu). *Punkty `X`, `Y` i `Z` pełnią tu więc role
   abstrakcyjnych reprezentacji czegoś, co spełnia pewne wymagania* (jak się okaże, będą to
   wymagania kategorii), *to są więc takie* **rysunkowe zmienne**, *i tak samo rysunkowymi zmiennymi
   są wszystkie strzałki* (chyba, że z jakiś powodów przyjmiemy określone *definicje* tych symboli i
   staną się przez to *stałymi*).

W punkcie *9* nie mówimy nic zaskakującego, bo przecież tak "działa" każdy fragment prozy
matematycznej w którym występują zmienne, a to też jest jakaś proza matematyczna, tyle, że częściowo
rysunkowa. Z drugiej strony, patrząc w ten sposób na prozę matematyczną musimy pogodzić się z tym,
że używając jej konsekwentnie do myślania o czymś *stajemy się funkcją, która patrzy na* (jakiś)
*świat przez pryzmat zmiennych/parametrów/wejść spełniająych określone wymagania*. Teraz możemy
wrócić do pierwszego diagramu.

10. Narysuj proszę, omijając z zewnątrz łukiem literę `h`, taką `i : Strzalka`, że `Rownolegle h i`
    i nadaj jej imię zapisując po zewnętrznej stronie literę `i`.

Przypuszczam, że od razu domyśliłaś się, o co mi chodzi, ale na wszelki wypadek wyjaśniam. Odtąd
czasem przyda nam się term `Rownolegle`: Jeżeli `i : Strzalka` i `j : Strzalka` i jednocześnie
`Zrodlo i` to `Zrodlo j`, a `Cel i` to `Cel j`, czyli jeżeli (różne *jako strzałki*) `i : Strzalka`
i `j : Strzalka` mają to samo `Zrodlo` i ten sam `Cel`, to `Rownolegle i j`.

Myślę, że od razu widzisz, że `h` i `i` są nie tylko równoległe, ale również, że zarówno `h` jak i
`i` *z osobna* są w taki sam, ważny dla nas odtąd sposób związane z *parą strzałek* `f` i
`g`. Zarówno `h` jak i `i` są brakującymi bokami trójkąta o bokach `f : Strzalka` i `g : Strzalka`
*i jednocześnie* (to też jest w tym wypadku ważne) zachodzi między nimi coś w rodzaju *uogólnionej*
`Rownoleglosc`-i, bo (dwustrzałkowa) *ścieżka* `(f,g)` i *jednostrzałkowe ścieżki* `(h)` i `(i)` są
wszystkie *kierunkowe* (zresztą każda jednostrzałkowa ścieżka jest kierunkowa, bo nie da się zmienić
kierunku robiąc tylko jeden krok) i mają ten sam *początek* i *koniec*, jak dwie (niekoniecznie
różne \{zacząłem teraz nagle mówić o potencjalnym *znaczeniu* tych symboli\}) jednokierunkowe ulice,
którymi możemy wyjechać z tego samego miejsca i dojechać do tego samego miejsca.

To ostatnie zdanie jest dosyć perfidne, więc nie przejmuj się, jeżeli jeszcze Ci się dobrze nie
"przykleja". Spokojna [tafla tego oceanu](https://ncatlab.org/nlab/show/The+Rising+Sea) będzie się i
tak powoli unosić, aż w końcu, niemal bez użycia siły, [rozłupiemy razem ten twardy orzech do
zgryzienia](https://people.math.harvard.edu/~knill/teaching/math22b2019/handouts/lecture15.pdf);-
musimy tylko poczekać, żeby się trochę namoczył ;-)

Zwracam uwagę na wprowadzony niejawnie w ostatnim akapicie sposób oznaczania ścieżek (`(f,g)`, `(h)`
i `(i)`) i terminy techniczne (czyli \{tutaj niejawnie\} zdefiniowane stałe) *początek* i *koniec*
(ścieżki). Terminologia: *Strzałki*, takie jak tutaj `f` i `h`, mają *źródła* i *cele*; *ścieżki*
mają *początki* i *końce*. Definicje: *Ścieżka* to *skończony ciąg strzałek*. Ścieżka *skierowana*
albo *kierunkowa* to taka, że każda strzałka, która nie jest pierwsza na ścieżce, wychodzi z celu
poprzedniej. *Początkiem* (każdej) ścieżki jest źródło pierwszej strzałki, a *końcem* jest cel
ostatniej strzałki.

Przyda nam się również (wymyślony przeze mnie do pewnych celów) term `Kompatybilne`, który będzie
dotyczył *trzech* strzałek. Jeżeli `f : Strzalka`, `g : Strzalka` i `h : Strzalka`, to jeżeli
`Skladalne f g` i `Zrodlo h` to `Zrodlo f`, a `Cel h` to `Cel g`, tak jak na pierwszym diagramie, to
`Kompatybilne f g h`. Na Twoim rysunku taką relację spełniają więc dwie trójki, bo jest jednocześnie
prawdą, że `Kompatybilne f g h` i `Kompatybilne f g i`. Zdanie `Kompatybilne a b c`, gdzie `a`, `b`
i `c` to strzałki, mówi więc, że strzałka `c` *mogłaby* być złożeniem `a` i `b`, bo spełnia
podstawowe wymagania dla bycia ich złożeniem, dotyczące źródeł i celów.

Wprowadzimy teraz pewne *działanie na strzałkach*, czyli operację podobną na przykład do dodawania
albo do mnożenia, ale ta operacja nie będzie dotyczyła liczb, tylko właśnie strzałek. Będziemy ją
*zapisywać* tak, jak znaną Ci już *aplikację*, tylko czasami w odrwotnej kolejności (m.in. kiedy
będziemy używać stałej `Zlozenie`), a czasami tak, jak zapisujemy aplikacje w Leanie (kiedy będziemy
używać notacji wzrostkowej, czyli infiksowej, którą sobie zresztą jeszcze później uprościmy \{nie
warto tych uwag o notacji próbować już zapamiętywać, tylko to sygnalizuję\}).

Jeżeli `f : Strzalka` i `g : Strzalka` i `Skladalne f g`, tak jak na *naszym* diagramie, to
przyjmujemy aksjomatycznie, czyli po prostu tak się umawiamy, że istnieje unikalne `Zlozenie f g :
Strzalka`, tak jak na przykład dla każdych dwóch liczb naturalnych `n` i `m` istnieje unikalna suma
`n + m`, a dokładniej unikalna liczba naturalna równa `n + m`. Działanie nazywa się tutaj
`Zlozenie`-m i stwierdziliśmy właśnie o tym działaniu, że złożenie dwóch składalnych strzałek `f` i
`g` (w tej kolejności) jest również `Strzalka`, analogicznie do tego, że suma albo iloczyn dwóch
liczb jest również liczbą. Nasza operacja `Zlozenie` różni się jednak od dodawania czy mnożenia w
ten ważny sposób, że tamte operacje mają sens dla *każdej* (uporządkowanej) pary liczb, a `Zlozenie`
ma sens *tylko* dla tych (uporządkowanych) par strzałek, które są `Skladalne`. Można więc powiedzieć
(nieformalnie), że `Zlozenie` jest działaniem (potencjalnie, bo nie zawsze) *wybrednym*.

Umówiliśmy się więc, że gdy `Skladalne f g`, to *musi istnieć* `Strzalka`, która jest *unikalnym*
`Zlozenie f g`, w tej kolejności. Mamy teraz na diagramie do wyboru dwie strzałki, `h` i
`i`. Wybierzemy `h`, bez żadnego powodu, i wobec tego proszę Cię jeszcze, żebyś wewnątrz
diagramu-trójkąta o bokach `f`, `g` i `h` zapisała symbol `✓`, który po polsku nazywamy
[*fajką*](https://pl.wikipedia.org/wiki/Fajka_(znak_wyboru)), *ptaszkiem*, *haczykiem* lub
*parafką*. Na cześć [Rachlina](https://en.wikipedia.org/wiki/Howard_Rachlin) i
[Valéry'ego](https://pl.wikipedia.org/wiki/Paul_Val%C3%A9ry) postanowiłem nazywać ten symbol
[*ptaszkiem*](https://www.goodreads.com/quotes/97619-one-should-be-light-like-a-bird-and-not-like).

Będziemy odtąd rozumieć, że *diagram*, wewnątrz którego znajduje się ptaszek, jest (z założenia,
albo z jakiegoś powodu, wszystko jedno, po prostu jest) *przemienny*, inaczej *komutuje*. Wydaje mi
się, że w tym momencie najlepiej objaśnić to pojęcie skupiając się tylko na naszym diagramie. *Od
momentu, kiedy zaznaczyłaś ptaszka*, z Twojego rysunku możemy wywnioskować, że `Zlozenie f g` *jest
tym samym (czymś) co* `h`. *Gdybyś* dodała jeszcze *ptaszka* między `i` i `h` (ale proszę nie rób
tego, chyba, że nie możesz się powstrzymać), znaczyłoby to, że `i` jest tym samym (czymś) co `h`, a
skoro `h` już jest (na mocy naszej decyzji) tym samym czymś, co `Zlozenie f g`, to obecność tego
drugiego ptaszka oznaczałaby również, że `i` jest tym samym (czymś), co `Zlozenie f g`. No dobrze,
może dam sobie na razie spokój z tą zabawą w pół-sformalizowany pół-dialog.

Dużo tego było, ale można to wszystko podsumować dosyć krótko mówiąc, że rozważamy teraz *świat z
samych strzałek i punktów, które zawsze* (o tym jeszcze nie mówiłem) *są źródłami albo celami jakiś
strzałek*. Czyli w naszym świecie *nie ma* punktów które nie są w ogóle "strzałkowe". A nie ma w tym
świecie żadnych punktów, które nie są ani źródłem ani celem żadnej strzałki, bo *jedyne*, do czego w
tej teorii służą punkty, to *ograniczanie operacji składania*. A więc te punkty są *tylko* po to,
żeby można było elastycznie określać sposób, w jaki dokładnie operacja składania jest wybredna (w
różnych sytuacjach). Czyli w tym świecie (albo języku) *punkty pełnią tylko rolę punktów zaczepienia
strzałek*. 

## Równość (Wolność i Braterstwo)

Do tej pory w ogóle nie *używaliśmy* w Leanie relacji równości, bo ta, gdy pisaliśmy w Leanie,
pojawiała się tylko jako treść twiedzenia o przemienności dodawania liczb naturalnych, a tego
twierdzenia nie używaliśmy w Leanie do niczego. Jak już wiesz, w matematyce ta relacja oznacza
*nierozróżnialność z danego punktu widzenia*. W *praktyce* to znaczy *tylko* tyle, że obiekty albo
termy, które są (albo z założenia albo na mocy jakiegoś dowodu) równe, mogą się nawzajem
*zastępować* w każdym (poprawnym) wyrażeniu (danego języka), nie zmieniając ani sensu albo treści,
ani - jeżeli to wyrażenie jest zdaniem - statusu logicznego tego wyrażenia (to jest jego
prawdziwości lub fałszywości). A mówiąc możliwie najkrócej:

*To, co jest równe, jest zastępowalne wszędzie tam, gdzie może się pojawić*.

Będziesz miała teraz okazję *doświadczyć* tej *jedynej roli* założeń o równości, konstruując proste
dowody *rachunkowe*. Zamiast znowu definiować twierdzenia i wymyślać dla nich nazwy, skonstruujemy
*dowód anonimowy*, używając do tego celu słowa kluczowego `example`, które działa podobnie jak
`theorem`, ale nie służy do definiowania nowych stałych. Będziemy też korzystać z trzech, bliżej
nieokreślonych liczb naturalnych, `a`, `b` i `c`, o których założymy, że `a = b` i `b = c`, i o
których udowodnimy, że `a = c`. W zwykłej książce do matematyki taki dowód mógłby wyglądać tak ...

$a = b = c$

... i to byłby w zasadzie pełnowartościowy dowód, ponieważ wiemy, że relacja równości jest
przechodnia, a więc w tym zwięźle zapisanym "podwójnym" równaniu mamy wszystkie informacje potrzebne
do tego, żeby *samodzielnie* stwierdzić, że $a = c$. Jakiś bardziej pedantyczny autor mógłby napisać
też tak ...

```math
\begin{aligned}
    &a = b \\
    &b = c \\
    &a = c \text{przechodniość}
\end{aligned}

```
$$a = b$$ (1)  
$b = c$ (2)  
$a = c$ przechodniość

... albo tak ...

Jeżeli (1) $a = b$ i (2) $b = c$, to:

$a = b$ (1)  
$\ = c$ (2)  
$a = c$ przechodniość równości (1) (2)

... albo jeszcze jakoś inaczej. Ponieważ w Leanie możliwości posługiwania się (tutaj akurat
pół-formalnymi) *skrótami myślowymi* są ograniczone, *my* musimy napisać trochę więcej:

```lean
-- Niech a, b i c będą jakimiś liczbami naturalnymi ...
variable (a b c : Nat)

-- ... o których zakładamy, że:
variable (h1 : a = b)
variable (h2 : b = c)

-- Wtedy a = c:
example : a = c :=
    -- Konstruowanie *dowodu rachunkowego* rozpoczynamy za pomocą słowa kluczowego *calc*,
    -- które jest skrótem od angielskiego *calculational*:
    calc
        a = b := h1
        _ = c := h2
```

Zwracam uwagę, że *każda linia* dowodu rachunkowego wymaga *osobnego dowodu* (podanego za symbolem
definiowania `:=`) i że możemy uprościć zapis korzystając z symbolu podkreślenia `_` i od pewnego
momentu podawać jawnie tylko prawe strony równań, tak jak tutaj podajemy tylko `c` w ostatnim
równaniu. Leanowi to wystarczy, bo gdy tylko "zauważy", że zaczynając od `a` z lewej doszliśmy do
`c` z prawej, udowadniając każde równanie po drodze, to natychmiast "stwierdzi", że `a = c`,
automatycznie stosując własność przechodniości relacji równości, co zakończy dowód. Gdy stosujemy w
taki sposób jak wyżej znak `_`, Lean sam to sobie uzupełnia prawą stroną równania, które znajduje
się w linii powyżej tego znaku.

**Sugestia**: Dokończ ten dowód rachunkowy, posługując się poprzednim dowodem jako przykładem. Twój
dowód będzie wyglądał podobnie, ale będzie miał o jedną linię więcej i ta dodatkowa linia będzie
wymagała zastosowania hipotezy, której nie było w poprzednim dowodzie.

```lean
variable (a b c d : Nat)
variable (h1 : a = b)
variable (h2 : b = c)
variable (h2 : c = d)

example : a = d :=
    calc
```

Teraz zrobimy jeszcze dowód tego samego zdania co poprzednio, korzystając z tych samych założeń, ale
użyjemy *taktyki* `rw`. To skrót od angielskiego `rewrite`, czyli *przepisz*, co dla nas będzie
znaczyło raczej *zastąp*, bo wolę w ten sposób ostatnio myśleć o równości. Taktyka `rw` jest dosyć
elastyczna i pozwala na różnego rodzaju operacje, polegające na zastępowaniu wyrażeń przez równe
(czyli wzajemnie zastępowalne) wyrażenia, ale tym razem nie będziemy korzystać z tych bardziej
skomplikowanych wariantów.

Instrukja `rw [nazwa_dowodu_rownosci]`, gdzie `nazwa_dowodu_rownosci` to jakaś globalna stała lub
zmienna występująca w kontekście, będąca, cóż, nazwą dowodu jakiejś równości, o postaci
`nazwa_dowodu_rownosci : lewe_wyrazenie = prawe_wyrazenie`, powoduje *zmianę celu*, polegającą na
tym, że `lewe_wyrazenie` występujące *w celu* jest zastępowane przez `prawe_wyrazenie`. W tym
przypadku będziesz mieć do wyboru w kontekście (a nie globalnie, bo `variable` tak naprawdę dodaje
zmienne do kontekstu) tylko dwie hipotezy o postaci równości, to jest `h1` i `h2`, więc szybko
znajdziesz rozwiązanie. Po zastosowaniu taktyki `rw` z odpowiednim argumentem w nawiasach
kwadratowych trzeba będzie jeszcze zastosować taktykę `exact`, oczywiście też z odpowiednim
argumentem, ale ten znajdziesz już wtedy bez żadnego problemu. Zwróć proszę uwagę, że będziesz
(znowu!) konstuować dowód jakby "od tyłu", albo od końca, *przekształcając cel* tak, żeby *zbliżył
się do czegoś, co już masz udowodnione albo założone* (tutaj akurat co masz w kontekście).

**Sugestia**: Dokończ ten dowód w trybie interaktywnym używając najpierw (raz) taktyki `rw`, a potem
(raz) taktyki `exact`.

```lean
-- Jeżeli deklaracje tych zmiennych są już u Ciebie wklejone do Leana, to nie kopiuj tego
-- fragmentu.
variable (a b c : Nat)
variable (h1 : a = b)
variable (h2 : b = c)

example : a = c := by
```

Taktykę `rw` można stosować również do *przekształcania założeń*, albo *w drugą stronę*, to jest
zastępując `prawe_wyrazenie` przez `lewe_wyrazenie`, i można też kontrolować, które występienie
lewego lub prawego wyrażenia ma być zastąpione, gdy to wyrażenie występuje więcej niż raz. Ale o tym
porozmawiamy kiedy indziej.

Został nam jeszcze jeden ważny sposób skonstruowania tego samego dowodu. Ten dowód nie będzie
*wyglądał* tak samo, ale dla Leana wszystkie dowody tego samego zdania są *takie same*, to jest
wzajemnie zastępowalne, bo w Leanie obowiązuje zasada nieważności (struktury) dowodu, która nazywa
się po angielsku *proof irrelevance* (i o której już wspominałem więcej niż raz, ale przecież
[repetitio est mater studiorum](https://en.wikipedia.org/wiki/List_of_Latin_phrases_(R))).

Skorzystamy teraz ze stałej `Eq.trans`, która oznacza dowód *przechodniości* równości (*trans* to
skrót od angielskiego słowa *transitivity*, oznaczającego właśnie przechodniość), czyli dowód, dla
dowolnych termów `X`, `Y` i `Z` *tego samego typu*, że jeżeli `X = Y`, to jeżeli `Y = Z`, to `X =
Z`. Od tej zasady zaczęliśmy naszą naukę matematyki w rozdziale czwartym, pamiętasz?

Upraszczając, można by powiedzieć, że stała `Eq.trans` ma typ `(h1 : X = Y) → (h2 : Y = Z) → (X =
Z)`, czyli, że z dowodów zdań `X = Y` i `Y = Z` tworzy dowód zdania `X = Z`. Zauważyłaś, czemu to
jest uproszczenie? Przecież *brakuje tutaj informacji*, jakiego typu termami są `X`, `Y` i `Z`. W
tym wypadku nie musimy jednak podawać tego typu jawnie, ponieważ ...

```lean
-- ... definicja Eq.trans korzysta z tak zwanych parametrów domyślnych albo niejawnych, które
-- poznajemy po tym, że są otoczone nawiasami klamrowymi. Lean sam wywnioskowuje, jakie powinny
-- być wartości takich parametrów (o ile tylko może to wywnioskować).
--
-- Jak widać poniżej, żeby uzyskać dowód, jawnie trzeba podać tylko dwie hipotezy. Uwaga - to
-- *nie* muszą być hipotezy a = b i b = c, bo *tutaj* a, b i c to *parametry*. To mogą więc być
-- dowody jakichkolwiek dwóch równości takich, że prawa strona pierwszej równości jest równa
-- (tak wiem) lewej stronie drugiej. Nie przejmuj się tym, że typ tej stałej jest taki skomplikowany;
-- do wszystkiego, co będzie nam potrzebne, dojdziemy w swoim, a raczej (mam nadzieję) w naszym tempie.
#check Eq.trans -- Eq.trans.{u} {α : Sort u} {a b c : α} (h₁ : a = b) (h₂ : b = c) : a = c
```

**Sugestia**: Zakończ ten dowód używając twierdzenia o przechodniości relacji równości.

```lean
-- Zakładam tutaj, że masz wklejone do Leana wszystkie (wcześniejsze) deklaracje, które są potrzebne,
-- żeby Lean "wiedział", o czym mówimy.
example : a = c :=
    -- W linii poniżej wpisz Eq.tr, tylko tyle, a potem wybierz z listy możliwych kontynuacji Eq.trans.
    -- Jako argumenty podaj dwie hipotezy, które powinnaś mieć w kontekście i które pozwolą Ci zakończyć 
    -- dowód.
```

### Przypisy

[^1]: A dokładniej zwierzętami, które raczej <br><div align="center"><b>∘</b></div><br> <div
    align="center"><a
    href="https://pl.wikipedia.org/wiki/Zag%C5%82ada_%C5%BByd%C3%B3w">nie</a></div><br><div
    align="center"><a
    href="https://pl.wikipedia.org/wiki/Globalne_ocieplenie">mają</a></div><br><div
    align="center"><a href="https://en.wikipedia.org/wiki/Catholic_Church_sexual_abuse_cases">
    prawa</a></div><br><div align="center"><a
    href="https://en.wikipedia.org/wiki/Why_Most_Published_Research_Findings_Are_False">twierdzić</a></div><br><div
    align="center"><a href="https://en.wikipedia.org/wiki/Crusades">że</a></div><br><div
    align="center"><a
    href="https://www.npr.org/2022/12/08/1141601301/the-myth-of-plastic-recycling">są</a></div><br><div
    align="center"><a href="https://en.wikipedia.org/wiki/Donald_Trump">lepsze</a></div><br> <div
    align="center"><b>∘</b></div><br> [od](https://en.wikipedia.org/wiki/Gun_control) [Wspaniałych
    Małp](https://en.wikipedia.org/wiki/Simian)

[^3]: To zdanie też na zawsze zmieniło kiedyś "moje" życie, niemal natychmiast po tym, jak je
    przeczytałem. Może i "Tobie" się do czegoś przyda.
