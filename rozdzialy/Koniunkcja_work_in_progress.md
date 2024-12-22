2024 12 22: Mam wątpliwości, jaki obrać kierunek, więc spróbuję to sobie tutaj sam jakoś wyjaśnić.

Kombinuję teraz, w jaki sposób najlepiej omówić szczegółowo koniunkcję w planowanych rozdziałach R15
i R16. Wcześniej (zanim wpadłem na pomysł trzech rozdziałów, po co, po co) wydawało mi się, że
poprzestanę na standardowej definicji "strzałkowej":

```lean
def and (p : Prop) (q : Prop) := ∀ r : Prop, (p → q → r) → r
```

co ma tą zaletę, że mogę zgodnie z zapowiedzią definiować wszystko za pomocą funkcji /
implikacji. Poza tym w przypadku tej definicji jest i tak co objaśniać i można wymyślić trochę
fajnych i w sam raz na tym etapie trudnych zadań.

Nadal zamierzam to zrobić, ale zdążyłem się już trochę znudzić tym pomysłem, więc zobaczę, czy nie
uda mi się również pokazać z jednej strony naturalności czy "nieuchronności" koniunkcji, a z drugiej
"drugorzędności" kolejności członów koniunkcji z perspektywy kategoryjnej. Wstępny pomysł wygląda
tak:

Jeżeli dłuższy fragment prozy zapisanej w języku naturalnym zawiera w taki lub inny sposób, w tym
również pośrednio, wyrażone dwie asercje, na przykład, że *jest wtorek* (`p`) i że *pada deszcz*
(`q`), to z tego fragmentu wynika, że *jest wtorek* (`p`) i *niezależnie* wynika też, że *pada
deszcz* (`q`).

Wyobraźmy sobie wszystkie możliwe skończone fragmenty prozy tego rodzaju. Gdybyśmy się *skupili
tylko na tych dwóch zdaniach i na relacji wynikania*, to te możliwe fragmenty prozy stałyby się dla
nas mniej lub bardziej "zaśmieconymi" sposobami łącznego wyrażenia czy "implikowania" tych dwóch
asercji.

Niektóre z tych fragmentów prozy będą zawierały więcej, a inne mniej "śmieci" w postaci innych,
bezpośrednio lub wprost wyrażonych tam asercji.

Jeżeli każdy taki fragment prozy to punkt, a strzałka od punktu `A` do punktu `B` oznacza, że z `A`
wynika (jakoś) `B`, to z każdego fragmentu prozy, który wyraża bezpośrednio lub pośrednio asercje
`p` i `q` będą wychodziły strzałki do punktów `p` i `q`, czyli fragmentów prozy złożonych z samych
wyrażonych wprost asercji zdań *jest wtorek* i *pada deszcz* odpowiednio.

Fragment prozy *Jest wtorek i pada deszcz* będzie wtedy "najczystszym fragmentem prozy wyrażającym
łącznie asercje `p` i `q`". Samo to jest oczywiste i nie widać od razu, po co w tak zawiły sposób o tym
mówić. Ale.

Będziemy tą "czystość" czy "doskonałość" (*jako czegoś, co wyraża łącznie `p` i `q`*) mogli
*zobaczyć w strukturze strzałek, bo każdy punkt emitujący strzałki jednocześnie do `p` i do `q`,
czyli każdy fragment prozy z którego wynikają obie te asercje, będzie emitował (dokładnie jedną)
strzałkę do punktu *Jest wtorek i pada deszcz*. Mamy wtedy formalnie uchwycony pewien rodzaj
"doskonałości" albo "czystości" albo "bycia najlepszym" koniunkcji `p ∧ q` jako czegoś, co emituje
strzałki (wynikania) do `p` i do `q`. Tylko, że nie mam pojęcia, czy czytelnik na tym etapie będzie
w stanie poczuć, że to jest coś ważnego.

To bycie najlepszym w tym sensie rozwidleniem o postaci `p ← x → q` można pokazać ładnie za pomocą
diagramu i to już jest fajne, ale można też z tym zrobić coś jeszcze fajniejszego. Można
(przynajmniej w wyobraźni) *unieść ten diagram z płaszczyzny papieru w przestrzeń trójwymiarową* i
zobaczyć (przynajmniej w oczyma wyobraźni), że *kolejność ramion*, a więc też *kolejność zdań w
koniunkcji nie ma tak naprawdę znaczenia* i wynika tylko z tego, że "mówimy" o koniunkcjach za
pomocą szeregów symboli, czyli pisząc w standardowy sposób ("linearny") *tekst* w języku naturalnym
albo formalnym. Przecież gdy uniesiemy całą strukturę fragmentów prozy lub zdań połączeń
kierunkowych wyrażających relację wynikania do przestrzeni trójwymiarowej, a potem zaczniemy tą
strukturą dowolnie obracać, to to będzie cały czas ta sama struktura.

To bycie najlepszym rozwidielniem tego rodzaju jest pojęciem teorio-kategorialnym (czy
kategoryjnym) - to jest po prostu kategoryjny produkt. Łatwo wykazać, że koniunkcja `p ∧ q`, czyli,
z perspektywy strzałka jako dowiedlność jednego z drugiego produkt `p ← (p ∧ q) → q`, jest
izomorficzna do `q ∧ p`, czyli do produktu `q ← (q ∧ p) → p`. W ten sposób można pokazać, że teoria
kategorii pozwala w pewnym sensie "prawie widzieć w 3d" struktury takie jak koniunkcja w logice,
czyli jakby operować nimi odrywając się do pewnego stopnia od ograniczeń "linearnego" języka.

Wydaje mi się to bardzo fajne i jednocześnie obawiam się, że nie uda mi się tego wszystkiego
klarownie i przekonująco wytłumaczyć nie wprowadzając zbyt wielu elementów (ekstremalnie
abstrakcyjnej) teorii kategorii.
