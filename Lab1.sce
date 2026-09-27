clc;
close;
clear;

// Bai tap 1.1
// Cau hoi 1
vec_x = [1:4];
vec_x_plus_1 = vec_x + 1

// Cau hoi 2
vec_y = [5:8];
vec_xy = vec_x .* vec_y

// Cau hoi 3
theta = linspace(0, %pi, 10);
sin_theta = sin(theta)

// Bai tap 1.2
// Cau hoi 1: analog signal
clf;
t_analog = linspace(0,0.1,1000);
x_analog = 3 * sin(100 * %pi * t_analog)

subplot(3, 1, 1);
plot(t_analog, x_analog, style = 1);
xgrid(); // Thêm lưới tọa độ
xlabel('Thời gian t (s)');
ylabel('Biên độ x(t)');
title('Tín hiệu liên tục x_a(t)');

// Cau hoi 3: discrete-time signal
n_discrete = 0:30;
x_discrete = 3 * sin(%pi * n_discrete / 3);

subplot(3, 1, 2);
plot2d3(n_discrete, x_discrete, style = 2);
xgrid();
xlabel('n');
ylabel('Biên độ x_discrete(n)');
title('Tín hiệu rời rạc x_discrete(n)');

// Cau hoi 4: The quantized signal
delta = 0.1;
x_quantized = floor(x_discrete/delta) * delta;
subplot(3, 1, 3);
plot2d3(n_discrete, x_quantized, style = 3)
xgrid();
xlabel('n');
ylabel('Biên độ x_quantized(n)');
title('Tín hiệu lượng tử hóa x_q(n)');
