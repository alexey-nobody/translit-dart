library translit;

/// Simple dart package for converting Cyrillic symbols to Translit and back
class Translit {
  final Map _transliteratedSymbol = {
    'А': 'A',
    'Б': 'B',
    'В': 'V',
    'Г': 'G',
    'Д': 'D',
    'Е': 'E',
    'З': 'Z',
    'И': 'I',
    'Й': 'J',
    'К': 'K',
    'Л': 'L',
    'М': 'M',
    'Н': 'N',
    'О': 'O',
    'П': 'P',
    'Р': 'R',
    'С': 'S',
    'Т': 'T',
    'У': 'U',
    'Ф': 'F',
    'Х': 'H',
    'Ц': 'C',
    'Ы': 'Y',
    'а': 'a',
    'б': 'b',
    'в': 'v',
    'г': 'g',
    'д': 'd',
    'е': 'e',
    'з': 'z',
    'и': 'i',
    'й': 'j',
    'к': 'k',
    'л': 'l',
    'м': 'm',
    'н': 'n',
    'о': 'o',
    'п': 'p',
    'р': 'r',
    'с': 's',
    'т': 't',
    'у': 'u',
    'ф': 'f',
    'х': 'h',
    'ц': 'c',
    'ы': 'y',
    "'": '',
    '"': '',
  };

  final Map _complicatedSymbols = {
    'Ё': 'Yo',
    'Ж': 'Zh',
    'Щ': 'Shhch',
    'Ш': 'Shh',
    'Ч': 'Ch',
    'Э': 'Eh\'',
    'Ю': 'Yu',
    'Я': 'Ya',
    'ё': 'yo',
    'ж': 'zh',
    'щ': 'shhch',
    'ш': 'shh',
    'ч': 'ch',
    'э': 'eh\'',
    'ъ': '"',
    'ь': "'",
    'ю': 'yu',
    'я': 'ya',
  };

  ///
  /// Method for converting from translit for the [source] value
  ///
  String unTranslit({String source}) {
    if (source == null || source.isEmpty) return source;

    var regExp = RegExp(
      r'([a-z]+)',
      caseSensitive: false,
      multiLine: true,
    );

    if (!regExp.hasMatch(source)) return source;

    var sourceSymbols = [];
    var unTranslit = [];
    var deTransliteratedSymbol = {};

    _complicatedSymbols.forEach((key, value) {
      source = source.replaceAll(value, key);
    });

    sourceSymbols = source.split('');

    _transliteratedSymbol.forEach((key, value) {
      deTransliteratedSymbol[value] = key;
    });

    for (final element in sourceSymbols) {
      unTranslit.add(deTransliteratedSymbol.containsKey(element)
          ? deTransliteratedSymbol[element]
          : element);
    }

    return unTranslit.join();
  }

  ///
  /// Method for converting to translit for the [source] value
  ///
  String toTranslit({String source}) {
    if (source == null || source.isEmpty) return source;

    var regExp = RegExp(
      r'([а-я]+)',
      caseSensitive: false,
      multiLine: true,
    );

    if (!regExp.hasMatch(source)) return source;

    var translit = [];
    var sourceSymbols = [];

    sourceSymbols = source.split('');

    _transliteratedSymbol.addAll(_complicatedSymbols);

    for (final element in sourceSymbols) {
      translit.add(_transliteratedSymbol.containsKey(element)
          ? _transliteratedSymbol[element]
          : element);
    }

    return translit.join();
  }
}
