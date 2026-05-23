import 'dart:io'; // 1. ต้อง import library นี้

void main() {
  stdout.write('กรุณาป้อนข้อความ: '); // แสดงข้อความโดยไม่ขึ้นบรรทัดใหม่
  
  // 2. ใช้ stdin.readLineSync() รับค่า
  String? input = stdin.readLineSync(); 
  
  print('คุณป้อน: $input');
}
