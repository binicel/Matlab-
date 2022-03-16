%% Filterung eines Signales
close all
%Deklarationen 

A = 1; %maximale Amplitude von 1
f1 = 1e2; % Frequenz des Audiosignales Hz
f2 = 1e3; % Frequenz des Audiosignales Hz
phi = 0; % Phase des Signales
fs = 48e3; % 48000 Hz Abtastrate
tmax = 5; 

%Berechnungen 
t = 0:1/fs:tmax-1/fs; % 1/fs = Schrittweite
x1 = sin(2*pi*f1*t);
x2 = 0.8*sin(2*pi*f2*t);
x = A*(x1+x2);
np = 50*round(fs/ f);

%Tiefpassilterung
fg=100;
Fg = fg/fs; %normierte Grebzfrequenz

b1 = exp(-2*pi*Fg);
a0 = 1-b1;

[rows, cols] = size(x);
y = zeros(size(x)); %Initialisierung des Ausgabevektors

y_old = 0;
for k=1:cols
    y(k) = a0*x(k)+b1*y_old;
    y_old = y(k);
end

%Darstellung
plot(t(1:np), x(1:np))
hold on;
plot(t(1:np), y(1:np))
grid on
title('Sinusisgnial');
xlabel('Zeit/s');
ylabel('Funktionswert/FSR');

