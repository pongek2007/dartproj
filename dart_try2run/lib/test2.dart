import 'dart:io';

void main() {
  stdout.write('กรุณาป้อนอายุ: ');
  
  // ใช้ int.parse เพื่อแปลง String เป็น int
  int age = int.parse(stdin.readLineSync()!); 
  
  print('ปีหน้าคุณจะมีอายุ: ${age + 1} ปี');
}
