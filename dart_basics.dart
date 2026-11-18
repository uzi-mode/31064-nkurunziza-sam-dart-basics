// Student: Sam Nkurunziza
// Reg no: 31064
const String regNo = '31064';
final int $d = int.parse(regNo[regNo.length - 1]);
final int $t = int.parse(regNo.substring(regNo.length - 2));

// B2: Count vowels
int countVowels(String text) {
  // by SN
  final lowered = text.toLowerCase();
  int count = 0;
  for (int i = 0; i < lowered.length; i++) {
    const vowels = 'aeiou';
    if (vowels.contains(lowered[i])) {
      count++;
    }
  }
  return count;
}

// B3: Initials
String initials(String fullName) {
  // by SN
  final trimmed = fullName.trim();
  if (trimmed.isEmpty) return '';

  final parts = trimmed.split(RegExp(r'\s+'));
  String result = '';
  for (int i = 0; i < parts.length; i++) {
    if (parts[i].isNotEmpty) {
      result += '${parts[i][0].toUpperCase()}.';
    }
  }
  return result;
}

// C5: Right-aligned triangle
void drawTriangle(int height) {
  // by SN
  if (height <= 0) return;
  for (int i = 1; i <= height; i++) {
    String spaces = ' ' * (height - i);
    String char = (i % 2 != 0) ? '*' : '#';
    String rowContent = char * i;
    print('$spaces$rowContent');
  }
}

// D2: MoMo tariff fee
int momoFee(int amount) {
  // by SN
  if (amount <= 0) return -1;
  if (amount <= 1000) return 20;
  if (amount <= 10000) return 100;
  if (amount <= 150000) return 250;
  return 1500;
}

// D2: Mask phone number
String maskPhone(String phone) {
  // by SN
  if (phone.length != 10) return 'INVALID';
  return '${phone.substring(0, 3)}*****${phone.substring(8)}';
}

void main() {
  // by SN
  print('Reg no: $regNo | D=${$d} | T=${$t}');

  String myName = 'Sam Nkurunziza';
  int vowelCount = countVowels(myName);
  print('$myName has $vowelCount vowels');

  print(initials(myName));
  print(initials('  ana   uwase  '));
  print(initials('   '));

  drawTriangle($d + 3);
  drawTriangle(0);
  drawTriangle(2);

  int i = 1;
  int totalFees = 0;
  while (i <= $d + 3) {
    int amount = i * 4000 + $t * 100;
    int fee = momoFee(amount);
    totalFees += fee;
    print('Receipt $i $amount RWF | fee $fee RWF | to ${maskPhone('0788123456')}');
    i++;
  }
  print('Total fees: $totalFees RWF');
}