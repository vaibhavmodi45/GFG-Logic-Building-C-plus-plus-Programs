/*
Program: Swap two numbers
Description: Swaps the provided values using the appropriate logic.
*/

#include <iostream>
using namespace std;

int main() {
  int a, b;
  cout << "Enter two numbers a & b = ";
  cin >> a >> b;

  //using third variable
  int temp = a;
  a = b;
  b = temp;

  // without third variable
  // a = a + b;
  // b = a - b;
  // a = a - b;

  cout << "After Swaping" << endl;
  cout << "a = " << a << " & b = " << b; 

  return 0;
}

