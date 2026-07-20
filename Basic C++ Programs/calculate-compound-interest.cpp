/*
Program: Calculate Compound Interest
Description: Calculates the required interest value.
*/

#include <bits/stdc++.h>
using namespace std;

int main() {
    double p, r, t;
    cout << "Enter Principle Amt, Rate and Time = ";
    cin >> p >> r >> t;
    
    double a = p * ((pow((1 + r / 100), t)));
    double CI = a - p;
    
    cout << "Compound Interest is = " << CI << endl;
    return 0;
}
