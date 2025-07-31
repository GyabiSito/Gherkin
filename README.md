# 🥒 Gherkin & BDD: Documentando el comportamiento del sistema como se debe

## ¿Qué es BDD?

**BDD** (Behavior Driven Development) es una metodología de desarrollo de software que promueve la colaboración entre **desarrolladores, testers y miembros del negocio**. En vez de enfocarnos en cómo funciona el código, nos enfocamos en **cómo debería comportarse el sistema**.

### 🧠 Beneficios de BDD:

* Favorece un entendimiento profundo del problema antes de escribir una sola línea de código.
* Genera **feedback continuo** gracias a iteraciones pequeñas y testeables.
* Produce documentación viva que **describe el comportamiento real del sistema**.
* Une al equipo (QA, Dev, PO, Analistas) bajo un mismo lenguaje.

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
* Cucumber lo interpreta para ejecutar los tests correspondientes.
* Está disponible en más de 70 idiomas y es extremadamente versátil.

---

## 🤔 ¿Por qué aprender Gherkin?

* Esencial para implementar BDD con herramientas como Cucumber.
* Usado tanto por testers como por analistas y developers.
* Mejora la calidad del software **reduciendo malentendidos**.
* Funciona como documentación funcional viva del sistema.
* Favorece el desarrollo basado en comportamiento y no en implementación.

---

## 🧠 Gherkin como lenguaje universal

Supongamos que trabajás en una empresa (como ACME). Hay una reunión entre el CEO, un dev y Steve (el QA Manager). El CEO larga los requerimientos de forma informal, el dev toma notas, el tester intenta testear, pero todos entendieron algo distinto.

¿Resultado? ❌ Tests fallan por malentendidos.

¿Solución? ✅ Usar Gherkin para que el PO escriba los criterios de aceptación **claros, concretos y automatizables**. Todo el equipo habla el mismo idioma.

---

## 📜 User Stories + Gherkin

**User Story:**

> Como cliente, quiero comprar un producto para que me llegue a casa.

**Acceptance Criteria (versión Gherkin):**

```gherkin
Given el cliente está en la página del producto  
And el producto tiene stock  
When hace clic en "Agregar al carrito"  
Then el producto se agrega al carrito  
And se muestra un mensaje de confirmación
```

---

## 🧪 Testear con Gherkin

* Se puede testear manualmente o de forma automatizada.
* Los requerimientos se integran directamente en el plan de pruebas.
* Automatizar estos escenarios mejora el ciclo de testing y reduce regresiones.
* Sirve tanto en Scrum como en Kanban o cualquier flujo ágil.

---

## 📚 Estructura del lenguaje Gherkin

### 🔹 Feature

Describe una **característica del sistema**.

```gherkin
Feature: Carrito de compras
  Permite agregar productos al carrito y proceder al checkout
```

### 🔹 Scenario

Un flujo específico que describe un caso de uso puntual.

```gherkin
Scenario: Agregar un producto al carrito
  Given el cliente está logueado
  When agrega el producto al carrito
  Then el producto aparece en el carrito
```

### 🔹 Keywords principales

| Palabra clave | Descripción                                |
| ------------- | ------------------------------------------ |
| `Feature`     | Característica o épica                     |
| `Scenario`    | Flujo o caso de uso                        |
| `Given`       | Estado inicial                             |
| `When`        | Acción del usuario o sistema               |
| `Then`        | Resultado esperado                         |
| `And`         | Paso adicional                             |
| `But`         | Resultado alternativo o negativo           |
| `*`           | Puede reemplazar `And` si hay muchos pasos |

### 🔹 Background

Define un contexto compartido por todos los escenarios de una feature.

```gherkin
Background:
  Given el usuario está logueado
  And tiene permisos de compra
```

### 🔹 Scenario Outline + Examples

Permite reutilizar el mismo escenario con distintos datos.

```gherkin
Scenario Outline: Stock vs Carrito
  Given hay <stock> unidades de producto
  When agrego <cantidad> al carrito
  Then quedan <restante> unidades

  Examples:
    | stock | cantidad | restante |
    | 10    | 2        | 8        |
    | 5     | 1        | 4        |
```

### 🔹 Tags

Sirven para agrupar, filtrar o categorizar escenarios:

```gherkin
@checkout @regression @release-2.1
Scenario: Checkout con usuario logueado
```

### 🔹 Comentarios

Se usa `#` al inicio de línea. No se puede usar al final de un paso.

```gherkin
# Este test valida el login exitoso
Scenario: ...
```

### 🔹 Doc Strings

Permite agregar bloques largos de texto:

```
"""
Texto con
varias líneas
"""
```

### 🔹 Data Tables

Útil para representar datos estructurados en los pasos:

```gherkin
Given los siguientes productos:
  | Producto | Stock |
  | TV       | 5     |
  | Heladera | 2     |
```

### 🔹 Soporte Multilenguaje

```gherkin
# language: es
Funcionalidad: Comprar producto
```

---

## 📁 Este Repositorio

Incluye un archivo `gherkin.feature` con ejemplos como:

* Agregar al carrito.
* Validaciones con stock.
* Login y registro.
* Eliminación de ítems.
* Uso de `Background`, `Tags`, `Scenario Outline`, `Data Tables`, etc.

Explorá el archivo para ver todo esto en acción.

---

## 🚀 Conclusión

**Gherkin** permite documentar comportamientos de forma clara, compartida y testeable. Te ayuda a:

✅ Definir qué debe hacer el sistema.
✅ Verificar automáticamente que lo haga.
✅ Comunicarte mejor entre todos los roles del equipo.

¿Estás usando BDD? Entonces **Gherkin no es opcional, es fundamental.**

---

## 🔗 Recursos adicionales

* [Cucumber Docs](https://cucumber.io/docs/cucumber/)
* [Gherkin Syntax](https://cucumber.io/docs/gherkin/)
* [Cucumber GitHub](https://github.com/cucumber)

---
