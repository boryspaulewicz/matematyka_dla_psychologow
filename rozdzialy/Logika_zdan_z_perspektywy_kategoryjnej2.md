Wtedy dla każdych trzech kolejno składalnych strzałek `a'`, `b'` i `c'`, złożenie `(c' b') a'`
będzie odpowiadało złożeniu `a (b c)`, które jest z założenia (że `ℂ` to kategoria) równe złożeniu
`(a b) c`, a złożenie `(a b) c` będzie odpowiadało złożeniu `c' (b' a')` w `ℂ'`, a więc `(c' b') a'
= c' (b' a')`. Łączność składania będzie więc zachowana. Identyczności pozostaną natomiast niemal
tymi samymi identycznościami, bo punkty "zostaną na swoich miejscach", każda endostrzałka po
odwróceniu będzie (niemal, bo to dwie różne kategorie) tą samą strzałką, a każde złożenie postaci `f
Id = f` będzie odpowiadało złożeniu `Id' f' = f'` w `ℂ'` i tak samo dla złożeń o postaci `Id f`.

W przypadku kategorii skończonych można zobaczyć, jak "działa" zasada dualności również w inny
sposób. Zacznijmy od strzałek `a : X → Y`, `b : Y → Z`, `c : Z → V` i `d : X → U`. Ten graf to
jeszcze nie kategoria, bo nie ma tu ani identyczności, ani operacji składania. Tym razem jednak
wygenerujemy wolną kategorię nad tym grafem inaczej.

**Rysunek 3**: `Narysuj` proszę tabelkę, ale taką "niedomkniętą" ani z dołu, ani z
prawej. Zaczynając z góry oznacz z lewej strony kolejne rzędy jako `a`, `b`, `c` i `d` i tak samo
oznacz kolejne kolumny. Każda kratka w tej tabelce będzie złożeniem strzałki o tej samej nazwie co
nazwa rzędu tej kratki ze strzałką o tej samej nazwie co nazwa kolumny tej kratki. Pomijamy więc
tutaj elementy neutralne, bo nie musimy ich oznaczać, bo to są w pewnym sensie tylko punkty (jako
specjalne strzałki).

Na naszym grafie nie ma żadnych endostrzałek, a więc kratki na przekątnej pozostaną puste, bo tylko
endostrzałki mogą się składać same ze sobą. Nie ma też na tym grafie żadnej strzałki kompatybilnej
ze strzałkami `a` i `b`, a więc musimy dodać nową strzałkę w kratce `(a,b)` i nadać jej unikalną
nazwę. Pierwsza niewykorzystana litera alfabetu to `e`, dlatego nazwiemy ją `e`. Możesz od razu
dorysować tą strzałkę do grafu i wyrazić fakt, że `e = b a` za pomocą ptaszka. Strzałka `a` nie jest
składalna ze strzałką `c` ani `d`, a więc kratki `(a,c)` i `(a,d)` pozostaną puste. Strzałka `b`
jest składalna tylko ze strzałką `c` i nie mamy jeszcze strzałki, która mogłaby być tym złożeniem, a
więc nadajemy jej nazwę `f`, zapisujemy ją w kratce `(b,c)` i dorysowujemy ją do grafu, zaznaczając
za pomocą ptaszka, że `f = c b`.

Będzie z tym trochę zabawy i pojawią się kolejne strzałki, których złożenia też trzeba będzie
sprawdzić i być może dodać, ale już wiesz, jak to należy zrobić, prawda? Gdy ta tabelka będzie już
skończona, będziesz mogła uzyskać dualną wersję uzyskanej w ten sposób wolnej kategorii nad grafem
transponując tą tabelkę, to znaczy rysując nową tabelkę taką, że to, co było w oryginalnej tabelce w
kratce `(i,j)`, gdzie `i` i `j` to nazwy jakiś strzałek w oryginalnej kategorii, będzie w tej nowej
tablce w kratce `(j,i)` (albo `(j',i')`). Wtedy będzie też widać jak na dłoni (albo jak na kartce),
że kategoria dualna, chociaż nie musi być całkiem taka sama, jest jednak w pewnym ogólniejszym
sensie taka sama. Gdy kategoria jest skończona, jej dualna wersja to przecież ta sama tabelka, tylko
przetransponowana.

"Dualizowalność" konstrukcji wyrażonych w języku teorii kategorii można również opisać tak: Każda
struktura w kategorii `ℂ` odpowiada swojemu dualnemu odpowiednikowi (mhm) w kategorii `ℂ'` dualnej
do `ℂ` i vice versa. A więc na przykład każdemu punktowi (mówi "się" obiektowi) początkowemu i
każdemu produktowi w `ℂ` odpowiada dokładnie jeden obiekt końcowy i koprodukt w `ℂ'` odpowiednio, i
tak samo dla każdej innej konstrukcji strzałkowo-złożeniowej.

Kategorie występują więc zawsze w (dualnych) parach i zasada dualności dotyczy wszystkich
konstrukcji z obiektów i strzałek i wszystkich konstrukcji opartych na złożeniach, czyli *wszystkich
definicji i zdań w języku teorii kategorii*, w tym również wszystkich (całych) kategorii. A to
znaczy, że definiując *jeden* rodzaj konstrukcji kategoryjnej, automatycznie definiujemy *dwa*
dualne względem siebie rodzaje konstrukcji i udowadniając *jedno* zdanie wyrażone w języku teorii
kategorii automatycznie udowadniamy *dwa* dualne względem siebie zdania.

Ta niezwykła cecha teorii kategorii wymaga niestety trochę czasu, żeby się do niej przyzwyczaić. Na
szczęście, rzadko rozważamy całe dualne kategorie; na ogół skupiamy się raczej na wybranych
fragmentach albo własnościach jakiejś kategorii, na przykład na konkretnych rodzajach struktur
wewnątrz kategorii, takich jak obiekt początkowy, albo na konkretnych twierdzeniach i odwracamy
strzałki i złożenia tylko w ramach opisów tych konstrukcji, własności albo twierdzeń, tak jak to
robimy w tym rozdziale.

Jeżeli teraz odwrócisz wszystkie strzałki i złożenia (a tam akurat są jakieś złożenia) w definicji
*produktu*, to uzyskasz definicję *koproduktu*: Koproduktem obiektów `X` i `Y` nazywamy taki obiekt,
który możemy oznaczyć jako `X + Y`, że istnieją strzałki `i₁` i `i₂`, nazywane *injekcjami*, *z* `X`
*do* `X + Y` i *z* `Y` *do* `X + Y` odpowiednio (odwrócenie strzałek występujących w definicji
produktu) takie, że dla każdej pary strzałek `f` i `g` *z* `X` i `Y` *do* jakiegoś `Z` odpowiednio
(kolejne odwrócenie strzałek) istnieje unikalna strzałka `f+g` (ale uwaga, bardzo różnie się to
zapisuje) *z* `X + Y` *do* `Z` (kolejne odwrócenie) taka, że `f+g i₁ = f` i `f+g i₂ = g` (odwrócenie
złożeń wymuszone przez odwrócenie wszystkich strzałek). Żeby to było łatwiej zobaczyć, zapiszę te
dwie definicje formalnie.

Produkt punktów `X` i `Y` to taki punkt `X × Y`, że:  
`∃ π₁ : X × Y → X, ∃ π₂ : X × Y → Y, ∀ Z : Obj, ∀ f : Z → X, ∀ g : Z → Y, ∃¹ ⟨f,g⟩ : Z → X × Y,`  
`π₁ ⟨f,g⟩ = f ∧ π₂ ⟨f,g⟩ = g`

Koprodukt punktów `X` i `Y` to taki punkt `X + Y`, że:  
`∃ i₁ : X → X + Y, ∃ i₂ : Y → X + Y, ∀ Z : Obj, ∀ f : X → Z, ∀ g : Y → Z, ∃¹ (f+g) : X + Y → Z,`  
`(f+g) i₁ = f ∧ (f+g) i₂ = g`

gdzie `Obj` oznacza typ obiekt w danej kategorii, a `∃¹`, jak już wiesz, czytamy jako istnieje
dokładnie jedno coś jakiegoś rodzaju.

W kategorii `Set` koprodukty to dokładnie znane Ci już sumy rozłączne zbiorów. Żeby się o tym
przekonać, wystarczy popatrzeć na rysunek struktury wewnętrznej dowolnej sumy rozłącznej dwóch
zbiorów skończonych, na którym widać też strukturę wewnętrzną injekcji. Ponieważ suma rozłączna
zawiera tylko wierne kopie zbiorów - nazwijmy je znowu `X` i `Y` - będących jej członami, zakodowne
w taki sposób, żeby żadne dwa elementy z obydwu zbiorów nie były trafione przez wewnętrzne strzałki
obydwu (w tym wypadku injektywnych) injekcji, to gdy tylko określimy, dla dowolnego zbioru `Z`, do
jakich elementów tego zbioru mają być posłane przez jakieś funkcje `f : X → Z` i `g : Y → Z`
elementy zbioru `X` i zbioru `Y` odpowiednio, to wtedy to, do czego ma być posłana każda kopia w
`X + Y`, żeby powstająca w ten sposób funkcja `(f+g) : X + Y → Z` dołożona do injekcji dawała
funkcje `f` i `g`, będzie wymuszone (i będzie istniała taka funkcja). I odwrotnie, każda funkcja
`h : X + Y → Z` będzie oczywiście opdowiadała unikalnej parze uporządkowanej strzałek z `X` i `Y` do
`Z` odpowiednio, bo złożenia `h i₁` i `h i₂` będą z definicji unikalne. Wiem, że to jest trudne. Ale
to jest też piękne i bardzo przydatne w pewnych sytuacjach.

Można też powiedzieć, że symbol `+`, za pomocą którego oznaczamy czasem w języku teorii kategorii
operację tworzenia koproduktów, reprezentuje jakby drugą stronę albo "wywiniętą na drugą stronę"
wersję tego, co oznaczamy w teorii kategorii za pomocą symbolu `×`, czyli oznacza "wywiniętą na
drugą stronę" wersję operacji tworzenia produktów. A w kategorii `FinSet` (zbiorów skończonych) te
operacje odpowiadają, jak wiesz z jednego z poprzednich rozdziałów, operacjom dodawania i mnożenia
liczb naturalnych, zrealizowanym w zbiorach skończonych za pomocą operacji tworzenia sum rozłącznych
i iloczynów kartezjańskich.

Ponieważ te konstrukcje są z perspektywy teorii kategorii swoimi dualnymi odpowiednikami, możemy z
tego punktu widzenia *zobaczyć* - nawet całkiem dosłownie, gdybyśmy przedstawili to za pomocą
diagramów - głęboki związek między dodawaniem i mnożeniem i tym samym dostrzec, że te dwie operacje
są w pewnym technicznym i abstrakcyjnym sensie *dwiema wersjami tej samej operacji*.

Często, ale nie zawsze, bo to czasem źle brzmi, konstrukcje dualne do takich konstrukcji, które
wydają się bardziej podstawowe albo są częściej używane, nazywamy w teorii kategorii tym samym
określeniem, ale dodając przedrostek *ko* (a po angielsku *co*, jak w pytaniu *co to ma
być?*). Produkty pojawiają się w matematyce znacznie częściej niż koprodukty, dlatego właśnie w
nazwie *produkt* przedrostek *ko* nie występuje.

## Prlp! Hę?

Gdy tylko uda nam się znaleźć kategoryjny odpowiednik pojęcia, konstrukcji lub zdania w jakiejś
opisanej jako kategoria przestrzeni (na przykład, kategoryjny odpowiednik zbioru pustego, będącego
częścią struktury przestrzeni zbiorów i funkcji), możemy zacząć szukać odpowiedników tych struktur w
innych kategoriach. No to teraz poszukamy znanych Ci już konstrukcji kategoryjnych w kategorii
powstającej w naturalny sposób z relacji dowiedlności zdefiniowanej na zdaniach.

Czy ta kategoria *ma* obiekt początkowy? A jeśli ma, to *czym* on jest? Obiektem początkowym w tej
kategorii jest *zdanie fałszywe*, które w Leanie jest zdefiniowane tak:

```lean
inductive False : Prop
```

To jest *cała* definicja zdania `False`. **Czytamy to** w ten sposób: Definiuję indukcyjnie
(`inductive`), czyli przez *wymienienie wszystkich możliwych sposobów konstruowania termów
definiowanego typu danych*, zdanie `False` (`False : Prop`) jako typ, którego termów (czyli tutaj
dowodów) *nie da się w żaden sposób skonstruować*. Dlatego ta definicja indukcyjnego typu danych
kończy się tak gwałtownie.

Zdanie/typ `False` jest ewidentnie obiektem analogicznym do zbioru pustego w kategorii `Set` i tak
samo jak zbiór pusty, spełnia wszystkie warunki kategoryjnej definicji obiektu początkowego: Dla
każdego zdania `P`, czyli dla każdego punktu w rozpatrywanej teraz kategorii dowiedlności zdań ze
zdań, jak wiesz, można udowodnić zdanie `False → P`, czyli istnieje *jakaś* strzałka z punktu
`False` do punktu `P`, bo z fałszu wynika wszystko. Co więcej, istnieje *co najwyżej jedna* taka
strzałka, bo w tej kategorii nie ma nigdy dwóch różnych równoległych strzałek.

Obiektem dualnym do zdania fałszywego jest *zdanie prawdziwe*, które w Leanie jest zdefiniowane tak:

```lean
inductive True : Prop where
  | intro : True
```

**Czytamy to** w ten sposób: Definiuję indukcyjnie zdanie `True` jako takie, że (`where`) term/dowód
tego typu/zdania można skonstruować *w dokładnie jeden sposób* (bo w ciele tej definicji jest tylko
jedna pozioma kreska `|`) *z niczego* (bo wyrażenie za tą kreską nie ma parametrów) jako term
`intro` typu `True`. Tworząc definicje indukcyjne automatycznie tworzymy też przestrzenie nazw dla
ciał tych definicji, dlatego normalnie zapisujemy ten jedyny term/dowód typu/zdania `True` jako
`True.intro`. Jak łatwo sprawadzić, to zdanie spełnia wymagania obiektu końcowego ze względu na
interpretację strzałek jako czegoś, co wyraża relację dowiedlności zdań:

```lean
example (P : Prop) : P → True := True.intro
```

A więc z perspektywy kategoryjnej zdanie prawdziwe albo prawda i zdanie fałszywe albo fałsz są
obiektami dualnymi, a więc w pewnym sensie są tym samym obiektem, tylko każdy z nich jest "wywróconą
na drugą stronę" wersją drugiego. Widzimy też, że istnieje oczywiste podobieństwo między
typem/zdaniem `True` i każdym możliwym singletonem. 

Co więcej, dla każdego zdania `P`, istnieje strzałka `True → P` wtedy i tylko wtedy, gdy samo zdanie
`P` jest zdaniem prawdziwym, na przykład, gdy `P` jest zdaniem (nie strzałką w tej kategorii!) `q →
q`, bo tylko wtedy można skonstruować dowód implikacji `True → P`. I dualnie, dla każdego zdania
`P`, istnieje strzałka *z* `P` *do* `False` wtedy i tylko wtedy, gdy istnieje dowód negacji tego
zdania, czyli kiedy `P` jest zdaniem fałszywym. A więc asercja (`P`, dla jakiegoś `P : Prop`) i
negacja (`¬ P` dla jakiegoś `P : Prop`) są swoimi dualnymi odpowiednikami.

Produkty w tej kategorii to z kolei *koniunkcje zdań*: Dla każdego zdania `P` i zdań `Q` i `R`,
jeżeli z `P` wynika `Q` i z `P` wynika `R`, czyli jeżeli można udowodnić implikacje `P → Q` i `P →
R`, czyli jeżeli w logice zdań jako kategorii dowiedlności zdań ze zdań istnieją strzałki `P → Q` i
`P → R`, to istnieje unikalna strzałka z `P` do `Q × R`, czyli istnieje dowód implikacji `P → Q ∧ R`
i ten dowód jako strzałka składa się z projekcjami `Q × R → Q` i `Q × R → R`, czyli dowód tej
implikacji składa się z dowodami zdań `Q ∧ R → Q` i `Q ∧ R → R`, dając jedyne możliwe strzałki `P →
Q` i `P → R` odpowiednio, bo te złożenia nie mogą dawać innych strzałek, bo nie ma tutaj żadnych par
różnych równoległych strzałek. W dodatku koniunkcja zdań jest zdefiniowana w Leanie jako para
uporządkowana zdań, a więc każdy dowód koniunkcji to para uporządkowana zdań będących jej członami,
co jeszcze podkreśla ścisły związek między kategoryjnym pojęciem produktu (i iloczynem kartezjańskim
zbiorów) i pojęciem koniunkcji w logice zdań.

*Koproduktami* w tej kategorii są z kolei dokładnie wszystkie *alternatywy* zdań, które zapisujemy
prawie jak koniunkcje, tylko odwracając symbol `∧` do góry nogami, czyli używając symbolu `∨`. No i
powiedz teraz, czy jest coś bardziej praktycznego, niż dobra teoria?
