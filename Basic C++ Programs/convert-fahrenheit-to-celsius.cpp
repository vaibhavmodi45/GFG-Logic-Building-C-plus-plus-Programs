/*
Program: Convert Fahrenheit to Celsius
Description: Solves the problem using the appropriate logic.
*/

//Fahrenheit to Celsius Tempreture

#include <bits/stdc++.h>
using namespace std;

int main() {
    float temp;
    cout << "Enter Tempreture in Fehrenheit = ";
    cin >> temp;
    
    float temp_cel = (temp - 32) * (5.0 / 9.0);
    
    cout << "Tempreture in Celsius is = " << temp_cel << endl;
    return 0;
}
