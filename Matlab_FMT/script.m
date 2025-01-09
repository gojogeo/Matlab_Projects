filename = 'VibrationSensorData';
T = readtable(filename, 'NumHeaderLines', 0);
xValues = T(1:1000,2);
yValues = T(1:1000,3);
xValues = table2array(xValues);
yValues = table2array(yValues);
plot(xValues, yValues)

grad = gradient(xValues);
u =  unique(grad);
length (u);
mean(u);
Y= fft(yValues);
L = length(Y);
Fs = 1000;
P2 = abs(Y/L);
f_full = (0:L-1)*(Fs/L);
f = (0:(L/2))*(Fs/L);
P1 = P2(1:L/2+1);
P1(2:end-1)=2*P1(2:end-1);
plot(f,P1)
hold on
scatter(f,P1,'.','red')

thrshld = 0.7 *  max(abs(Y));
dom_index = find(abs(Y)>thrshld);
Y_clean = zeros(L,1);
Y_clean(dom_index)=Y(dom_index);
y = ifft(Y_clean, 'symmetric');
plot(xValues, yValues)
hold on
plot(xValues, y)

Y_clean = zeros(L,1);
Y_clean(dom_index)=Y(dom_index);
y = ifft(Y_clean, 'symmetric');
plot(xValues, yValues)
hold on
plot(xValues, y)





