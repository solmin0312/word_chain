import 'dart:io';

void main() {
  File file = File('kr_korean.csv');

  List<String> lines = file.readAsLinesSync();
  Set<String> dictionary = {};

  for (String line in lines) {
    List<String> parts = line.split(',');

    if (parts[1] == '명사') {
      dictionary.add(parts[0]);
    }
  }

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

    break;
  }
  used.add(pre);
  String c = pre[pre.length - 1];
  while (true) {
    print('\n\'$c\' : ');
    String cur = (stdin.readLineSync() ?? '').trim();
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
      print('실패..');
      break;
    }
  }
  print('입력된 단어 :\n');
  print(used);
}
