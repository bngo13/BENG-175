% Get Data
Fs = 1000;
T = 1/Fs;
L = 1500;
t = (0:L - 1) * T;
timeAmt = 50;

S = 0.7 * sin(2 * pi * 50 * t) + sin(2 * pi * 120 * t);
X = S + 2 * randn(size(t));

subplot(3, 2, 1);
plot(1000 * t(1:50), X(1:50));

% Noisy Amplitudes
Y = fft(X);
P2 = abs(Y / L);
P1 = P2(1 : L / 2 + 1);
P1(2:end - 1) = 2 * P1(2 : end - 1);

f = Fs * (0 : (L / 2)) / L;

subplot(3, 2, 2)
plot(f, P1);

% Get Data
Fs = 1000;
T = 1/Fs;
L = 1500;
t = (0:L - 1) * T;
timeAmt = 50;

S = 0.7 * sin(2 * pi * 50 * t) + sin(2 * pi * 120 * t);
X = S + 2 * randn(size(t));

subplot(3, 2, 3);
plot(1000 * t(1:50), X(1:50));

% Noisy Amplitudes
Y = fft(X);
P2 = abs(Y / L);
P1 = P2(1 : L / 2 + 1);
P1(2:end - 1) = 2 * P1(2 : end - 1);

f = Fs * (0 : (L / 2)) / L;

subplot(3, 2, 4)
plot(f, P1);

% Get Data
Fs = 1000;
T = 1/Fs;
L = 1500;
t = (0:L - 1) * T;
timeAmt = 50;

S = 0.7 * sin(2 * pi * 50 * t) + sin(2 * pi * 120 * t);
X = S + 2 * randn(size(t));

subplot(3, 2, 5);
plot(1000 * t(1:50), X(1:50));

% Noisy Amplitudes
Y = fft(X);
P2 = abs(Y / L);
P1 = P2(1 : L / 2 + 1);
P1(2:end - 1) = 2 * P1(2 : end - 1);

f = Fs * (0 : (L / 2)) / L;

subplot(3, 2, 6)
plot(f, P1);

% Actual Signal
Y = fft(S);
P2 = abs(Y / L);
P1 = P2(1 : L / 2 + 1);
P1(2:end - 1) = 2 * P1(2 : end - 1);

f = Fs * (0 : (L / 2)) / L;

figure()
plot(f, P1);
