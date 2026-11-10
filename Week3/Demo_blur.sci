// B1: Cai dat va tai module IPCV (neu chua co)
// atomsInstall('IPCV');
// atomsLoad('IPCV');

// B2: Chon va doc anh tu may tinh cua ban
// Ham uigetfile se hien thi cua so de ban tu tim den thu muc chua anh
img_path = uigetfile("*.*", "Chon file anh tu may tinh");

// Kiem tra xem nguoi dung co chon anh hay bam Cancel
if img_path == "" then
    disp("Ban chua chon anh nao. Ket thuc chuong trinh.");
    abort;
end

img = imread(img_path);

// B3: Hien thi anh goc tren cua so dau tien (Cua so 0)
figure(0);
imshow(img);
title("Truoc: Anh goc tren may cua ban");

// (Tuy chon) Chuyen sang dang xam de ve Histogram - Hien thi tren cua so 2 neu can
// img_gray = rgb2gray(img);
// figure(2);
// imhist(img_gray);
// title("Bieu do Histogram cua anh");

// B4: Lam mo anh (Blurring) bang bo loc Gaussian
// Tao bo loc Gaussian kich thuoc 7x7, do lech chuan sigma = 2
h_blur = fspecial('gaussian', 151, 10); 
img_blur = imfilter(img, h_blur); // Ap dung tich chap bo loc vao anh goc

// B5: Hien thi anh sau khi lam mo tren cua so thu hai (Cua so 1)
figure(1);
imshow(img_blur);
title("Sau: Anh da duoc lam mo (Gaussian Blur)");

// (Tuy chon) Luu anh da lam mo ra file
// imwrite(img_blur, 'anh_cua_toi_blurred.jpg');
