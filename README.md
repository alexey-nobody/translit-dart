# About

[![Build Status](https://travis-ci.org/alexeynobody/translit-dart.svg?branch=master)](https://travis-ci.org/alexeynobody/translit-dart)

[View in pub.dev](https://pub.dev/packages/translit)

Simple dart package for converting Cyrillic symbols to Translit and back

Reverse transliteration into Cyrillic can not always completely convert the text to the original. Please keep this in mind when using this module in your projects.

## Examples

```dart
  Translit().toTranslit(source: 'Привет мир');

  >Privet mir!
```

```dart
  Translit().unTranslit(source: 'Privet mir');

  >Привет мир!
```
