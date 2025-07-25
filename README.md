<div align="right"><em>Wszystko, co można zrozumieć, da się powiedzieć jasno.<br/>Wszystko, co da
się powiedzieć jasno, można zapisać w języku <a
href="https://en.wikipedia.org/wiki/Type_theory">teorii typów</a>.<br/> A wszystko, co zostało
zapisane w języku teorii typów, można sprawdzić za pomocą algorytmu i zredukować do unikalnej
najprostszej możliwej postaci.</em></div>

<br/>
<br/>
<br/>

**Aktualności**: 2025.07.24 Skończyłem pisać wstępną wersję [rozdziału o
listach](./rozdzialy/R32_zaraz_bedzie_tylko_jeszcze_listy.md). Można się z niego dowiedzieć trochę o
listach, ale przede wszystkim próbowałem się w nim zastanowić nad rozmaitymi rolami wszelkiego
rodzaju list w myśleniu i w życiu.

Zapraszam do testowania, *zgłaszania trudności* i w ogóle jakichkolwiek spostrzeżeń lub uwag,
zwłaszcza tych *krytycznych*.

**Historia zmian** jest [tu](Historia_zmian.md), a **spis treści** jest [tam](#spis_tresci).

<hr>

## Przedmowa

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
stopnia jest - wynikiem *współpracy*. Jeżeli więc tylko interesuje Cię, co mam tu do powiedzenia i
chcesz to zrozumieć, to masz szansę pomóc sobie i innym do Ciebie podobnym odbiorcom *rozmawiając ze
mną*; w ten sposób możesz stać się w jakimś stopniu współautorką albo współautorem. W stwierdzeniu,
że "dzieła" tworzą ludzie, liczba mnoga
jest przecież konieczna.  
(Tylko proszę, nie pisz wtedy o błędach ortograficznych czy innych tego rodzaju drobiazgach, chyba,
że pojawiły się na głównej stronie. Mam lekką dysgrafię, ale w tym momencie to już nie ma większego
znaczenia.)

**Po co studenci psychologii albo psychologowie akademiccy mieliby się uczyć matematyki?** Żeby
lepiej sobie radzić z abstrakcyjnym i logicznym myśleniem, bo ...

<hr>

... **matematyka to żywa, w przeciwieństwie do psychologii stale gwałtownie rozwijająca się
dyscyplina**, *w której nie chodzi tylko, a nawet przede wszystkim, o liczby, obiekty geometryczne i
rozwiązywanie zadań rachunkowych, tylko o* **konsekwentne i twórcze myślenie na wiele różnych
sposobów o czym tylko się chce** *(a czasem nie chce)*.

<hr>

Może więc dzięki bliższemu kontaktowi z tą niezwykłą dyscypliną studenci psychologii i psychologowie
akademiccy mogliby nauczyć się pisać mniej głupot i czytać z większym zrozumieniem pełną głupot
literaturę naukową? Albo po to, żeby używać na przykład wnioskowania statystycznego czy
przyczynowego *wiedząc dlaczego* używa się go w taki a nie inny sposób, czyli postępując jak na
naukowca przystało, zamiast bezmyślnie i często popełniając szkolne błędy robić coś, bo "tak się
robi", całkowicie opierając się na domniemanym autorytecie zajętego zdobywaniem grantów i
przepychaniem publikacji akademickiego stada. Wreszcie po to, żeby doświadczać dzięki temu głębokich
wglądów, satysfakcji ostatecznego rozwiązania problemu, kontroli i mocy wynikających z opanowywania
nowych sposobów myślenia, i piękna.

**Dlaczego studenci psychologii albo psychologowie akademiccy mieliby zaczynać naukę podstaw
matematyki akurat od teorii typów i teorii kategorii?** Po pierwsze dlatego, że to jest w ogóle
możliwe, a jest możliwe, bo opanowanie podstaw tych teorii nie wymaga żadnych prerekwizytów i
jednocześnie każda z tych teorii dostarcza podstaw dla całej matematyki. Mówiąc dokładniej, "za",
albo "przed", albo "pod" teorią kategorii jest już tylko (działająca intuicyjnie) logika, a teoria
typów jest językiem całkowicie samowystarczalnym. A po drugie dlatego, że w pewnym sensie *ludzie
myślą w teorii typów i teorii kategorii*. Teoria typów to pewna bardzo ekspresyjna i uniwersalnie
ważna *logika*, a więc zmechanizowane *rozumowanie*, i *programowanie*, a więc pewien *dialog*,
chociaż w tym przypadku z komputerem, *w jednym*. Teoria kategorii to z kolei przede wszystkim
teoria dopasowania między różnymi sposobami opisu, albo uniwersalne narzędzie konsekwentnego i
elastycznego operowania różnymi punktami widzenia na to samo.

**O formie żeńskiej**: Jak można się dowiedzieć z rozdziału pierwszego, na początku pisałem używając
form mieszanych w rodzaju mógłbyś/mogłabyś, ale to się szybko stało uciążliwe i nie sprzyjało
czytelności, dlatego pomyślałem sobie, że skoro zdecydowana większość studentów psychologii to
studentki, a nie studenci, będę się zwracał do czytelniczki. Miałem jednak w związku z tym długo
wątpliwości, bo pojawia się z tego powodu problem odpowiedniego *tonu*. Dlatego na wypadek, gdyby
zdarzało mi się sprawiać niewłaściwe wrażenie, wyjaśniam: Sam chciałbym, żeby ktoś pisał do mnie w
ten sposób (i o takich sprawach), kiedy jeszcze byłem studentem, tylko wtedy oczywiście
odpowiadałaby mi pewnie bardziej forma męska, chociaż forma żeńska też by mi nie przeszkadzała (i
zdaje się zresztą, o dziwo, że nie przeszkadza czytelnikom). A poza tym piszę również w pewnym
sensie do obecnej i (przede wszystkim) przyszłej psychologii, która jest przecież (abstrakcyjną, ale
jednak) Kobietą.

**O (czasem nad)używaniu pisma pochyłego**: Może porównaj, jak Ci się czyta te dwa fragmenty (które
napisałem w
stylu celowo nieludzkim!):  

... ponadto każdy kategoryjny produkt odpowiada unikalnemu izomorfizmowi między następującymi dwoma obiektami ...  

... ponadto każdy kategoryjny produkt odpowiada *unikalnemu* izomorfizmowi między następującymi dwoma obiektami ...  

Jak myślisz, czy bez prób oznaczenia w ten sposób *intonacji* (bo to, a nie uzyskanie
protekcjonalnego tonu, jest wtedy moim celem), byłoby Ci łatwiej, czy trudniej, czy tak samo łatwo
odgadnąć, na które ze słów składających się na to zdanie warto moim zdaniem w danym kontekście
zwrócić szczególną uwagę?

**O powtarzaniu się**: Nie da się ukryć, powtarzam się w tej książce, a niektóre rzeczy powtarzam
nawet *wiele* razy. I nie zamierzam nikogo za to przepraszać. Jeżeli [powtarzanie jest matką
wiedzy](https://pl.wiktionary.org/wiki/repetitio_est_mater_studiorum) (i rozumienia), to powtarzanie
*się* jest jej (i jego) ojcem. Dla kogoś, komu nie są już potrzebne, takie wymuszone powtórki będą
pewnie co najwyżej trochę irytujące; dla kogoś, kto ich potrzebuje, ich niedobór może być przyczyną
poddania się w wysiłkach zrozumienia o co chodzi.

Znalazłem niedawno tweeta, który idealnie oddaje moje obecne podejście do pisania:

<blockquote class="twitter-tweet"><p lang="en" dir="ltr">my father always told me: “if you want to
go for a run, go for a run, don’t look for company. sooner or later, on your fifth run or your
twentieth, like-minded people will find you themselves.” and only recently have i realized that this
principle works everywhere.</p>&mdash; blue (@bluewmist) <a
href="https://twitter.com/bluewmist/status/1873281405100408867?ref_src=twsrc%5Etfw">29 grudnia
2024</a></blockquote>

I ten cytat, jak podają niektórzy pochodzący od Feynmana, również dobrze tu pasuje:

> If you want to master something, teach it.

Jeżeli więc chcesz się ze mną dokądś przejść, przebiec, dowlec, albo doczłapać i przy okazji
dostawać wiadomości na temat aktualizacji, a czasem może dodać coś od siebie, *wyślij mi proszę
wiadomość*. Dopiszę Cię wtedy do listy adresatów i kto wie, może dzięki temu czegoś się razem
nauczymy.

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
rozwijany [Coq](https://en.wikipedia.org/wiki/Coq_(software)) (albo
[Rocq](https://rocq-prover.org/))?** Teoria typów dlatego, że pozwala sformalizować w pełni i we
względnie naturalny sposób, bo do pewnego stopnia *czytelny dla niespecjalistów*, niemal dowolne
treści o charakterze matematycznym i jest jednocześnie pełnowartościowym ([funkcyjnym i
czystym](https://pl.wikipedia.org/wiki/Programowanie_funkcyjne)) językiem programowania. W dodatku
to nie jest jakiś tam kolejny taki język, tylko taki, którego składnia kształtowała się stopniowo
jako rezultat badań wybitnych matematyków i filozofów zajmujących się podstawami matematyki. Ale
teoria typów także dlatego, że być może najciekawszym i najważniejszym zastosowaniem matematyki w
psychologii *nie* jest moim zdaniem wcale testowanie hipotez statystycznych ani wnioskowanie
przyczynowe. Według mnie *nie* jest nim również formalizacja wyrażonych w języku naturalnym teorii
lub modeli psychologicznych w postaci matematycznych modeli rozmaitych zjawisk. Być może
najważniejszym zastosowaniem matematyki we współczesnej psychologii jest w mojej ocenie
*formalizacja rozumowań*, które psychologowie wyrażają często dosyć nieczytelnie i niejasno w swoich
publikacjach. A teoria typów wyposażona w [typy
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

Trudno mi powiedziec, czy te ostatnie uwagi brzmią dla Ciebie "głęboko" lub "filozoficznie", bo nie
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

<hr>

<a name="spis_tresci"></a>
## Spis treści

[R1 Skąd się ta książka wzięła](./rozdzialy/R01_Skad_sie_ta_ksiazka_wziela.md)  
*Trochę historii, wszystkie osobiste, a poza tym ważne moim zdaniem rady*

[R2 Co można z tą książką zrobić](./rozdzialy/R02_Co_mozna_z_ta_ksiazka_zrobic.md)  
*Oparte na wynikach badań i własnych wieloletnich doświadczeniach rady dotyczące uczenia się w
ogóle, uczenia się matematyki, i samokontroli*

Ten rozdział napisałem głównie z myślą o *psychologach* i omawiam w nim przede wszystkim to, o czym
będę pisał w planowanej *drugiej* części. Obawiam się jednak, że dobre zrozumienie tego, o czym
tutaj piszę, może wymagać pewnych kompetencji filozoficznych i matematycznych. Ale zerknąć zawsze można.  
[R3 Do czego autor zmierza](./rozdzialy/R03_Do_czego_autor_zmierza.md)  
*Jakieś gruszki na jakiejś wierzbie*

A czytając ten rozdział zaczniesz się uczyć (ze mną, chociaż w tym momecie jestem trochę dalej \{ale
wcale nie tak *dużo* dalej\}), w dosyć nietypowy sposób i niemal od zera, podstaw samej *matematyki* .  
[R4 Kilka trywialnych mechanicznych operacji](./rozdzialy/R04_Kilka_trywialnych_mechanicznych_operacji.md)  
*Dwa dowody przeprowadzone łagodnie i krok po kroku, a wokół pełno metarefleksji*

[R5 Pierwszy spacer po Leanie, wersja pierwsza](./rozdzialy/R05_Pierwszy_spacer_po_Leanie_wersja_pierwsza.md)  
*Typowanie, podstawowe rodzaje definicji i ich przykładowe ciała, aplikacja, ewaluacja i currying;
czyli taka jakby - pełna przesiadek w różnych brzydkich i niemodnych miejscach - podróż do Indii*

[R6 Pierwszy spacer po Leanie, wersja druga](./rozdzialy/R06_Pierwszy_spacer_po_Leanie_wersja_druga.md)  
*Prawie to samo co wcześniej, tylko trochę inaczej (i faktycznie nie całkiem to samo)*

[R6,5 = R00](./rozdzialy/R06_i_pol_rowna_sie_R00.md)  
*Uuu ...*

[R7 Być może nie wiesz, że już wiesz, czym jest izomorfizm, a niebawem dowiesz się jeszcze, czym
jest izomorfizm Curry'ego-Howarda](./rozdzialy/R07_Byc_moze_nie_wiesz.md)  
*Kolejny nostalgiczny (?) powrót do szkoły podstawowej*

[R8 Logika na Leanie, pierwsze kroki](./rozdzialy/R08_Logika_na_Lanie_pierwsze_kroki.md)  
*Nowy język i nowy sposób myślenia o logice, matematyce w ogóle, która okazuje się być
programowaniem, programowaniu, które okazuje się być matematyką, i życiu, bo [życie jest
programowaniem](https://youtu.be/3iYQcNa31Rs?si=JvpDM5pITt-K6t-A), chociaż trudno powiedzieć, czy
jest też matematyką*

[R9 Kilka naiwnych obserwacji na temat języków formalnych](./rozdzialy/R09_Kilka_naiwnych_obserwacji.md)  
*Autor sam sobie udziela wywiadu na temat niektórych własnych zainteresowań*

[R10 Implikacja w praktyce dowodzenia](./rozdzialy/R10_Implikacja_w_praktyce_dowodzenia.md)  
*Tytuł brzmi jak zapowiedź samych przyjemności, okazuje się jednak, że jest jeszcze lepiej*

[R11 Modus ponens, obliczenia w dwóch wymiarach i nieważność
dowodu](./rozdzialy/R11_Modus_ponens.md)  
*To może nie być przypadek, że najważniejszy spójnik logiczny zapisujemy za pomocą strzałki*

[R12 Duży kwantyfikator, predykaty, mały fragment *całkowicie* zmyślonego artykułu i dowód na
istnienie Boga Anzelma z Canterbury](./rozdzialy/R12_Duzy_kwantyfikator.md)  
*Formalizacja jest zajęciem inherentnie twórczym i sprzyjającym rozmaitym psotom*

[R13 Duży kwantyfikator, predykaty i implikacja w
zadaniach](./rozdzialy/R13_Duzy_kwantyfikator_w_zadaniach.md)  
*Jak tutaj coś jest "w zadaniach", to znaczy, że będzie dużo pocieszania i może nawet za dużo prób
pomocy*

[R14 Negacja w praktyce dowodzenia](./rozdzialy/R14_Negacja_w_praktyce_dowodzenia.md)  
*Czy da się o tym pisać lepiej? Na pewno. Ale czy da się o tym pisać lepiej do psychologów? Może
nawet tym bardziej*

[R15 Negacja, absurd, fałsz, sprzeczność i eksplozja](./rozdzialy/R15_Negacja_absurd.md)[^1]  
*Kiedy tragicznie zła literatura łączy się w doskonałej harmonii z nieznośną ciężkością niebytu*

[R16 Logika, aksjomaty, fakty empiryczne, wybory, postawy i
wolność](./rozdzialy/R16_Logika_aksjomaty_fakty_wybory.md)  
*Nie po raz pierwszy Autor korzysta z okazji, żeby nawijać o sobie*

[R17 p ∧ q ~ p × q](./rozdzialy/R17_Koniunkcja_jako_para.md)  
*Niewykluczone, że trzeba było tak od razu*

[R18 p ∧ q ~ ∀ r : Prop, (p → q → r) → r](./rozdzialy/R18_Koniunkcja_ze_strzalek.md)  
*Naobiecywał, że wszystko będzie z jakiś strzałek, a potem co? A potem niestety dotrzymał
obietnicy*

[R19 Ἐὰν ταῖς γλώσσαις τῶν ἀνθρώπων λαλῶ καὶ τῶν ἀγγέλων](./rozdzialy/R19_Ean_tais_glossais.md)  
*Łojezu*

[R20 Teoria mnogości w zarysie](./rozdzialy/R20_Teoria_mnogosci_w_zarysie.md)  
*Akurat ten rozdział jest tak wciągający, jak pewien inny rozdział*

[R21 Kilka ważnych rodzajów zbiorów i funkcji](./rozdzialy/R21_Kilka_waznych_rodzajow_zbiorow_i_funkcji.md)  
*Swoją drogą, czy słowo "ważne" nie powinno zawsze występować w okolicy jakiegoś fragmentu mówiącego
ze względu na co to coś, co jest rzekomo ważne, jest rzekomo ważne?*

[R22 X × Y ~ X ← ∘ → Y](./rozdzialy/R22_Wprowadzenie_do_jezyka_teorii_kategorii_1.md)  
*Z pewnych rzeczy żartować nie wypada (zdaniem osób, które są mi pod tym względem całkiem obce)*

[R23 X ← '∘ → Y ≅! X ← ∘' → Y](rozdzialy/R23_Produkty_sa_takie_same.md)  
*Jeżeli dotarłaś aż tutaj, to masz chyba dużo wolnego czasu ...*

[R24 p ∧ q ~ p ← ∘ → q ~ X ← ∘ → Y ~ X → ∘ ← Y ~ p → ∘ ← q ~ p ∨ q](./rozdzialy/R24_Logika_zdan_z_perspektywy_kategoryjnej_1.md)  
*... i niezbyt ekscytujące życie towarzyskie, ...*

[R25 p ∨ q ~ p + q](./rozdzialy/R25_Alternatywa_jako_koprodukt.md)  
*... ale nie oceniam*

[R26 ∃](./rozdzialy/R26_Kwantyfikator_egzystencjalny.md)  
*Nie, to nie jest znak, że musisz iść do
[okulisty](https://pl.wikipedia.org/wiki/Ubikacja_publiczna_w_Kawakawa)*

[R27 Rachunek zdań w zadaniach](./rozdzialy/R27_Rachunek_zdan_w_zadaniach.md)  
*Kolejny festiwal namolnego pocieszania i miękiszoństwa*

[R28 Rachunek predykatów w zadaniach](./rozdzialy/R28_Rachunek_predykatow_w_zadaniach.md)  
*I jeszcze jeden, w dodatku to namolne pocieszanie łączy się, jak w jakimś horrorze o jakimś
psychopacie, z nachalnym utrudnianiem*

[R29 AA](./rozdzialy/R29_AA.md)  
*8/10*

[R30 Μονοειδές](./rozdzialy/R30_Monoeides.md)  
*Bo pretensjonalnie wyglądających tytułów nigdy zbyt wiele*

[R31 Klasy typów służą do pisania i myślenia po ludzku](./rozdzialy/R31_Klasy_typow_sluza_do.md)  
*A jeżeli to nie jest pozwalanie sobie na zbyt wiele, to jutro może [padać
deszcz](https://youtu.be/DksSPZTZES0?si=aJn_pxqNlqV9BsLo)*

[R32 \["zaraz", " ", "będzie", " ", "o", " ", "tych", " ", "klasach", " ", "typów", ", ", "tylko", " ", "jeszcze", " ", "powiem", " ", "coś", " ", "o", " ", "listach"\]](./rozdzialy/R32_zaraz_bedzie_tylko_jeszcze_listy.md)  
*Idąc jakąś drogą piszemy jakieś listy*

Uwaga, plac budowy! Informacje zwrotne jak zawsze mile widziane:

[R33 ⬝⬝⬝ a potem rekordowo i z klasą](./rozdzialy/R33_a_potem_rekordowo_i_z_klasa.md)

[R? Teoria mnogości](./rozdzialy/_Teoria_mnogosci.md)

<hr>

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

Mai Strypling, za cenne meta-refleksje na temat terapii i w ogóle zainteresowanie tematem.

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
w rozdziale drugim wadliwego linku do dostępnej za darmo, znakomitej książki [Sheldona
Axlera](https://en.wikipedia.org/wiki/Sheldon_Axler) [*Linear Algebra Done
Right*](https://linear.axler.net/) (na początek polecam raczej *drugie* wydanie, ale to tylko moja
opinia) i za wskazanie możliwości napisania czegoś lepiej.

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
rozdziale i "w osobie czytelniczej") wprowadzać język teorii kategorii, którą matematycy nazywają
czasem [*abstrakcyjnym nonsensem*](https://en.wikipedia.org/wiki/Abstract_nonsense) (chociaż może
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
niedługo po otrzymaniu wiadomości o tej książce, za bardzo miłe słowa zachęty, które potem padły, za
podzielenie się cennymi refleksjami i za ujawnienie, zresztą nie po raz pierwszy i pewnie nie
ostatni, jak podobnie myślimy o metodologii i o tym, jak się jej (niestety) zwykle niemal wszędzie
uczy psychologów.

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

Mai Jaskółowskiej, za entuzjastyczną reakcję po przeczytaniu rozdziału piątego. Maja stwierdziła, że
czytając ten rozdział nie tylko świetnie się bawiła (to niemal dosłowny cytat!), ale w dodatku
napisała kilka własnych funkcji, co jest chyba najlepszym możliwym wynikiem, na jaki mogłem
liczyć. Dziękuję też Mai za podzielenie się cennymi wątpliwościami, które zainspirowały mnie, żeby
napisać w tym rozdziale trochę więcej na temat różnicy między technicznymi znaczeniami słów
"parametr" i "argument". Całkiem możliwe, że dzięki temu ten fragment będzie łatwiejszy do
zrozumienia dla innych.

I jeszcze raz czternastoletniemu Szymonowi Stryplingowi, który bez większych trudności przeszedł
rozdział 21=15 (teraz R22) i przy okazji znalazł tam jeden niepotrzebny fragment, który został po
poprzedniej wersji pewnego zdania i w dodatku zawierał błąd gramatyczny.

I jeszcze raz Tomkowi Smoleniowi, który zauważył, że w dowodzie łączności składania w rozdziale
21-15 (teraz R22) brakowało słowa kluczowego `example` (i dwukropka po tym słowie). A więc znowu
dopisałem coś, wcześniej tego nie sprawdzając. Pewnie jeszcze mi się to zdarzy. Niedługo potem Tomek
zauważył, że w miejscu, w którym pisałem o tym, że elementy iloczynu kartezjańskiego można utożsamić
z funkcjami z jakiegoś singletona do tego iloczynu, zamiast o pojedynczych funkcjach napisałem o
parach funkcji, w dodatku do iloczynu, a nie do jego członów, co jak sądzę mogło mocno Tomka
zdezorientować. Za to dzięki temu, że zapytał mailowo, czy to nie jest błąd, przekonał się jak
sądzę, że dobrze zrozumiał, o co tam *miało* chodzić, a to jest chyba najlepszy sprawdzian
zrozumienia czegoś.

Ani Bańdurze, za niezwykle cenne, interesujące, przemyślane i szczegółowe uwagi dotyczące moich
całkiem amatorskich dygresji na temat psychoterapii.

I znowu Szymonowi Stryplingowi, który jako pierwszy tester napisał o rozdziale R23=R17 (teraz R24),
w którym to rozdziale na dobre pojawia się zasada dualności w teorii kategorii i w którym ta zasada
jest wykorzystywana żeby wykazać, że zbiór jednoelementowy jest dualny do zbioru pustego, iloczyn
kartezjański zbiorów jest dualny do sumy rozłącznej zbiorów, że dodawanie i mnożenie liczb
naturalnych to właściwie jedna i ta sama operacja, że z relacji dowiedlności w logice można zrobić
cienką kategorię, że wtedy typ `False`, tak jak zbiór pusty, okazuje się być obiektem początkowym, a
typ `True`, tak jak każdy singleton, obiektem końcowym, że koniunkcja, tak jak iloczyn kartezjański,
jest kategoryjnym produktem, że alternatywa, tak jak suma rozłączna zbiorów, jest koproduktem i że
to wszystko jest piękne, niesamowite i przydatne. Przy okazji pojawia się tam pojęcie wolnej
konstrukcji, a konkretnie wolnej kategorii nad grafem i parę innych drobiazgów. Szymon stwierdził,
że ogólnie mówiąc ten rozdział *nie był szczególnie trudny*, a jedynym momentem, który wymagał od
Niego większego skupienia i wytrwałości, była nagła zmiana języka i punktu widzenia na
kategoryjny. No raczej.

Magdzie Zielińskiej, za szczere, przemyślane i inspirujące obserwacje dotyczące praktyki
psychoterapii i za wątpliwości na temat tego, co napisałem na ten temat tutaj. Dzięki tej jakże
statysfakcjonującej wymianie miałem okazję przemyśleć na nowo rozmaite podstawowe kwestie i zdałem
sobie sprawę, jak mógłbym pewne rzeczy napisać jaśniej.

Znowu Tomkowi Smoleniowi, który znalazł błąd polegający na złym kierunku strzałki w kategoryjnej
definicji obiektu końcowego w rozdziale R21=R15 (teraz R22). A potem znalazł błąd we fragmencie,
który nazwałem, nomen omen, potencjalnie dezorientującym. Pojawiła się tam nazwa morfizmu `g`
(równego `⟨π₁',π₂'⟩`), a powinna być nazwa `f` (równego `⟨π₁,π₂⟩`).

Szymonowi Stryplingowi, za cenne informacje na temat tego, jak mu się czytało po dłuższej przerwie
od zaglądania do tej książki rozdział 25-19 (teraz R26), i za znalezienie w tym rozdziale źle
oznaczonego komentarza.

Jakubowi Jędrusiakowi, za wiadomość o problemie z kodowaniem niektórych rozdziałów. Większość plików
była zapisana w stronie kodowej UTF-8, ale niektóre były zapisane w ISO-8859-2; teraz wszystkie są w
UTF-8. Jakub prowadzi bloga okołostatystycznego [nieobliczalne](https://nieobliczalne.pl/), który
wydaje mi się wartościowy i interesujący, a jego repozytorium jest
[tu](https://github.com/jakub-jedrusiak),

Znowu Tomkowi Smoleniowi, za zgłoszenie awarii polegającej na nadmiernej kumulacji nie objaśnionych
dokładnie nowości pod koniec rozdziału o takosamości produktów. Dodałem tam w związku z tym
ostrzeżenie i podjąłem próbę (szczerego) pocieszenia.

Znowu Szymonowi Stryplingowi, za błyskawiczne przeczytanie po powrocie z wakacji wszystkich nowych
rozdziałów i bardzo cenną uwagę na temat trudności wynikających ze zbyt częstego akcentowania
fragmentów tekstu pismem pochyłym. Coś z tym muszę zrobić, bo z intonacją lepiej nie przesadzać, ale
zanim coś z tym zrobię, muszę chyba lepiej zrozumieć, do czego akcentowanie może się w tej książce
przydawać, a do czego nie.

Tomkowi Smoleniowi, za zwrócenie mi uwagi, że gdy po raz pierwszy pojawiło się użycie taktyki `rw` w
lewą stronę (`rw[← ...]`), nie wyjaśniłem, jak to działa. Teraz już wyjaśniam (w komentarzu).

[Informacja chce być wolna.](https://en.wikipedia.org/wiki/Information_wants_to_be_free)

<hr>

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
    poprzednimi i przyszłymi wirtualnymi wersjami ("siebie"). Ale *wyraźnie* i *jasno*, czyli
    formalnie, powiemy to najprawdopodobniej dopiero w drugiej części.
