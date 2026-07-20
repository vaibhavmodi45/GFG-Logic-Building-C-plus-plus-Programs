/*
Program: Area and Perimeter of Rectangle
Description: Calculates the rectangle dimensions and related values.
*/

#include <bits/stdc++.h>
using namespace std;

int main() {
  int l, b;
  cout << "Enter length and breadth of rectangle: ";
  cin >> l >> b;

  int area = l*b;
  int perimeter = 2*(l+b);

  cout << "Area is = " << area << endl;
  cout << "Perimeter is = " << perimeter << endl;
  
  return 0;
}

