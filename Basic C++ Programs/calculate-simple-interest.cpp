/*
Program: Calculate Simple Interest
Description: Calculates the required interest value.
*/

#include <bits/stdc++.h>
using namespace std;

int main() {
  int p, r, t;
  cout << "Enter principle amt, rate and time = ";
  cin >> p >> r >> t;

  int si = (p*r*t) / 100

  cout << "Simple Interest is = " << si;
  return 0;
}

