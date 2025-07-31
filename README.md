# 🥒 Gherkin & BDD: Documentando el comportamiento del sistema como se debe

## ¿Qué es BDD?

**BDD** (Behavior Driven Development) es una metodología de desarrollo de software que promueve la colaboración entre **desarrolladores, testers y miembros del negocio**. En vez de enfocarnos en cómo funciona el código, nos enfocamos en **cómo debería comportarse el sistema**.

### 🧠 Beneficios de BDD:

* Une al equipo a través de los roles.
* Favorece un entendimiento profundo del problema antes de escribir una sola línea de código.
* Genera **feedback continuo** gracias a iteraciones pequeñas y testeables.
* Produce documentación viva que **describe el comportamiento real del sistema**.
* Un lenguaje común para todas las partes involucradas.

---

## ¿Qué es Cucumber?

[Cucumber](https://cucumber.io/) es una herramienta que soporta BDD. Permite escribir escenarios en lenguaje natural para que **todos puedan entenderlos, incluso sin conocimientos técnicos**.

### 🔧 Características:

* Compatible con múltiples lenguajes: Java, Python, Ruby, PHP, C#, etc.
* Interpreta los escenarios escritos en **Gherkin**.
* Evalúa si los escenarios pasan o fallan automáticamente (perfecto para CI/CD).

---

## ¿Qué es Gherkin?

Gherkin es un **lenguaje estructurado y legible por humanos**, usado para escribir **escenarios de aceptación** en BDD.

* Utiliza una sintaxis predefinida (Given/When/Then).
* Cada escenario sigue un formato tipo:

```gherkin
Given contexto inicial
When acción del usuario o sistema
Then resultado esperado
```

* Cucumber lo interpreta para ejecutar los tests correspondientes.
* Está disponible en más de 70 idiomas y es extremadamente versátil.

### ¿Por qué aprender Gherkin?

* Esencial para implementar BDD con herramientas como Cucumber.
* Usado ampliamente por profesionales del testing y analistas de negocio.
* Permite una fuente única de verdad: los tests sirven como documentación, requerimientos y validación.

---

## 🧠 Gherkin como lenguaje universal

Supongamos que trabajás en una empresa (como ACME). Hay una reunión entre el CEO, un dev y Steve (el QA Manager). El CEO larga los requerimientos de forma informal, el dev toma notas, el tester intenta testear, pero todos entendieron algo distinto.

➡️ Con Gherkin, el PO puede definir claramente los requerimientos con sintaxis estructurada. Todos entienden lo mismo, todos trabajan alineados. Esto mejora la calidad del software fortaleciendo el **conocimiento compartido**.

---

## 📝 User Stories + Gherkin

**User Story:**

> Como cliente, quiero poder comprar productos en la web.

Las historias de usuario son una descripción informal de una funcionalidad escrita desde la perspectiva del usuario. Deben incluir:

* Rol o actor involucrado
* Condiciones o pre-requisitos
* Acción a ejecutar
* Resultado esperado

**Acceptance Criteria (versión Gherkin):**

```gherkin
Given el cliente está en la página del producto
And hay stock disponible
When hace clic en "Agregar al carrito"
Then el producto se agrega al carrito
And se muestra un mensaje de confirmación
```

---

## 🧪 Testear con Gherkin

* Manual o automatizado.
* Los escenarios Gherkin reemplazan o complementan los planes de testing.
* Los tests automáticos no reemplazan al equipo: lo potencian.
* Mejoran el ciclo de vida de testing y ayudan con pruebas de regresión.
* Los requisitos de negocio se incorporan directamente en los tests.

---

## 📚 Estructura del Lenguaje Gherkin

Gherkin es una gramática estructurada con reglas claras, escrita en lenguaje humano, que puede traducirse directamente a tests automáticos.

### 📌 Feature

Describe una **característica del sistema** (puede ser una épica o conjunto de historias).

```gherkin
Feature: Carrito de compras
  Permite agregar productos al carrito y proceder al checkout
```

Cada feature puede tener:

1. **Resumen**: línea que resume la funcionalidad.
2. **Descripción**: opcional pero recomendada, para mayor claridad.
3. **Lista de escenarios**: todos los casos que cubren la feature.

### 📌 Scenario

Un escenario concreto que valida una regla de negocio. Alias en algunos entornos: `Example`.

```gherkin
Scenario: Cliente agrega producto al carrito
  Given el cliente está logueado
  When hace clic en "Agregar al carrito"
  Then el producto aparece en el carrito
```

### 📌 Keywords principales:

| Palabra clave | Descripción                    |
| ------------- | ------------------------------ |
| `Feature`     | Característica o épica         |
| `Scenario`    | Flujo o caso de uso            |
| `Given`       | Estado inicial o contexto      |
| `When`        | Acción del usuario o sistema   |
| `Then`        | Resultado esperado             |
| `And`         | Paso adicional                 |
| `But`         | Resultado negativo o excepción |
| `*`           | Atajo para listas repetitivas  |

### 📌 Keywords avanzadas

#### Background

Usado para evitar repetir `Given` en todos los escenarios.

```gherkin
Background:
  Given el usuario está logueado
  And tiene permisos de compra
```

#### Scenario Outline + Examples

Permite ejecutar un mismo escenario con distintos datos.

```gherkin
Scenario Outline: Agregar productos con stock
  Given el producto tiene stock de <stock>
  When el usuario agrega <cantidad> al carrito
  Then el stock restante es <restante>

Examples:
  | stock | cantidad | restante |
  |  10   |    2     |    8     |
  |   8   |    3     |    5     |
```

#### Rule

Agrupa escenarios relacionados bajo una misma lógica de negocio. Es opcional pero útil para estructurar features complejas.

#### @tags

Permiten filtrar, agrupar y categorizar features y escenarios.

```gherkin
@checkout @smoke @release-2.1
Scenario: Checkout con usuario logueado
```

Tags útiles: `@daily`, `@important`, `@ignore`, `@priority`, `@weekly`, etc.

---

## 🧩 Extras

### Comentarios

```gherkin
# Este escenario valida el proceso de compra
Scenario: Cliente completa el checkout
```

⚠️ No se pueden poner comentarios al final de una línea de paso.

### Doc Strings

```gherkin
"""
Este es un texto largo con formato específico
y múltiples líneas.
"""
```

### Data Tables

```gherkin
Given los siguientes productos:
  | Producto | Stock | Carrito |
  | TV       | 1     | 1       |
  | Fridge   | 10    | 2       |
```

### Soporte Multilenguaje

```gherkin
# language: es
Funcionalidad: Comprar producto
```

---

## 📁 Este Repositorio

Incluye un archivo `gherkin.feature` con ejemplos reales como:

* Agregar al carrito.
* Validaciones según stock.
* Login y registro.
* Eliminación de ítems.
* Checkout.

Utiliza `Background`, `Tags`, `Scenario Outline`, `Data Tables`, `Doc Strings`, y más.

> Explorá el archivo `gherkin.feature` para ver todo en contexto real.

---

## 🚀 Conclusión

**Gherkin** te permite escribir especificaciones que:

* Se entienden fácilmente.
* Se testean automáticamente.
* Documentan el sistema.
* Mejoran la calidad del producto.

✅ Si estás usando BDD, **Gherkin no es opcional, es fundamental.**

---

## 🔗 Recursos adicionales

* [Cucumber Docs](https://cucumber.io/docs/cucumber/)
* [Gherkin Syntax](https://cucumber.io/docs/gherkin/)
* [Cucumber GitHub](https://github.com/cucumber)

---

Hecho con 💻 y pasión por la automatización.
