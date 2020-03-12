# About

[![Build Status](https://travis-ci.org/alexeynobody/translit-dart.svg?branch=master)](https://travis-ci.org/alexeynobody/translit-dart)

Simple dart package for converting Cyrillic symbols to Translit and back

Reverse transliteration into Cyrillic can not always completely convert the text to the original. Please keep this in mind when using this module in your projects.

## Examples

### Convert text to translit

```dart
import 'package:translit/translit.dart';

String text = Translit().toTranslit(source: 'Привет мир');
```

Привет мир > Privet mir!


### Convert text from transliterated

```dart
import 'package:translit/translit.dart';

String text = Translit().unTranslit(source: 'Privet mir');
```

Privet mir > Привет мир!

## Contribute

Please feel free to fork, improve, make pull requests or fill issues. I'll be glad to fix bugs you encountered or improve the extension.
