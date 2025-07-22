<!-- -*- coding: utf-8 -*- -->
## O czym teraz będzie, ...

... pytają [łabędzie](https://youtu.be/6qDq9eGUmMI?si=wyseYEGYCbGXz9if).

# ... a później rekordowo i z klasą

```lean
-- Może to nie jest przyjemna lektura, ...
#print List
-- inductive List.{u} : Type u → Type u
-- number of parameters: 1
-- constructors:
-- List.nil : {α : Type u} → List α
-- List.cons : {α : Type u} → α → List α → List α
-- Mark set

-- Dzięki umieszczeniu kopii w nowej przestrzeni nazw nie występuje konflikt nazw wynikający ze
-- zdefiniowania dwukrotnie tej samej stałej (tutaj stałej `List`). Mówiąc dokładniej, nieco poniżej
-- zaczyna się ...
namespace Kopia -- ... fragmentu zawartości pliku Prelude.lean.

-- Za pomocą pary oznaczeń `/--` i `-/` można wygodnie tworzyć komentarze zajmujące więcej niż jedną
-- linię.

-- ... ale za to może ta definicja ładowana przez Leana na starcie również nie jest lekturą
-- przyjemną:

/--
Linked lists: ordered lists, in which each element has a reference to the next element.

[To mówię ja, (współ)autor: Przepraszam, że tak wszedłem dokumentacji w słowo, ale chciałem
 powiedzieć, że na Twoim miejscu nie przejmowałbym się za bardzo tym technicznym objaśnieniem.]

Most operations on linked lists take time proportional to the length of the list, because each
element must be traversed to find the next element.

`List α` is isomorphic to `Array α`, but they are useful for different things:
* `List α` is easier for reasoning, and `Array α` is modeled as a wrapper around `List α`.
* `List α` works well as a persistent data structure, when many copies of the tail are shared. When
  the value is not shared, `Array α` will have better performance because it can do destructive
  updates.
-/
inductive List (α : Type u) where
  /-- The empty list, usually written `[]`. -/
  | nil : List α
  /--
  The list whose first element is `head`, where `tail` is the rest of the list.
  Usually written `head :: tail`.
  -/
  | cons (head : α) (tail : List α) : List α

end Kopia
```
