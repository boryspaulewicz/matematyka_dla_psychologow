# Kilka zadań z dowodzenia implikacji

Niedawno napisał do mnie Tomek Smoleń, który pracuje teraz na Krakowskiej kognitywistycee i z którym
byliśmy razem w tym samym pokoju na studiach doktorskich, gdy instytu psychologii znajdował się
jeszcze na alei Mickiewicza. Nie dziwi mnie, że temat przypadł mu go gustu, bo wiem, że jest do
niego od dawna świetnie przygotowany. No więc ten właśnie Tomek stwierdził, że gdy relacje między
termami, typami, zdaniami i dowodami wskoczyły mu podczas lektury na miejsce, a założę się, że w
Jego przypadku stało się to szybko, efekt był, jak to wyraził, bardzo satysfakcjonujący. Pozwolę
sobie do tego jeszcze dodać, że zakończenie konstrukcji dowodu, gdy po mniej lub bardziej mozolnym
układaniu logicznych puzzli Lean nie pokazuje już czerwonej falki i widać po prawej, że cele
zniknęły, kojarzy mi się często z tym rodzajem satysfakcji, który dobrze oddaje angielskie słowo
*satisfying*.

Żeby doświadczyć czegoś podobnego, o ile już wcześniej to nie nastąpiło, być może zaglądając do
wcześniejszych rozdziałów, spróbuj dokończyć poniższe dowody. Warto to zrobić choć raz definiując
funkcje ręcznie, a raz za pomocą trybu interaktywnego, w dowolnej kolejności. Ponieważ błędy są po
to, żeby je robić coraz rzadziej robiąc je na początku częściej, nie ma sensu powstrzymywać się od
eksperymentowania. W trybie interaktywnym możesz przecież próbować dowolnych kombinacji znanych Ci
już taktyk i obserwować, jak to wpływa na aktualny stan dowodu. A poza tym, jak wiadomo, wszystko
mija.

Moim zdaniem warto czasem rozwiązywanie tego typu prostych zadań powtarzać, z przerwami, do momentu,
gdy będzie to tak łatwe, że stanie się przez to wyraźnie przyjemne; jak granie na jakimś
instrumencie utworu, który tak dobrze się opanowało, że staje się to sposobem na
(satysfakcjonujące!)  odprężenie.

**Szare nazwy zmiennych**: Jeżeli zobaczysz, że niektóre parametry Lean wyświetla na szaro a nie na
czarno, to będzie znak, że te parametry nie są nigdzie używane. To nie jest komunikat o błędzie,
tylko ostrzeżenie na temat stylu, które możesz spokojnie zignorować. Żeby Lean przestał grymasić,
możesz usunąć to ostrzeżenie na przykład wpisując zamiast nazwy zbędnego parametru symbol
podkreślenia `_`.

```lean
theorem t1a (p : Prop) : p → p :=

-- W trybie nieinteraktywnym trzeba tutaj stworzyć funkcję, która tworzy funkcję, która tworzy funkcję. W trybie 
-- interaktywnym trzeba dwa razy użyć taktyki intro. Taktyka intro służy do (λ-)abstrachowania od termów dowolnego typu,
-- nie tylko zdaniowego. Nie wiem, który tryb będzie dla Ciebie na początku łatwiejszy, więc jeśli jeden z nich będzie
-- się wydawał trudny, to spróbuj drugiego.
theorem t1b : (p : Prop) → p → p :=

-- To zadanie jest najprostsze, ale może właśnie dlatego w trybie nieinteraktywnym może być szczególnie dezorientujące. 
-- Tym, co od razu masz do dyspozycji wewnątrz definicji są parametry tego twierdzenia-funkcji. Musisz tylko zapisać term,
-- którego typ jest taki, jak typ rezultatu - p. Jeżeli nie wiesz, jak to zrobić, zacznij może od trybu interaktywnego.
theorem t1c (p : Prop) (h : p) : p :=

theorem t2 (p q : Prop) : p → q → p :=

theorem t3a (p : Prop) : p → p → p :=

theorem t3b (p : Prop) (h1 : p) : p → p :=

theorem t3c (p : Prop) (h1 : p) (h2 : p) : p :=

-- Jedna z różnic między theorem i def jest taka, że definicje funkcji zapisane za pomocą słowa kluczowego theorem
-- nie są rozpakowywane. W przypadku *konstruowania* dowodu to nie ma znaczenia. To, że twierdzenia nie są
-- rozpakowywane wpływa między innymi na szybkość, z jaką Lean wykonuje pewne operacje - nie musi wtedy nic rozpakowywać
-- więc oszczędza zasoby. Poza tym Lean traktuje wszystkie dowody tego samego twierdzenia jak te same obiekty, ale tym
-- się nie musisz przejmować.
def t4 (p q : Prop) : q → p → p :=

-- Jeżeli potrzebujesz wskazówek, znajdziesz je pod koniec poprzedniego rozdziału.
axiom r : Prop
theorem t5 (p : Prop) : p → r :=
```
