im = imread('images/brain.bmp');

%% Inicialización uniforme 6
tic;
[mask,mu,v,p] = EMSeg(im, 6);
toc

%% Inicialización uniforme 4
tic;
[mask,mu,v,p] = EMSeg(im, 4);
toc

%% Inicializacion explicita
% El numero de gaussianas pasadas tienes que concidir con el numero de
% posiciones en el array si no fuera asi se utilizaran gaussianas de
% distribucion uniforme. Esto tambien sucedera si no indicamos el array de
% valores al llamar a la función
tic;
[mask,mu,v,p] = EMSeg(im, 4, [0 180 100 250]);
toc

%% Pintado de resultados

mask = rgb2gray(mask);

subplot(121);
imshow(img, []);
subplot(122);
imshow(mask, []);