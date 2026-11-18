// Student: Sam Nkurunziza
// Reg no: 31064
const String regNo = '31064';
final int $d = int.parse(regNo[regNo.length - 1]);
final int $t = int.parse(regNo.substring(regNo.length - 2));

// by SN
int momoFee(int amount) {
  if (amount <= 0) return -1;
  if (amount <= 1000) return 20;
  if (amount <= 10000) return 100;
  if (amount <= 150000) return 250;
  return 1500;
}

// by SN
String formatRwf(int amount) {
  String sign = '';
  int workingAmount = amount;
  if (amount < 0) {
    sign = '-';
    workingAmount = -amount;
  }
  
  String str = workingAmount.toString();
  String result = '';
  int count = 0;
  
  int i = str.length - 1;
  while (i >= 0) {
    result = str[i] + result;
    count++;
    if (count % 3 == 0 && i > 0) {
      result = ',' + result;
    }
    i--;
  }
  return '$sign$result RWF';
}

// by SN
bool isValidPin(String pin) {
  if (pin.length != 5) return false;
  if (pin == '12345') return false;
  
  bool allSame = true;
  int i = 1;
  while (i < pin.length) {
    if (pin[i] != pin[0]) {
      allSame = false;
      break;
    }
    i++;
  }
  if (allSame) return false;

  i = 0;
  while (i < pin.length) {
    int? digit = int.tryParse(pin[i]);
    if (digit == null) return false;
    i++;
  }
  
  return true;
}

// by SN
int sendMoney(int balance, int amount) {
  int fee = momoFee(amount);
  if (fee == -1) {
    print('Failed: invalid amount');
    return balance;
  }
  if (amount + fee > balance) {
    print('Failed: insufficient balance');
    return balance;
  }
  int newBalance = balance - (amount + fee);
  print('Sent ${formatRwf(amount)} (fee ${formatRwf(fee)}). New balance: ${formatRwf(newBalance)}');
  return newBalance;
}

// by SN
int buyAirtime(int balance, int amount) {
  if (amount < 100 || amount > 50000) {
    print('Failed: invalid airtime amount');
    return balance;
  }
  if (amount > balance) {
    print('Failed: insufficient balance');
    return balance;
  }
  int newBalance = balance - amount;
  print('Bought airtime ${formatRwf(amount)}. New balance: ${formatRwf(newBalance)}');
  return newBalance;
}

void main() {

  print('Reg no: $regNo | D=${$d} | T=${$t}');
  
  print(isValidPin('12345'));
  print(isValidPin('77777'));
  print(isValidPin('48214'));
  print(isValidPin('48a21'));
  print(isValidPin('4821D'));

  int balance = 20000 + $t * 500;
  print('Starting balance: ${formatRwf(balance)}');

  int sendAmt = ($d + 1) * 3000;
  int i = 0;
  while (i < 3) {
    balance = sendMoney(balance, sendAmt);
    i++;
  }

  balance = buyAirtime(balance, 1000);
  balance = sendMoney(balance, 0);
  balance = sendMoney(balance, 200000);

  print('Final balance: ${formatRwf(balance)}');

  print(formatRwf(1250000));
  print(formatRwf(-5000));
  print(isValidPin('00000'));
  print(isValidPin('98765'));
  print(isValidPin('1234'));
}