# About

[![Build Status](https://travis-ci.org/alexeynobody/translit-dart.svg?branch=master)](https://travis-ci.org/alexeynobody/translit-dart)

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
