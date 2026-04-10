#include <iostream>
#include <chrono> // модуль для подсчета времени
#include <Windows.h> // Нужно для SetConsoleOutputCP

using namespace std;

double f(double x) {
    return x * x - x * x + x*4 - x*5 + x + x;
}

int time() {

    int n;
    cout << "enter the num of iterations: ";

    if (cin >> n) {
        
        if (n < 0) {
            cout << "ERROR: your num < 0\n";
            return 1;
        }

        double x = 5;

        auto start = chrono::high_resolution_clock::now();

        for (int i = 0; i < n; i++) {
            f(x);
        }

        auto end = chrono::high_resolution_clock::now();

        auto duration_us = chrono::duration_cast<chrono::microseconds>(end - start);

        cout << "time: " << duration_us.count() << " \u00B5s\n";

        return 0;

    }

    else {

        cout << "ERROR: restart and enter uint num!!\n";
        return 1;

    }
}

int main() {

    SetConsoleOutputCP(65001);

    char s;
    int t;

    do {
        t = time();
        if (t == 0) {
            cout << "run again? (y/n): "; 
            cin >> s;
        }
    } while (s == 'y' && t == 0);
    
}