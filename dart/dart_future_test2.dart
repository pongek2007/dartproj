import 'dart:async';
import 'dart:math';
Future<void> main() async {
  
  print('start ...');
  await random_number();
  print('finish');

}

int value= 0;
Future<void> random_number() async{
  
  
  value = 0;
  print('Before random -> value = $value');

  value = await Future<int>.delayed(Duration(seconds: 3),() => Random().nextInt(1000000));

  print('after random -> value = $value');
}



