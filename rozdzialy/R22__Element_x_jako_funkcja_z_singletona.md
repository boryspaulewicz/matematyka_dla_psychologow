<!-- -*- coding: utf-8 -*- -->
Zacznijmy od mise en place. Musimy pamiętać, że symbol `x` jest w tym kontekście dwuznaczny. Z
jednej strony oznacza pewien *element* "wewnątrz" zbioru `X`, a z drugiej pewną *funkcję* z
singletona `{∅}` do tego zbioru. Wobec tego zdanie `x(∅) = x` będzie *poprawne* tylko wtedy, gdy
pierwsze wystąpienie symbolu `x` będziemy interpretować jako nazwę funkcji, a drugie jako nazwę
elementu. "Mamy prawo" przyjąć takie dwie interpretacje jednocześnie, ponieważ pozwala na to
kontekst, dzięki któremu właściwe interpretacje "narzucają się" jako *jedyne* poprawne. Można
powiedzieć, że postępując tak stosujemy zasadę życzliwej interpretacji wobec czegoś, co napisaliśmy
sami.

Zdanie `x(∅) = x` charakteryzuje funkcję `x : {∅} → X` i mówi nam/wyrażamy przez nie (znowu -
zależnie od kontekstu) założenie albo decyzję, że *funkcja* `x` ze zbioru `{∅}` posyła zbiór pusty,
będący jedynym elementem należącym do dziedziny funkcji `x` - która to dziedzina jest tutaj takim
jakby *uniwersalnym wskaźnikiem*, służącym do "wytykania" dowolnych elmentów należących do dowolnych
zbiorów - w *element* `x` zbioru `X`. W ten sposób *funkcja* `x` jest w pewnym sensie *jednocześnie
nazwą* (bo jest pewnym oznaczeniem) pewnego elementu i *stwierdzeniem*, że ten element należy do
zbioru `X`. A więc ta funkcja *zastępuje dwa wyrażenia* - symbol `x` *rozumiany jako element* i
*zdanie* `x ∈ X`. Jak ona to robi? *Będąc oznaczonym oznaczeniem za pomocą singletona*.
