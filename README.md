# Translit
Simple dart package for converting Cyrillic symbols to Translit and back

Reverse transliteration into Cyrillic can not always completely convert the text to the original. Please keep this in mind when using this module in your projects.

---

## Links

- See [CHANGELOG.md](./CHANGELOG.md) for major/breaking updates
- [Example](./example/) with explain all features


## Installation

```sh
$ dart pub add translit
```sh

```sh
$ flutter pub add --dev translit
```


## Usage

### Convert text to translit

```dart
String text = Translit().toTranslit(source: 'Привет мир');
```

Привет мир > Privet mir!


### Convert text from transliterated

```dart
String text = Translit().unTranslit(source: 'Privet mir');
```

Privet mir > Привет мир

## Contribute

Please feel free to fork, improve, make pull requests or fill issues.
I'll be glad to fix bugs you encountered or improve the extension.
