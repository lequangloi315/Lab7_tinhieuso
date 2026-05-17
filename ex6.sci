clc;
clear;

// ===============================
// Ham circular convolution bang FFT
// ===============================
function y = circ_conv_fft(x, h)
    N1 = size(x, "*");
    N2 = size(h, "*");

    if N1 <> N2 then
        error("Hai day phai cung do dai");
    end

    X = fft(x);
    H = fft(h);
    Y = X .* H;
    y = real(ifft(Y));
endfunction

// ===============================
// Ham circular convolution truc tiep
// ===============================
function y = circ_conv_direct(x, h)
    N1 = size(x, "*");
    N2 = size(h, "*");

    if N1 <> N2 then
        error("Hai day phai cung do dai");
    end

    N = N1;
    y = zeros(1, N);

    for n = 0:N-1
        s = 0;
        for m = 0:N-1
            idx = pmodulo(n - m, N);
            s = s + x(m+1) * h(idx+1);
        end
        y(n+1) = s;
    end
endfunction

// ===============================
// Chuong trinh chinh
// ===============================
x = [1 2 3 4];
h = [1 1 1 1];

y1 = circ_conv_fft(x, h);
y2 = circ_conv_direct(x, h);

disp("Ket qua bang FFT:");
disp(y1);

disp("Ket qua tinh truc tiep:");
disp(y2);

disp("Sai so:");
disp(y1 - y2);
