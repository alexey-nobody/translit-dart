import 'package:translit/translit.dart';

main() {
  String forTransliterate =
      'Есть много вариантов Lorem Ipsum, но большинство из них имеет не всегда приемлемые модификации, например, юмористические вставки или слова, которые даже отдалённо не напоминают латынь. Если вам нужен Lorem Ipsum для серьёзного проекта, вы наверняка не хотите какой-нибудь шутки, скрытой в середине абзаца. Также все другие известные генераторы Lorem Ipsum используют один и тот же текст, который они просто повторяют, пока не достигнут нужный объём. Это делает предлагаемый здесь генератор единственным настоящим Lorem Ipsum генератором. Он использует словарь из более чем 200 латинских слов, а также набор моделей предложений. В результате сгенерированный Lorem Ipsum выглядит правдоподобно, не имеет повторяющихся абзацей или "невозможных" слов.';

  String translited = Translit().toTranslit(source: forTransliterate);
  String unTranslited = Translit().unTranslit(source: translited);

  print('Original text - $forTransliterate');
  print('Cyrilic to translit - $translited');
  print('Translit to cyrilic - $unTranslited');
}
