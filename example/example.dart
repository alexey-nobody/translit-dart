import 'package:translit/translit.dart';

void main() {
  final forTransliterate =
      'Есть много вариантов Lorem Ipsum, но большинство из них имеет не всегда приемлемые модификации, например, юмористические вставки или слова, которые даже отдалённо не напоминают латынь. Если вам нужен Lorem Ipsum для серьёзного проекта, вы наверняка не хотите какой-нибудь шутки, скрытой в середине абзаца. Также все другие известные генераторы Lorem Ipsum используют один и тот же текст, который они просто повторяют, пока не достигнут нужный объём. Это делает предлагаемый здесь генератор единственным настоящим Lorem Ipsum генератором. Он использует словарь из более чем 200 латинских слов, а также набор моделей предложений. В результате сгенерированный Lorem Ipsum выглядит правдоподобно, не имеет повторяющихся абзацей или "невозможных" слов.';

  final transliterated = Translit().toTranslit(source: forTransliterate);
  final unTransliterated = Translit().unTranslit(source: transliterated);

  print('Original text - $forTransliterate');
  print('Cyrilic to translit - $transliterated');
  print('Translit to cyrilic - $unTransliterated');
}
