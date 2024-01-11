clear all;

% ===== Bild einlesen =====
% img1 = rgb2gray( imread('lenna.png') );    % Bild einlesen
img1 = rgb2gray( imread('cameraman.jpg') );
bild1 = double(img1);                                % in double Format umwandeln 
L = length(bild1);                                       % Bildgröße
N = log2(L); 

% ===== Illustration der 2D-DHT =====
figure(1); 
saveas(gcf, 'cameraman_figure1.png');

subplot(2,2,1), imshow(img1);                  % orginal Bild anzeigen
title('Original');

h1 = mDHTStep(bild1);                            % Zwischenschritt im ersten DHT Schritt
subplot(2,2,2), imshow(h1,[]);                  % Ergebnis anzeigen
title('mDHT 1/2 Schritte');
r1 = mDHT(bild1,1);                                 % zweiter Teil des ersten DHT Schritts
subplot(2,2,3), imshow(r1,[]);                   % Ergebnis anzeigen
title('mDHT 1 Schritt');
r2 = mDHT(bild1,2);                                 % die ersten zwei Schritte der DHT 
subplot(2,2,4), imshow(r2,[]);                   % Ergebnis Anzeigen
title('mDHT 2 Schritte');


% ===== Volle DHT & Rekonstruktionsfehler =====
r = mDHT(bild1,N);                                  % Berechne volle DHT (d.h. N Schritte)
bildr = ImDHT(r,N);                                  % Berechne volle inverse DHT

% 
figure(2); 
saveas(gcf, 'cameraman_figure2.png');

subplot(1,2,1), imshow(r,[]);                     % Plotte DHT
title('Volle mDHT');

subplot(1,2,2); imshow(bildr,[]);                % Plotte rekonstruiertes Bild
title('Inverse mDHT');

normValue = norm(bildr - bild1);                                     % Berechne Rekonstruktionsfehler
annotation('textbox', [0.35, 0.05, 0.3, 0.05], 'String', ['Norm: ', num2str(normValue)], 'EdgeColor', 'none', 'HorizontalAlignment', 'center', 'FontSize', 10);
 

% % ===== Komprimierung =====
r_50 = compDHT(r,50);                                  % Behalte nur die größten p% der DHT Koefficienten
r_25 = compDHT(r,25);
r_10 = compDHT(r,10);
r_05 = compDHT(r, 5);
r_01 = compDHT(r, 1);

bild_50 = ImDHT(r_50,N);                                % volle inverse DHT
bild_25 = ImDHT(r_25,N);
bild_10 = ImDHT(r_10,N);
bild_05 = ImDHT(r_05,N);
bild_01 = ImDHT(r_01,N);

figure(3);
saveas(gcf, 'cameraman_figure3.png');

subplot(2, 3, 1), imshow(bild1, []);
title('Uncompressed', 'FontSize', 10);

subplot(2, 3, 2), imshow(bild_50, []);
title(['50% - Norm: ', num2str(norm(bild_50 - bild1))], 'FontSize', 10);

subplot(2, 3, 3), imshow(bild_25, []);
title(['75% - Norm: ', num2str(norm(bild_25 - bild1))], 'FontSize', 10);

subplot(2, 3, 4), imshow(bild_10, []);
title(['90% - Norm: ', num2str(norm(bild_10 - bild1))], 'FontSize', 10);

subplot(2, 3, 5), imshow(bild_05, []);
title(['95% - Norm: ', num2str(norm(bild_05 - bild1))], 'FontSize', 10);

subplot(2, 3, 6), imshow(bild_01, []);
title(['99% - Norm: ', num2str(norm(bild_01 - bild1))], 'FontSize', 10);

% Add some space between plots
set(gcf, 'Position', get(0,'Screensize')); % Maximize the figure window



% norm(bildc - bild1)                                    % Berechne Rekonstruktionsfehler


