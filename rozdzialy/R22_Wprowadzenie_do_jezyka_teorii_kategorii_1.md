<!-- -*- coding: utf-8 -*- -->
# X × Y ~ X ← ∘ → Y

Może zapnij pasy, a jak nie masz, to nie wiem, zrób cokolwiek, żebyś czytając ten rozdział czuła się
bezpiecznie. Będziemy coraz częściej [mówić niemal jednocześnie w kilku
językach](https://www.youtube.com/watch?v=33Raqx9sFbo), to jest w języku zbiorów, teorii typów,
logiki, częściowo rysunkowym języku teorii kategorii, niekategoryjnym języku rysunkowym i w języku
naturalnym. Ale zaczniemy od powtórki (którą zresztą powtórzymy)[^1].

Już wiesz, że z *każdym* (nie tylko skończonym) zbiorem związana jest *funkcja identycznościowa* na
tym zbiorze, bo dla każdego zbioru potrafisz taką funkcję zdefiniować. W przypadku zbiorów
*skończonych* możesz to zrobić *rysując* ją, a w przypadku *dowolnych* (a więc również
nieskończonych) zbiorów możesz podać charakteryzującą ją jednoznacznie (nicnierobiącą) *regułę
działania* (czy może raczej *oznaczania*).

Wiesz, że istnieje *dokładnie jedna* taka funkcja dla każdego zbioru, bo gdy definiuje się funkcję
identycznościową nie ma swobody wyboru, skoro każda identyczność musi dla każdego elementu zwrócić
ten element.

I wiesz, że *różne zbiory mają różne identyczności*, bo tożsamość funkcji zależy od jej dziedziny i
przeciwdziedziny. Dlatego dla każdego zbioru `X` możemy napisać `Id_X` i dlatego, gdy piszemy
*skrótowo* `Id`, wiemy, że istnieje dokładnie jeden zbiór, który jest zarówno dziedziną jak i
przeciwdziedziną zapisanej w taki skrótowy sposób identyczności.

Wiesz, kiedy dwie funkcje są *składalne* i wiesz, że dla każdej pary funkcji `f : X → Y` i `g : Y →
Z` istnieje *dokładnie jedna* funkcja `h : X → Z`, która jest ich złożeniem, czyli jest (tą samą
\{taką samą\}) funkcją (co) `(g o f) : X → Z`, bo dla każdej konkretnej pary składalnych funkcji
taka funkcja istnieje i również nie ma wyboru, o czym przekonałaś się niedawno dowodząc-rysując.

Wiesz poza tym, że dla każdej funkcji `f`, `Id ∘ f = f = f ∘ Id` (stosując skróty myślowe, to znaczy
pomijając indeksy dolne pozwalające odróżnić identyczności na dziedzinie i przeciwdziedzinie `f`),
bo identyczności to takie jakby "zera" albo "jedynki" (lepiej: *elementy neutralne*) - zależnie od
tego, czy skorzystamy z analogii do dodawania czy do mnożenia - ze względu na operację składania.

Mogłabyś teraz sama udowodnić, rozwijając tylko definicję składania funkcji, że dla każdych *trzech*
funkcji `f : X → Y`, `g : Y → Z` i `h : Z → V` spełniony jest warunek `h ∘ (g ∘ f) = (h ∘ g) ∘ f`,
który mówi, że tak jak dodawanie i mnożenie liczb, a także wiele innych często używanych operacji
binarnych, składanie funkcji jest operacją *łączną*. Ale może na wszelki wypadek ja to tu za Ciebie
zrobię. Najpierw jednak proponuję, żebyś spróbowała zrobić to sama.

**Sugestia**: Zanim zaczniesz czytać dalej, spróbuj proszę samodzielnie "wyprowadzić na kartkę" (a
więc "z głowy") dowód zdania `h ∘ (g ∘ f) = (h ∘ g) ∘ f`, gdzie `f`, `g` i `h` to kolejno parami
składalne funkcje. Jak zawsze w takich sytuacjach najważniejszy jest spokój, a gdy *mamy* do
zrobienia coś, w czym nie *mamy* jeszcze dużej wprawy, dobrze jest *zacząć* od pytania, od czego by
tu *zacząć* (chociaż wychodzi na to, że dobrze zacząć właśnie od tego pytania \{to jest od czego by
tu zacząć\}). Innym dobrym sposobem, żeby zachować w takich sytuacjach spokój, jest coś, co w
[gotowaniu](https://youtu.be/O8OrsCw0OC0?si=RjVm3NQ-n3kcmba5) nazywa się [*mise en
place*](https://en.wikipedia.org/wiki/Mise_en_place). W tym przypadku to znaczy, że warto najpierw
zapisać na kartce *to, co masz, to, jaki jest cel* (czyli zdanie do udowodnienia) i *to, co na temat
tych rzeczy już wiesz*.

*Cel* już znasz. Tym razem *masz* to:

Jakieś funkcje `f : X → Y`, `g : Y → Z` i `h : Z → V`, a więc też oczywiście jakieś zbiory `X`, `Y`,
`Z` i `V`.

A *wiesz* to:

Te trzy funkcje są kolejno parami składalne, a więc istnieją ich złożenia, które można zapisać jako
`g ∘ f` i `h ∘ g`.

Zdanie do udowodnienia dotyczy *równości* pewnych *funkcji*, a więc trzeba będzie skorzystać z
... kryterium równości funkcji, no bo z czego innego. A to kryterium mówi, że dwie funkcje są równe
wtedy i tylko wtedy, gdy 1. mają tą samą dziedzinę i przeciwdziedzinę i 2. dla każdego elementu
dziedziny zwracają ten sam element przeciwdziedziny. Wobec tego, żeby udowodnić cel `h ∘ (g ∘ f) =
(h ∘ g) ∘ f` wystarczy udowodnić zdanie (często warto próbować \{re-\}konstruować dowody
\{wszelkiego rodzaju rozumowania\} od końca, pamiętasz?):

`∀ x ∈ X, (h ∘ (g ∘ f))(x) = ((h ∘ g) ∘ f)(x)`

A żeby z kolei rozpocząć konstrukcję dowodu zdania zaczynającego się od *Dla każdego* `x` *takiego,
że ...*  wystarczy założyć, że *mamy jakiś* `x` *taki, że ...*. Jakakolwiek próba zrobienia tego
dowodu, nawet bardzo nieudana taka próba, sprawi, że czytając dalsze objaśnienia będziesz mogła
zauważyć, z czym dokładanie miałaś problem, a dzięki temu prawdopodobnie ten konkretny problem
niedługo zniknie. Jak tylko uznasz, że masz ochotę czytać dalej, kliknij [ten
link.](R22_Wprowadzenie_do_jezyka_teorii_kategorii_2.md)

### Przypisy

[^1]: Repetitio est mater studiorum!
