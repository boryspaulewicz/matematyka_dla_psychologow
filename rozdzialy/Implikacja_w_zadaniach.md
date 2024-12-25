## O czym teraz będzie

Nie bardzo wiem, co tu napisać. Zadania jak zadania. Z dowodzenia implikacji w trybie interaktywnym
i poprzez pisanie kodu wprost.

<hr>

# Implikacja w praktyce dowodzenia

Niedawno w sprawie tej książki napisał do mnie Tomek Smoleń, który pracuje teraz na Krakowskiej
kognitywistycee i z którym byliśmy razem w tym samym pokoju na studiach doktorskich, gdy instytu
psychologii znajdował się jeszcze na alei Mickiewicza. Nie dziwi mnie, że temat przypadł mu go
gustu, bo wiem, że jest do niego od dawna znakomicie przygotowany. No więc ten właśnie Tomek
stwierdził, że gdy relacje między termami, typami, zdaniami i dowodami wskoczyły mu podczas lektury
na miejsce, a założę się, że w Jego przypadku stało się to szybko, efekt był, jak to wyraził, bardzo
satysfakcjonujący. Dodam do tego jeszcze, że mi ten moment zakończenia konstrukcji dowodu, gdy po
mniej lub bardziej mozolnym układaniu logicznych puzzli Lean nie pokazuje już czerwonej falki i
widać po prawej, że cele zniknęły, kojarzy się często z tym szczególnym rodzajem satysfakcji, który
dobrze oddaje angielskie słowo *satisfying*.

Żeby doświadczyć czegoś podobnego, o ile już wcześniej to nie nastąpiło, być może zaglądając do
wcześniejszych rozdziałów, spróbuj dokończyć poniższe dowody. Warto to zrobić choć raz definiując
funkcje ręcznie, a raz za pomocą trybu interaktywnego, w dowolnej kolejności. Ponieważ błędy są po
to, żeby je robić coraz rzadziej robiąc je na początku częściej, nie ma sensu powstrzymywać się od
eksperymentowania. W trybie interaktywnym możesz przecież próbować dowolnych kombinacji znanych Ci
już taktyk i po prostu sprawdzać, jak to wpłynie na aktualny stan dowodu.

Moim zdaniem warto czasem rozwiązywanie tego typu prostych zadań powtarzać, z przerwami, do momentu,
gdy będzie to tak łatwe, że stanie się przez to wyraźnie przyjemne; jak granie na jakimś
instrumencie utworu, który tak dobrze się opanowało, że staje się to sposobem na satysfakcjonujące
(hm) odprężenie.

**Szare nazwy zmiennych**: Jeżeli zobaczysz, że niektóre parametry Lean wyświetla na szaro a nie na
czarno, to będzie znak, że te parametry nie są nigdzie używane. To nie jest komunikat o błędzie,
tylko ostrzeżenie na temat *stylu*, które możesz spokojnie zignorować[^1]. Żeby Lean przestał
grymasić, możesz usunąć to ostrzeżenie na przykład wpisując zamiast nazwy zbędnego parametru symbol
podkreślenia `_`. Wtedy Lean będzie wiedział, że Ty wiesz, że nie używasz nigdzie tego parametru.

Stosuję tutaj konwencję nazywania twierdzeń w sposób, który sygnalizuje, że niektóre z nich są do
siebie podobne, albo wręcz że są tym samym twierdzeniem, tylko inaczej zapisanym.

Zacząłem tu również stosować słowo kluczowe `theorem`, które oznacza prawie to samo co `def`, ale
mówi Leanowi, że danej definicji funkcji nie będzie trzeba rozpakowywać. Powód, dla którego tak
zwykle definiujemy twierdzenia podam jednak trochę później.

```lean
-- To tylko rozgrzewka, bo jest to samo twierdzenie, które udowodniłaś już wcześniej, zmieniła się tylko nazwa tego
-- twierdzenia i nazwa jego (jedynego) parametru.
theorem t1a (p : Prop) : p → p :=

-- W trybie nieinteraktywnym trzeba tutaj stworzyć funkcję, która tworzy funkcję, która tworzy funkcję. W trybie 
-- interaktywnym trzeba dwa razy użyć taktyki intro. Przypominam, że taktyka intro służy do (λ-)abstrachowania od 
-- termów dowolnego typu, nie tylko zdaniowego. Nie wiem, który tryb będzie dla Ciebie na początku łatwiejszy, więc
-- jeśli jeden z nich będzie się wydawał trudny, to spróbuj drugiego.
theorem t1b : (p : Prop) → p → p :=

-- To zadanie jest najprostsze, ale może właśnie dlatego w trybie nieinteraktywnym może być szczególnie dezorientujące. 
-- Tym, co od razu masz do dyspozycji wewnątrz definicji (czyli masz w kontekście) są parametry tego twierdzenia-funkcji.
-- Musisz tylko zapisać term, który ma taki sam typ, jak typ rezultatu, to jest p. Jeżeli nie wiesz, jak to zrobić,
-- zacznij może od trybu interaktywnego. Do wyboru masz tylko dwie taktyki, bo tylko tyle na razie poznałaś, a więc
-- metodą prób i błędów na pewno szybko znajdziesz poprawne rozwiązanie.
theorem t1c (p : Prop) (h : p) : p :=

-- Tutaj w trybie nieinteraktywnym pojawi się podświetlenie na szaro, ale już wiesz, że to tylko ostrzeżenie na temat
-- stylu. Przypominam, że wprowadzając zmienne / parametry do kontekstu za pomocą taktyki intro musisz uważać, żeby
-- ich nazwy się nie powtarzały.
theorem t2 (p q : Prop) : p → q → p :=

theorem t3a (p : Prop) : p → p → p :=

theorem t3b (p : Prop) (h1 : p) : p → p :=

theorem t3c (p : Prop) (h1 : p) (h2 : p) : p :=

-- Jak już wspomniałem, jedna z różnic między theorem i def jest taka, że definicje funkcji zapisane za pomocą
-- słowa kluczowego theorem nie są później rozpakowywane. W przypadku *konstruowania* dowodu to nie ma znaczenia. 
-- To, że twierdzenia nie są rozpakowywane wpływa między innymi na szybkość, z jaką Lean wykonuje pewne operacje -
-- ponieważ nie musi wtedy nic rozpakowywać, oszczędza zasoby. Poza tym Lean traktuje wszystkie dowody tego samego
-- twierdzenia albo zdania tak, jakby były *tym samym obiektem*, ale tym nie musisz się teraz przejmować.
def t4 (p q : Prop) : q → p → p :=

-- Jeżeli potrzebujesz wskazówek, znajdziesz je pod koniec jednego z poprzednich rozdziału. Wprowadzamy tutaj
-- aksjomatycznie jakieś zdanie (a nie jego dowód) r, a następnie, gdy dzięki temu r jest już czymś, co Lean "rozumie"
-- wprowadzamy aksjomatycznie jakiś dowód tego zdania.
axiom r : Prop
axiom hr : r
theorem t5 (p : Prop) : p → r :=
```

### Przypisy

[^1]: To właśnie Tomek pomógł mi zauważyć, że powinienem był wcześniej (na przykład w tym rozdziale)
    wyjaśnić sens komunikatów sygnalizujących, że jakiś parametr nie jest później używany. Dzięki
    Tomek!
