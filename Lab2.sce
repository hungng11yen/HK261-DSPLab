// Clear previous figures and variables
clear;
clf;

// Bai tap 2
n = -5:5;
msignal = bool2s (n => 0);
plot2d3(n, msignal);

// Bai tap 3
n = -5:5;
msignal = bool2s (n == 0);
plot2d3(n, msignal);

// Bai tap 4
n = -5:5;
ur = n .* bool2s(n >= 0); 

clf;
plot2d3(n, ur, style = 2);
title('Unit Ramp Signal ur(n)');
xlabel('n');
ylabel('Biên độ');
xgrid();

// Bai tap 5
n = -1:1;
x = [1, 3, -2];

// Tao tin hieu gap x(-n)
x_flip = x($:-1:1); 

xe = 0.5 * (x + x_flip);
xo = 0.5 * (x - x_flip);

clf;
subplot(3, 1, 1);

//original
plot2d3(n, x, style = 2);
title('Tín hiệu gốc x(n)'); xlabel('n'); ylabel('Biên độ');
//even
subplot(3, 1, 2);
plot2d3(n, xe, style = 3);
title('Thành phần chẵn xe(n)'); xlabel('n'); ylabel('Biên độ');
//odd
subplot(3, 1, 3);
plot2d3(n, xo, style = 4);
title('Thành phần lẻ xo(n)'); xlabel('n'); ylabel('Biên độ');

// Bai tap 6
clf;
n = -1:3;
x1 = [0 0 1 3 -2]; // Đệm 0 ở vị trí n = -1
x2 = [0 1 2 3 0];  // Giá trị 0 đầu tiên nằm ở n = -1, đệm 0 ở n = 3
y_add = x1 + x2;

// x1(n)
subplot(3, 1, 1);
plot2d3(n, x1, style=2);
xtitle("Signal x1(n)", "n", "x1(n)");
xgrid();

// x2(n)
subplot(3, 1, 2);
plot2d3(n, x2, style=5);
xtitle("Signal x2(n)", "n", "x2(n)");
xgrid();

// y(n) = x1(n) + x2(n)
subplot(3, 1, 3);
plot2d3(n, y_add, style=3);
xtitle("Sum Signal y(n) = x1(n) + x2(n)", "n", "x1(n) + x2(n)");
xgrid();


// Bai tap 7
clf;
y_mul = x1 .* x2;

// x1(n)
subplot(3, 1, 1);
plot2d3(n, x1, style=2);
xtitle("Signal x1(n)", "n", "x1(n)");
xgrid();

// x2(n)
subplot(3, 1, 2);
plot2d3(n, x2, style=5);
xtitle("Signal x2(n)", "n", "x2(n)");
xgrid();

// y(n) = x1(n) * x2(n)
subplot(3, 1, 3);
plot2d3(n, y_mul, style=3);
xtitle("Product Signal y(n) = x1(n) * x2(n)", "n", "x1(n) * x2(n)");
xgrid();

// Bai tap 8
nx = -2:1;
x = [1 -2 3 6];
// Gap tin hieu y1(n) = x(-n)
ny1 = -nx($:-1:1);
y1 = x($:-1:1);
clf;
subplot(2, 1, 1);
plot2d3(nx, x, style=2);
xtitle("Original signal x(n)", "n", "x(n)");
xgrid();

subplot(2, 1, 2);
plot2d3(ny1, y1, style=3);
xtitle("y1(n) = x(-n)", "n", "y1(n)");
xgrid();

// ------------------------------------------
// advance 3 don vi:  y2(n) = x(n+3)
ny2 = nx - 3;
y2 = x; 

clf;
subplot(2, 1, 1);
plot2d3(nx, x, style=2);
xtitle("Original signal x(n)", "n", "x(n)");
xgrid();

subplot(2, 1, 2);
plot2d3(ny2, y2, style=4);
xtitle("y2(n) = x(n+3)", "n", "y2(n)");
xgrid();

// ------------------------------------------
// delay 2 don vi va khuech dai 2 lan: y3(n) = 2x(-n-2)
ny3 = -nx($:-1:1) - 2;
y3 = 2 * x($:-1:1);

clf;
subplot(2, 1, 1);
plot2d3(nx, x, style=2);
xtitle("Original signal x(n)", "n", "x(n)");
xgrid();

subplot(2, 1, 2);
plot2d3(ny3, y3, style=5);
xtitle("y3(n) = 2x(-n-2)", "n", "y3(n)");
xgrid();
