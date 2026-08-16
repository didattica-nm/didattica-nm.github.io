Registro sostituzioni
===
- Istituto Tecnico Tecnologico "Blaise Pascal", Cesena (FC)
- A.S. 2025/26

Lunedì 18 maggio 2026 
---

- Classe 2I, ore 10:00-12:00.
	- dalle ore 10:00 alle ore 11:00 in lab. 46
	- dalle ore 11:00 alle ore 12:00 in aula 56 (variazione orario)


- Classe 2F, ore 12:00-14:00.
	- tutte le ore in lab. 46

### Argomenti 

- Lezione su **Sistemi di versionamento: Git** - [[Web slide]](https://didattica-nm.github.io/git-v1.0-finalissimo/) [[GitLab @ biagio.ispascalcomandini.it]](https://biagio.ispascalcomandini.it/gitlab/users/sign_in)
- Live coding: esercizio `MathSet` in TDD - [[Testo della consegna]](/materials/tdd/MathSet.pdf) [[`MathSet.kt`]](/materials/tdd/MathSet.kt) [[`MathSetTest.kt`]](/materials/tdd/MathSetTest.kt)

Hint: i sorgenti non sono completi, utilizzate l'esercizio per praticare il TDD in autonomia!

Anteprima di `MathSet.kt`:

```kotlin
class MathSet {
    private val items: MutableList<Int> = mutableListOf()

    val itemsCount: Int
        get() = items.size

    fun isEmpty() = itemsCount == 0

    fun addItem(item: Int): Boolean {
        items.add(item)
        return true
    }
}
```

Anteprima di `MathSetTest.kt`:
```kotlin
import org.junit.jupiter.api.Assertions.*
import org.junit.jupiter.api.DisplayName
import org.junit.jupiter.api.Test

class MathSetTest {

    @Test
    fun `should create an empty set`() {
        assertDoesNotThrow { MathSet() }
    }

    @Test
    fun `set must be empty when created`() {
        // arrange
        val set = MathSet()

        // act
        val isEmpty = set.isEmpty()
        val itemsCount = set.itemsCount

        // assert
        assertEquals(true, isEmpty)
        assertTrue(isEmpty)
        assertEquals(0, itemsCount)
    }

    @Test
    @DisplayName("should be able to add an element")
    fun addItem_mustAddItem() {
        // arrange
        val set = MathSet()

        // act
        val success: Boolean = set.addItem(2)

        // assert
        assertTrue(success)
    }

    @Test
    fun `isEmpty - when adding an item to the set isEmpty should be false`() {
        // arrange
        val set = MathSet()

        // act
        set.addItem(2)
        val isEmpty = set.isEmpty()
        val itemsCount = set.itemsCount

        // assert
        assertFalse(isEmpty)
        assertEquals(1, itemsCount)
    }
}
```
