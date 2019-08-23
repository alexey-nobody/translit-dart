library translit;

class Translit {
  static final Translit _translit = new Translit._internal();

  factory Translit() {
    return _translit;
  }

  Translit._internal();

  Map _transliteratedSymbol = {
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

  Map _complicatedSymbols = {
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

  String unTranslit({String source}) {
    if (source == null || source.isEmpty) return source;

    List<String> sourceSymbols = new List();
    List<String> unTranslit = new List();

    Map deTransliteratedSymbol = new Map();

    // replace complicated symbols
    _complicatedSymbols.forEach((key, value) {
      source = source.replaceAll(value, key);
    });

    sourceSymbols = source.split("");

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

  String toTranslit({String source}) {
    if (source == null || source.isEmpty) return source;

    List<String> translit = new List();
    List<String> sourceSymbols = new List();

    // to translit
    sourceSymbols = source.split("");

    // merge map of symbols
    _transliteratedSymbol.addAll(_complicatedSymbols);

    for (final element in sourceSymbols) {
      translit.add(_transliteratedSymbol.containsKey(element)
          ? _transliteratedSymbol[element]
          : element);
    }

    return translit.join();
  }
}
