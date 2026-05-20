import 'dart:io';

void main() {
  print('사전 로딩 중...');
  File file = File('kr_korean.csv');

  List<String> lines = file.readAsLinesSync();
  Set<String> dictionary = {};

  for (String line in lines) {
    List<String> parts = line.split(',');

    if (parts.length >= 2) {
      String cleaned = parts[0].replaceAll('-', '');
      List<String> words = cleaned.split('^');

      for (String word in words) {
        if (word.length >= 2) {
          dictionary.add(word);
        }
      }
    }
  }

  print('사전 로딩 완료! 단어 수: ${dictionary.length}');
  print('게임을 종료하려면 \'exit\'을 입력해주세요.');
  print('시작 단어를 입력해주세요 :');

  List<String> used = [];
  String pre;
  while (true) {
    pre = (stdin.readLineSync() ?? '').trim();
    if (pre.isEmpty) {
      print('공백은 입력할 수 없습니다.');
      continue;
    }

    if (pre.length < 2) {
      print('두 글자 이상 입력해주세요.');
      continue;
    }

    if (!dictionary.contains(pre)) {
      print('존재하지 않는 단어입니다.');
      continue;
    }

    break;
  }

  if (pre == 'exit') {
    print('게임 종료!');
    return;
  }

  used.add(pre);
  String c = pre[pre.length - 1];
  while (true) {
    print('\n\'$c\' : ');
    String cur = (stdin.readLineSync() ?? '').trim();

    if (cur == 'exit') {
      print('게임 종료!');
      break;
    }

    if (cur.isEmpty) {
      print('공백은 입력할 수 없습니다.');
      continue;
    }

    if (cur.length < 2) {
      print('두 글자 이상 입력해주세요.');
      continue;
    }

    print('\n입력한 단어 : $cur');

    if (!dictionary.contains(cur)) {
      print('존재하지 않는 단어입니다.');
      continue;
    }

    if (used.contains(cur)) {
      print('이미 사용된 단어입니다. 다시 입력해주세요.');
      continue;
    }
    if (cur[0] == c) {
      print('성공!');
      used.add(cur);
      c = cur[cur.length - 1];
    } else {
      print('끝말이 이어지지 않습니다.');
    }
  }
  print('\n입력된 단어 수 : ${used.length}}');
  print(used);
}
