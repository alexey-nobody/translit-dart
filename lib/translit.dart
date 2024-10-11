/// Simple dart package for converting Cyrillic symbols to Translit and back
class Translit {
  final _transliteratedSymbol = <String, String>{
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

  final _complicatedSymbols = <String, String>{
    'Ё': 'Yo',
    'Ж': 'Zh',
    'Щ': 'Shch',
    'Ш': 'Sh',
    'Ч': 'Ch',
    'Э': "Eh'",
    'Ю': 'Yu',
    'Я': 'Ya',
    'ё': 'yo',
    'ж': 'zh',
    'щ': 'shch',
    'ш': 'sh',
    'ч': 'ch',
    'э': "eh'",
    'ъ': '"',
    'ь': "'",
    'ю': 'yu',
    'я': 'ya',
  };

  /// Method for converting from translit to Cyrillic for the [source] value
  ///
  /// [source] is a string which contains the text in translit.
  ///
  /// The method returns a string with characters in Cyrillic.
  ///
  /// If [source] is empty, an empty string is returned.
  /// If [source] does not contain any symbols in translit, [source] is returned unchanged.
  String unTranslit({required String source}) {
    if (source.isEmpty) return source;

    final regExp = RegExp('([a-z]+)', caseSensitive: false, multiLine: true);

    if (!regExp.hasMatch(source)) return source;

    final sourceSymbols = <String>[];
    final unTranslit = <String>[];
    final deTransliteratedSymbol = <String, String>{};

    _complicatedSymbols.forEach((key, value) {
      source = source.replaceAll(value, key);
    });

    sourceSymbols.addAll(source.split(''));

    _transliteratedSymbol.forEach((key, value) {
      deTransliteratedSymbol[value] = key;
    });

    for (final element in sourceSymbols) {
      final transElement = deTransliteratedSymbol.containsKey(element)
          ? deTransliteratedSymbol[element] ?? ''
          : element;
      unTranslit.add(transElement);
    }

    return unTranslit.join();
  }

  /// Method for converting from Cyrillic to translit for the [source] value
  ///
  /// [source] is a string which contains the text in Cyrillic.
  ///
  /// The method returns a string with characters in translit.
  ///
  /// If [source] is empty, an empty string is returned.
  /// If [source] does not contain any characters in Cyrillic, [source] is returned unchanged.
  String toTranslit({required String source}) {
    if (source.isEmpty) return source;

    final regExp = RegExp(
      '([а-я]+)',
      caseSensitive: false,
      multiLine: true,
    );

    if (!regExp.hasMatch(source)) return source;

    final translit = <String>[];
    final sourceSymbols = <String>[...source.split('')];

    _transliteratedSymbol.addAll(_complicatedSymbols);

    for (final element in sourceSymbols) {
      final transElement = _transliteratedSymbol.containsKey(element)
          ? _transliteratedSymbol[element] ?? ''
          : element;
      translit.add(transElement);
    }

    return translit.join();
  }
}
