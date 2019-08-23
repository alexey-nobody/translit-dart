# About

Simple dart package for converting Cyrillic symbols to Translit and back
No dependencies

## Examples

```dart
  Translit().toTranslit(source: 'Привет мир');

  >Privet mir!
```

```dart
  Translit().unTranslit(source: 'Privet mir');

  >Привет мир!
```
