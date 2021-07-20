# [Effective Dart](https://dart.dev/guides/language/effective-dart)

- Style
  - Identifiers
  - Ordering
  - Formatting
- Documentation
  - Comments
  - Doc comments
  - Markdown
  - Writing
- Usage
  - Libraries
  - Null
  - Strings
  - Collections
  - Functions
  - Variables
  - Members
  - Constructors
  - Error handling
  - Asynchrony
- Design
  - Names
  - Libraries
  - Classes and mixins
  - Constructors
  - Members
  - Types
  - Parameters
  - Equality

A *mixin* describes the difference between a class and its superclass. A mixin
is either derived from an existing class declaration or introduced by a mixin
declaration.

## [Style](https://dart.dev/guides/language/effective-dart/style)

### Identifiers

### Ordering

### Formatting

## [Documentation](https://dart.dev/guides/language/effective-dart/documentation)

### Comments

### Doc comments

### Markdown

### Writing

## [Usage](https://dart.dev/guides/language/effective-dart/usage)

### Libraries

### Null

### Strings

### Collections

### Functions

### Variables

### Members

### Constructors

### Error handling

### Asynchrony

## [Design](https://dart.dev/guides/language/effective-dart/design)

### Names

### Libraries

### Classes and mixins

### Constructors

### Members

### Types

You can *type annotate* a variable, parameter, field, or return type. In the following example, `bool` and `String` are type annotations.

```dart
bool isEmpty(String parameter) {
  bool result = parameter.isEmpty;
  return result;
}
```

Type annotations are optional in Dart. If you omit one, Dart tries to *infer* a type based on the nearby context.

#### DON’T redundantly type annotate initialized local variables.

Local variables, especially in modern code where functions tend to be small, have very little scope. Omitting the type focuses the reader’s attention on the more important name of the variable and its initialized value.

```dart
// good
var desserts = <List<Ingredient>>[];
for (var recipe in cookbook) {
    ....
}
// bad
List<List<Ingredient>> desserts = <List<Ingredient>>[];
for (List<Ingredient> recipe in cookbook) {
    ....
}
```

#### DO type annotate variables without initializers

The type of a variable —top-level, local, static field, or instance field— can often be inferred from its initializer. However, if there is no initializer, inference fails.

```dart
// good
List<AstNode> parameters;

// bad
var parameters;
```


### Parameters

### Equality
