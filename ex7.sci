clc;
clear;

function y = lin_conv_fft(x, h)
    Lx = size(x, "*");
    Lh = size(h, "*");

    N = Lx + Lh - 1;

    xpad = [x zeros(1, N - Lx)];
    hpad = [h zeros(1, N - Lh)];

    X = fft(xpad);
    H = fft(hpad);
    Y = X .* H;

    y = real(ifft(Y));
endfunction

x = [1 2 3 4];
h = [1 1 2];

y_fft = lin_conv_fft(x, h);
y_conv = conv(x, h);

disp("Ket qua bang FFT:");
disp(y_fft);

disp("Ket qua bang conv:");
disp(y_conv);

disp("Sai so:");
disp(y_fft - y_conv);
