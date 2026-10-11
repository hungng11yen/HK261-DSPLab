clc;
close;
clear;

// Bai tap 1
function [yn, yorigin] = delay (xn, xorigin, k)
    // th: k <= 0
    if k <= 0 then error ("Gia tri k khong hop le")
    end
    
    // copy tin hieu goc
    yn = xn;
    // goc toa do dich trai k don vi
    yorigin = xorigin - k;
    
    n_x = (1:length(xn)) - xorigin;  // truc thoi gian cua x(n)
    n_y = (1:length(yn)) - yorigin;  // truc thoi gian cua y(n)
    
    // ve do thi
    clf();
    
    // do thi x(n)
    subplot(2, 1, 1);
    plot2d3(n_x, xn);
    plot(n_x, xn, 'bo');
    xtitle('Tin hieu ban dau x(n)', 'n', 'Bien do');
    xgrid(1);
    
    // do thi y(n)
    subplot(2, 1, 2);
    plot2d3(n_y, yn);             
    plot(n_y, yn, 'ro');
    xtitle('Tin hieu delay y(n) = x(n - ' + string(k) + ')', 'n', 'Bien do');
    xgrid(1);
endfunction

[yn, yorigin] = delay([1,-2,3,6], 3, 1)

// Bai tap 2
function [yn, yorigin] = advance (xn, xorigin, k)
    // th: k <= 0
    if k <= 0 then error ("Gia tri k khong hop le")
    end
    
    // copy tin hieu goc
    yn = xn;
    // goc toa do dich phai k don vi
    yorigin = xorigin + k;
    
    n_x = (1:length(xn)) - xorigin;  // truc thoi gian cua x(n)
    n_y = (1:length(yn)) - yorigin;  // truc thoi gian cua y(n)
    
    // ve do thi
    clf();
    
    // do thi x(n)
    subplot(2, 1, 1);
    plot2d3(n_x, xn);
    plot(n_x, xn, 'bo');
    xtitle('Tin hieu ban dau x(n)', 'n', 'Bien do');
    xgrid(1);
    
    // do thi y(n)
    subplot(2, 1, 2);
    plot2d3(n_y, yn);             
    plot(n_y, yn, 'ro');
    xtitle('Tin hieu advance y(n) = x(n + ' + string(k) + ')', 'n', 'Bien do');
    xgrid(1);
endfunction

[yn, yorigin] = advance([-3,-1,2,6], 1, 2)

// Bai tap 3
function [yn, yorigin] = fold (xn, xorigin)
    // lat mang
    yn = xn($:-1:1);
    
    yorigin =  length(xn) - xorigin + 1;
    n_x = (1:length(xn)) - xorigin;  // truc thoi gian cua x(n)
    n_y = (1:length(yn)) - yorigin;  // truc thoi gian cua y(n)
     // ve do thi
    clf();
    
    // do thi x(n)
    subplot(2, 1, 1);
    plot2d3(n_x, xn);
    plot(n_x, xn, 'bo');
    xtitle('Tin hieu ban dau x(n)', 'n', 'Bien do');
    xgrid(1);
    
    // do thi y(n)
    subplot(2, 1, 2);
    plot2d3(n_y, yn);             
    plot(n_y, yn, 'ro');
    xtitle('Tin hieu gap y(n) = x(-n)', 'n', 'Bien do');
    xgrid(1);
endfunction

[yn, yorigin] = fold ([1,-2,3,6], 3)

// Bai tap 4
function [yn, yorigin] = add (x1n, x1origin, x2n, x2origin) 
    min_n = min(1 - x1origin, 1- x2origin); // index nho nhat cua 2 mang input
    max_n = max(length(x1n) - x1origin, length(x2n) - x2origin); // index lon nhat cua 2 mang input
    n = min_n : max_n; // tao mang index chung
    // gan 0 vao mang chung dung cho so hang 1
    y1 = zeros(1, length(n));
    // gan 0 vao mang chung dung cho so hang 2 
    y2 = zeros(1, length(n));
    // tim vi tri bat dau cua x1n va x2n trong mang chung
    pos1 = (1 - x1origin) - min_n + 1;
    pos2 = (1 - x2origin) - min_n + 1;
    // gan x1n vao so hang 1
    y1(pos1: pos1 + length(x1n) - 1) = x1n; 
    // gan x2n vao so hang 2
    y2(pos2: pos2 + length(x2n) - 1) = x2n;
    // phep cong
    yn = y1 + y2;
    yorigin = 1 -min_n
    
    n1 = (1:length(x1n)) - x1origin; //truc thoi gian cua x1n
    n2 = (1:length(x2n)) - x2origin; //truc thoi gian cua x2n
    // ve do thi
    clf();
    
    subplot(3, 1, 1);
    plot2d3(n1, x1n);
    plot(n1, x1n, 'bo');
    xtitle('Tin hieu x1(n)', 'n', 'Bien do');
    xgrid(1);
    
    subplot(3, 1, 2);
    plot2d3(n2, x2n);
    plot(n2, x2n, 'go');
    xtitle('Tin hieu x2(n)', 'n', 'Bien do');
    xgrid(1);
    
    subplot(3, 1, 3);
    plot2d3(n, yn);
    plot(n, yn, 'ro');
    xtitle('Tin hieu y(n) = x1(n) + x2(n)', 'n', 'Bien do');
    xgrid(1);
endfunction

[yn, yorigin] = add([0,1,3,-2], 1, [1,1,2,3], 2)

// Bai tap 5
function [yn, yorigin] = multi (x1n, x1origin, x2n, x2origin) 
    min_n = min(1 - x1origin, 1- x2origin); // index nho nhat cua 2 mang input
    max_n = max(length(x1n) - x1origin, length(x2n) - x2origin); // index lon nhat cua 2 mang input
    n = min_n : max_n; // tao mang index chung
    // gan 0 vao mang chung dung cho thua so 1
    y1 = zeros(1, length(n));
    // gan 0 vao mang chung dung cho thua so 2 
    y2 = zeros(1, length(n));
    // tim vi tri bat dau cua x1n va x2n trong mang chung
    pos1 = (1 - x1origin) - min_n + 1;
    pos2 = (1 - x2origin) - min_n + 1;
    // gan x1n vao so hang 1
    y1(pos1: pos1 + length(x1n) - 1) = x1n; 
    // gan x2n vao so hang 2
    y2(pos2: pos2 + length(x2n) - 1) = x2n;
    // phep nhan
    yn = y1 .* y2;
    yorigin = 1 -min_n
    
    n1 = (1:length(x1n)) - x1origin; //truc thoi gian cua x1n
    n2 = (1:length(x2n)) - x2origin; //truc thoi gian cua x2n
    // ve do thi
    clf();
    
    subplot(3, 1, 1);
    plot2d3(n1, x1n);
    plot(n1, x1n, 'bo');
    xtitle('Tin hieu x1(n)', 'n', 'Bien do');
    xgrid(1);
    
    subplot(3, 1, 2);
    plot2d3(n2, x2n);
    plot(n2, x2n, 'go');
    xtitle('Tin hieu x2(n)', 'n', 'Bien do');
    xgrid(1);
    
    subplot(3, 1, 3);
    plot2d3(n, yn);
    plot(n, yn, 'ro');
    xtitle('Tin hieu y(n) = x1(n) . x2(n)', 'n', 'Bien do');
    xgrid(1);
endfunction

[yn, yorigin] = multi([0,1,3,-2], 1, [1,1,2,3], 2)

// Bai tap 6
function [yn, yorigin] = convolution (xn, xorigin, hn, horigin)
// tinh tich chap
yn = convol(xn, hn);

// Cong thuc xac dinh vi tri goc cho phep tich chap
yorigin = xorigin + horigin - 1;

// Tao truc thoi gian cho cac tin hieu
n_x = (1:length(xn)) - xorigin;  
n_h = (1:length(hn)) - horigin;  
n_y = (1:length(yn)) - yorigin;  

// Ve do thi
clf();

subplot(3, 1, 1);
plot2d3(n_x, xn); 
plot(n_x, xn, 'bo');
xtitle('Tin hieu dau vao x(n)', 'n', 'Bien do'); 
xgrid(1);

subplot(3, 1, 2);
plot2d3(n_h, hn); 
plot(n_h, hn, 'go');
xtitle('Tin hieu h(n)', 'n', 'Bien do'); 
xgrid(1);

subplot(3, 1, 3);
plot2d3(n_y, yn); 
plot(n_y, yn, 'ro');
xtitle('Tin hieu tich chap y(n) = x(n) * h(n)', 'n', 'Bien do'); 
xgrid(1);
endfunction

[yn, yorigin] = convolution([1, 2, -1, 3], 2, [2, -1, 1, 4], 3)

// Bai tap 2.1
// (a) Tin hieu goc x(n)
xn = [0, 1/3, 2/3, 1, 1, 1, 1];
xorigin = 4;
n_x = (1:length(xn)) - xorigin; // Truc thoi gian cua x(n)

// (b.1) & (c) Tin hieu y1(n) = x(-n+4)
// Buoc 1: Gap x(n)
v = xn($:-1:1);
vorigin = length(xn) - xorigin + 1;
// Buoc 2: Dich tre (delay) 4 don vi
y1 = v;
y1origin = vorigin - 4; // Cong thuc delay: origin = origin - k
n_y1 = (1:length(y1)) - y1origin;

// (b.2) Tin hieu y2(n) = x(-n-4)
// Buoc 1: Dich tre x(n) 4 don vi
w = xn;
worigin = xorigin - 4;
// Buoc 2: Gap w(n)
y2 = w($:-1:1);
y2origin = length(w) - worigin + 1;
n_y2 = (1:length(y2)) - y2origin;

// Ve do thi 
clf();

subplot(3, 1, 1);
plot2d3(n_x, xn); plot(n_x, xn, 'bo');
xtitle('(a) Tin hieu goc x(n)', 'n', 'Bien do'); xgrid(1);

subplot(3, 1, 2);
plot2d3(n_y1, y1); plot(n_y1, y1, 'ro');
xtitle('(b.1) & (c) Tin hieu y1(n) = x(-n+4)', 'n', 'Bien do'); xgrid(1);

subplot(3, 1, 3);
plot2d3(n_y2, y2); plot(n_y2, y2, 'go');
xtitle('(b.2) Tin hieu y2(n) = x(-n-4)', 'n', 'Bien do'); xgrid(1);

// Bai tap 2.2
// Khoi tao mang tin hieu goc x(n)
xn = [1, 1, 1, 1, 1, 1/2, 1/2];
xorg = 3;
n_x = (1:length(xn)) - xorg;

// (a) x(n-2)
y_a = xn; org_a = xorg - 2;
n_a = (1:length(y_a)) - org_a;
scf(1); clf();
subplot(2, 1, 1);
plot2d3(n_x, xn); plot(n_x, xn, 'bo'); xtitle('Tin hieu goc x(n)', 'n', 'x(n)'); xgrid(1);
subplot(2, 1, 2);
plot2d3(n_a, y_a); plot(n_a, y_a, 'ro'); xtitle('Tin hieu delay y(n) = x(n-2)', 'n', 'y(n)'); xgrid(1);

// (b) x(4-n)
y_fold = xn($:-1:1); org_fold = length(xn) - xorg + 1;
n_fold = (1:length(y_fold)) - org_fold;
y_b = y_fold; org_b = org_fold - 4; // delay 4 don vi
n_b = (1:length(y_b)) - org_b;
scf(2); clf();
subplot(2, 1, 1);
plot2d3(n_fold, y_fold); plot(n_fold, y_fold, 'bo'); xtitle('Tin hieu y(n) = x(-n)', 'n', 'x(n)'); xgrid(1);
subplot(2, 1, 2);
plot2d3(n_b, y_b); plot(n_b, y_b, 'ro'); xtitle('Tin hieu z(n) = y(n-4) = x(4-n)', 'n', 'z(n)'); xgrid(1);

// (c) x(n+2)
y_c = xn; org_c = xorg + 2;
n_c = (1:length(y_c)) - org_c;
scf(3); clf();
subplot(2, 1, 1);
plot2d3(n_x, xn); plot(n_x, xn, 'bo'); xtitle('Tin hieu goc x(n)', 'n', 'x(n)'); xgrid(1);
subplot(2, 1, 2);
plot2d3(n_c, y_c); plot(n_c, y_c, 'ro'); xtitle('Tin hieu advance y(n) = x(n+2)', 'n', 'y(n)'); xgrid(1);

// (d) x(n)u(2-n):
y_d = zeros(1, length(xn));
for i = 1:length(xn)
if n_x(i) <= 2 then y_d(i) = xn(i); end
end
n_d = n_x;
scf(4); clf();
plot2d3(n_d, y_d); plot(n_d, y_d, 'ro'); xtitle('Do thi y(n) = x(n)u(2-n)', 'n', 'y(n)'); xgrid(1);

// (e) x(n-1)delta(n-3)
n_e = 0:4;
y_e = zeros(1, length(n_e));
y_e(find(n_e == 3)) = 1;
scf(5); clf();
plot2d3(n_e, y_e); plot(n_e, y_e, 'ro'); xtitle('Do thi y(n) = x(n-1)delta(n-3)', 'n', 'y(n)'); xgrid(1);

// (f) x(n^2)
n_f = -2:2;
y_f = [1/2, 1, 1, 1, 1/2];
scf(6); clf();
plot2d3(n_f, y_f); plot(n_f, y_f, 'ro'); xtitle('Do thi y(n) = x(n^2)', 'n', 'y(n)'); xgrid(1);

// (g) x_e(n) va (h) x_o(n):
n_eo = -4:4;
x_e = [1/4, 1/4, 1, 1, 1, 1, 1, 1/4, 1/4];
x_o = [-1/4, -1/4, 0, 0, 0, 0, 0, 1/4, 1/4];
scf(7); clf();
subplot(2, 1, 1);
plot2d3(n_eo, x_e); plot(n_eo, x_e, 'bo'); xtitle('Do thi chan x_e(n)', 'n', 'x_e(n)'); xgrid(1);
subplot(2, 1, 2);
plot2d3(n_eo, x_o); plot(n_eo, x_o, 'ro'); xtitle('Do thi le x_o(n)', 'n', 'x_o(n)'); xgrid(1);

// Bai tap 2.6 
n = -4:7; // Tao truc thoi gian 
x = zeros(1, length(n));
x((n >= 0) & (n <= 3)) = 1; // (1) x(n)

y = zeros(1, length(n));
for i = 1:length(n)
n_sq = n(i)^2;
idx = find(n == n_sq);
if ~isempty(idx) then
y(i) = x(idx); // (2) y(n) = x(n^2)
end
end

y2_prime = zeros(1, length(n));
for i = 1:length(n)
idx = find(n == n(i)-2);
if ~isempty(idx) then
y2_prime(i) = y(idx); // (3) y_2'(n) = y(n-2)
end
end

x2 = zeros(1, length(n));
for i = 1:length(n)
idx = find(n == n(i)-2);
if ~isempty(idx) then
x2(i) = x(idx); // (4) x_2(n) = x(n-2)
end
end

y2 = zeros(1, length(n));
for i = 1:length(n)
n_sq = n(i)^2;
idx = find(n == n_sq);
if ~isempty(idx) then
y2(i) = x2(idx); // (5) y_2(n) = x_2(n^2)
end
end

// Ve do thi
scf(1); clf();
subplot(5, 1, 1); plot2d3(n, x); plot(n, x, 'bo'); xtitle('(1) x(n)'); xgrid(1);
subplot(5, 1, 2); plot2d3(n, y); plot(n, y, 'bo'); xtitle('(2) y(n) = x(n^2)'); xgrid(1);
subplot(5, 1, 3); plot2d3(n, y2_prime); plot(n, y2_prime, 'ro'); xtitle('(3) y''_2(n) = y(n-2)'); xgrid(1);
subplot(5, 1, 4); plot2d3(n, x2); plot(n, x2, 'bo'); xtitle('(4) x_2(n) = x(n-2)'); xgrid(1);
subplot(5, 1, 5); plot2d3(n, y2); plot(n, y2, 'ro'); xtitle('(5) y_2(n) = x_2(n^)'); xgrid(1);
