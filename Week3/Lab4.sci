// Bai tap 6
x = [1, 2, -3, 2, 1];
h = [1, 0, -1];
N = length(x); 
M = length(h); 
L = N + M - 1;

// Phuong phap folding and shifting-
y_conv = conv(h, x);
disp("Kq Folding & Shifting:", y_conv);

// Phuong phap ma tran
H = zeros(L, N);
for j = 1:N
    for i = 1:M
        H(i+j-1, j) = h(i);
    end
end
y_mat = (H * x')';
disp("Kq Ma tran:", y_mat);

// Tinh nang luong
energy_y = sum(abs(y_conv).^2);
vec_energy_y = ones(y_conv) * energy_y;

// Ve do thi
nx = 0:(length(x)-1);
ny = 0:(length(y_conv)-1);
clf();
plot(nx, x, 'm-*');
plot(ny, y_conv, 'b-'); 
plot(ny, vec_energy_y, 'r--'); 

xtitle("Tin hieu x(n), y(n) va nang luong", "n", "Bien do");
legend(["x(n)","y(n)", "Energy y"]);
xgrid();

// Bai tap 7
x = [1, 2, -3, 2, 1];
h = [1, 0, -1, -1, 1];
N = length(x);

// Phuong phap folding and shifting (Circular)
y_circ = zeros(1, N);
for n = 1:N
    for k = 1:length(h)
        idx = modulo((n-1) - (k-1) + N, N) + 1; 
        y_circ(n) = y_circ(n) + h(k) * x(idx);
    end
end
disp("Kq Folding & Shifting:", y_circ);

// Phuong phap ma tran
H = zeros(N, N);
for j = 1:N
    for i = 1:N
        H(i, j) = h(modulo(i - j + N, N) + 1);
    end
end
y_mat = (H * x')';
disp("Kq Ma tran:", y_mat);

// Tinh nang luong
energy_y = sum(abs(y_circ).^2);
vec_energy_y = ones(y_circ) * energy_y;

// Ve do thi
nx = 0:(length(x)-1);
clf();
plot(nx, x, 'm-*');
plot(nx, y_circ, 'b-'); 
plot(nx, vec_energy_y, 'r--'); 
a = gca();
a.data_bounds = [0, -10; 4, 60];
xtitle("Tin hieu x(n), y(n) va nang luong (Circular)", "n", "Bien do");
legend(["x(n)"; "y(n)"; "Energy y"]);
xgrid();
