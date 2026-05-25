import 'dart:math';
void main() {
  final numbers = <int>[1000000, 1000, 1000, 1000, 1000, 100 ];
  final randNumbers = List.generate(numbers.length, (_) => Random().nextInt(1000000));
  for (var i = 0; i < numbers.length; i++) {
    randNumbers[i] = Random().nextInt(numbers[i]);
  }
  print(numbers);
  print(randNumbers);
}
  