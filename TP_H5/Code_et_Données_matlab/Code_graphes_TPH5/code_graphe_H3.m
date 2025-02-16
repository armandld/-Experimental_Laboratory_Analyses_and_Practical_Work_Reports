% Figures 
fs=28; % font size
lw=1.5;  % linewidth
fl =40;
    set(groot, 'defaultAxesTickLabelInterpreter','latex');
    set(groot, 'defaultLegendInterpreter','latex');
    set(groot, 'defaultTextInterpreter', 'latex');
    set(groot, 'defaultAxesFontSize', fl);

%% Reponse 1

% Erreurs

    % Extraire les colonnes pertinentes
x = Reponse_tens_a(:,4);
y = Reponse_tens_a(:,2) + Reponse_tens_a(:,6);
z = Reponse_tens_a(:,9) + Reponse_tens_a(:,12);
u = Reponse_tens_a(:,15) + Reponse_tens_a(:,18);
v = Reponse_tens_a(:,21) + Reponse_tens_a(:,24);

figure;

hold on;

%Limites des axes X et Y
xlim([0, 1]);  
ylim([0, 7000]);

%Nombre de valeurs sur les axes X et Y
xticks(linspace(0, 1, 5)); % fonction (valeur de départ , valeur d'arrivée, combien de valeurs pour y arriver
yticks(linspace(0,6000, 5));

% Tracer les scatter plots
s1 = scatter(x, y, 60, 'red', '*'); % scatter c'est tracer les points
s2 = scatter(x, z, 60, 'blue', 'v','filled');
s3 = scatter(x, u, 60, 'black', 'filled');
s4 = scatter(x, v, 60, 'magenta', 's','filled');

% Tracer les fits polynômiaux
% Coefficients fournis pour chaque modèle
% Fit pour y (poly2)
p1_y = -569.1;    % Coefficient p1
p2_y = 2624;      % Coefficient p2
p3_y = 30.29;     % Coefficient p3

% Fit pour z (poly2)
p1_z = -3081;     % Coefficient p1
p2_z = 7760;      % Coefficient p2
p3_z = 135.4;     % Coefficient p3

% Fit pour u (poly3)
p1_u = 5914;      % Coefficient p1
p2_u = -1.772e+04; % Coefficient p2
p3_u = 1.737e+04;  % Coefficient p3
p4_u = 162.5;      % Coefficient p4

% Fit pour v (poly4)
p1_v = -1.006e+04; % Coefficient p1
p2_v = 3.886e+04;  % Coefficient p2
p3_v = -5.495e+04; % Coefficient p3
p4_v = 3.011e+04;  % Coefficient p4
p5_v = 212;        % Coefficient p5

t = linspace(0,1,10000);
% Calculer les valeurs du modèle en fonction des coefficients
y_fit = p1_y * t.^2 + p2_y * t + p3_y; % Valeurs du fit pour y (poly2)
z_fit = p1_z * t.^2 + p2_z * t + p3_z; % Valeurs du fit pour z (poly2)
u_fit = p1_u * t.^3 + p2_u * t.^2 + p3_u * t + p4_u; % Valeurs du fit pour u (poly3)
v_fit = p1_v * t.^4 + p2_v * t.^3 + p3_v * t.^2 + p4_v * t + p5_v; % Valeurs du fit pour v (poly4)

% Tracer les fits en utilisant les valeurs calculées
plot(t, y_fit, 'Color', 'red', 'LineWidth', 0.5);
plot(t, z_fit, 'Color', 'blue', 'LineWidth', 0.5);
plot(t, u_fit, 'Color', 'black', 'LineWidth', 0.5);
plot(t, v_fit, 'Color', 'magenta', 'LineWidth', 0.5);

%Placer les barres d'erreur
%errorbar(x, y, R_err/2, R_err/2, I_err/2, I_err/2, '-^', 'MarkerSize', 8, 'LineWidth', 1.5, 'Color', '[0 0.4470 0.7410]' );
%errorbar(x, y, R_err/2, R_err/2, I_err/2, I_err/2, '-o', 'MarkerSize', 8, 'LineWidth', 1.5, 'Color', '[0.8500 0.3250 0.0980]' );
%errorbar(x, y, R_err/2, R_err/2, I_err/2, I_err/2, '-s', 'MarkerSize', 8, 'LineWidth', 1.5, 'Color', '[0.9290 0.6940 0.1250]' );
%errorbar(x, y, R_err/2, R_err/2, I_err/2, I_err/2, '-.', 'MarkerSize', 8, 'LineWidth', 1.5, 'Color', '[0.4940 0.1840 0.5560]' );

% On créé des "faux objets" pour mettre ce qu'on veut dans la légende
h1 = plot(NaN, NaN, 'r*', 'MarkerSize', 10); % Astérisque rouge
h2 = plot(NaN, NaN, 'bv', 'MarkerSize', 10, 'MarkerFaceColor', 'b'); % Triangle bleu
h3 = plot(NaN, NaN, 'ko', 'MarkerSize', 10, 'MarkerFaceColor', 'k'); % Cercle noir rempli
h4 = plot(NaN, NaN, 'ms', 'MarkerSize', 10, 'MarkerFaceColor', 'm'); % Carré magenta rempli

h=[h1,h2,h3,h4];

legend(h,{'$U$ = 20 kV','$U$ = 25 kV','$U$ = 30 kV','$U$ = 35 kV'},'NumColumns', 2, 'Location', 'best', 'Interpreter', 'latex', 'FontSize', 27); % légende

% Personnalisation du graphique
ylabel('$R$ [s$^{-1}$]', 'Interpreter', 'Latex', 'FontSize', 27); % Noms des axes
xlabel('$I$ [mA]', 'FontSize', 27);

%set(gca, 'XScale', 'log'); % si on veut mettre à l'échelle logarithmique


grid on; % Quadrillage
grid minor; % Placer la "sous-grille"

set(gca,'fontsize',fs)



hold off;

%% Réponse 2

% Erreurs
I_err = 0.01;
R_err = Reponse_b(:,6);

    % Extraire les colonnes pertinentes
x = Reponse_b(:,4);
y = Reponse_b(:,2) + Reponse_tens_a(:,6);
figure;

hold on;

%Limites des axes X et Y
xlim([-0.002, 0.102]);  
ylim([-50, 1800]);

%Nombre de valeurs sur les axes X et Y
xticks(linspace(0.0, 0.1, 5)); % fonction (valeur de départ , valeur d'arrivée, combien de valeurs pour y arriver
yticks(linspace(0,1800, 4));

% Tracer les scatter plots
s1 = scatter(x, y, 25, 'red', 'filled'); % scatter c'est tracer les points

% Tracer les fits polynômiaux
% Coefficients fournis pour chaque modèle
% Fit pour y (poly1)
p1_y =  1.622e+04;      % Coefficient p1
p2_y = 80.83;     % Coefficient p2

t = linspace(0,0.1,10000);
% Calculer les valeurs du modèle en fonction des coefficients
y_fit = p1_y * t + p2_y;  % Valeurs du fit pour y (poly1)

% Tracer les fits en utilisant les valeurs calculées
plot(t, y_fit, 'Color', 'red', 'LineWidth', 0.5);

%Placer les barres d'erreur
%errorbar(x, y, R_err/2, R_err/2, I_err/2, I_err/2, '-^', 'MarkerSize', 8, 'LineWidth', 1.5, 'Color', '[0 0.4470 0.7410]' );
%errorbar(x, y, R_err/2, R_err/2, I_err/2, I_err/2, '-o', 'MarkerSize', 8, 'LineWidth', 1.5, 'Color', '[0.8500 0.3250 0.0980]' );
%errorbar(x, y, R_err/2, R_err/2, I_err/2, I_err/2, '-s', 'MarkerSize', 8, 'LineWidth', 1.5, 'Color', '[0.9290 0.6940 0.1250]' );
errorbar(x, y, R_err, R_err,0, 0, '-.', 'MarkerSize', 8, 'LineWidth', 1.5, 'Color', '[0.4940 0.1840 0.5560]' );


% On créé des "faux objets" pour mettre ce qu'on veut dans la légende
h1 = plot(NaN, NaN, 'r.', 'MarkerSize', 20);
h=[h1];

legend(h,{'$U$ = 30 kV'}, 'Location', 'best', 'Interpreter', 'latex', 'FontSize', 27); % légende

% Personnalisation du graphique
ylabel('$R$ [s$^{-1}$]', 'Interpreter', 'Latex', 'FontSize', 27); % Noms des axes
xlabel('$I$ [mA]', 'FontSize', 27);

%set(gca, 'XScale', 'log'); % si on veut mettre à l'échelle logarithmique


grid on; % Quadrillage
grid minor; % Placer la "sous-grille"

set(gca,'fontsize',fs)



hold off;

%% Reponse 3

% Erreurs

    % Extraire les colonnes pertinentes
x = Bragg20kV.Degre;
y = Bragg20kV.Reponse;
z = Bragg25kV.Reponse;
u = Bragg30kV.Reponse;
v = Bragg35kV.Reponse;

figure;

hold on;

%Limites des axes X et Y
xlim([3.2, 25]);  
ylim([0, 2500]);

%Nombre de valeurs sur les axes X et Y
xticks(linspace(4, 25, 4)); % fonction (valeur de départ , valeur d'arrivée, combien de valeurs pour y arriver
yticks(linspace(0,2500, 5));

% Tracer les scatter plots
s1 = plot(x, y, 'r-', 'LineWidth', 1.5); % scatter c'est tracer les points
s2 = plot(x, z, 'b-', 'LineWidth', 1.5); 
s3 = plot(x, u, 'k-', 'LineWidth', 1.5); 
s4 = plot(x, v, 'm-', 'LineWidth', 1.5);

% Tracer des lignes
x1 = 8.125; % Valeur de l'abscisse
y1 = 0; % Position inférieure de la ligne
y2 = 2500; % Position supérieure de la ligne
line([x1 x1], [y1 y2], 'Color', '[0.3, 0.3, 0.3]', 'LineStyle', '--', 'LineWidth', 0.7); % Tracé de la ligne verticale pointillée
text(8.325, 2350, '$K_{\alpha ,\,1}$', 'FontSize', 25, 'Color', '[0.3, 0.3, 0.3]');
x1 = 7.37;
line([x1 x1], [y1 y2], 'Color', '[0.3, 0.3, 0.3]', 'LineStyle', '--', 'LineWidth', 0.7); % Tracé de la ligne verticale pointillée
text(4.344049079754601,1275.961538461539, '$K_{\beta ,\,1}$', 'FontSize', 25, 'Color', '[0.3, 0.3, 0.3]');
x1 = 13.87;
line([x1 x1], [y1 y2], 'Color', '[0.3, 0.3, 0.3]', 'LineStyle', '--', 'LineWidth', 0.7); % Tracé de la ligne verticale pointillée
text(10.890552147239264,340.0641025641025, '$K_{\beta ,\,2}$', 'FontSize', 25, 'Color', '[0.3, 0.3, 0.3]');
x1 = 15.5;
line([x1 x1], [y1 y2], 'Color', '[0.3, 0.3, 0.3]', 'LineStyle', '--', 'LineWidth', 0.7); % Tracé de la ligne verticale pointillée
text(16, 650, '$K_{\alpha ,\,2}$', 'FontSize', 25, 'Color', '[0.3, 0.3, 0.3]');
x1 = 20.5;
line([x1 x1], [y1 y2], 'Color', '[0.3, 0.3, 0.3]', 'LineStyle', '--', 'LineWidth', 0.7); % Tracé de la ligne verticale pointillée
text(17.590552147239258,184.0384615384617, '$K_{\beta ,\,3}$', 'FontSize', 25, 'Color', '[0.3, 0.3, 0.3]');
x1 = 23.1;
line([x1 x1], [y1 y2], 'Color', '[0.3, 0.3, 0.3]', 'LineStyle', '--', 'LineWidth', 0.7); % Tracé de la ligne verticale pointillée
text(23.2, 180, '$K_{\alpha ,\,3}$', 'FontSize', 25, 'Color', '[0.3, 0.3, 0.3]');

%text(x_position, y_position, 'Ton texte ici', 'FontSize', 12, 'Color', 'r');
%text(x_position, y_position, 'Ton texte ici', 'FontSize', 12, 'Color', 'r');
%text(x_position, y_position, 'Ton texte ici', 'FontSize', 12, 'Color', 'r');

% On créé des "faux objets" pour mettre ce qu'on veut dans la légende
h1 = plot(NaN, NaN, 'r.', 'MarkerSize', 20);
h2 = plot(NaN, NaN, 'b.', 'MarkerSize', 20); 
h3 = plot(NaN, NaN, 'k.', 'MarkerSize', 20); 
h4 = plot(NaN, NaN, 'm.', 'MarkerSize', 20); 
h=[h1,h2,h3,h4];

legend(h,{'$U$ = 20 kV','$U$ = 25 kV','$U$ = 30 kV','$U$ = 35 kV'},'NumColumns', 2, 'Location', [0.361556727231432,0.563873013920255,0.570996039254325,0.165000002724784], 'Interpreter', 'latex', 'FontSize', 27); % légende

% Personnalisation du graphique
ylabel('$R$ [s$^{-1}$]', 'Interpreter', 'Latex', 'FontSize', 27); % Noms des axes
xlabel('$\theta \, [^\circ]$', 'Interpreter', 'Latex', 'FontSize', 27);

%set(gca, 'XScale', 'log'); % si on veut mettre à l'échelle logarithmique


grid on; % Quadrillage
grid minor; % Placer la "sous-grille"

set(gca,'fontsize',fs)



hold off;

%% Reponse 4

% Erreurs

    % Extraire les colonnes pertinentes
x = absorptionepaisseural.Degre;
y = absorptionepaisseural.Reponse;

figure;

hold on;

%Limites des axes X et Y
xlim([-5, 62]);  
ylim([0, 575]);

%Nombre de valeurs sur les axes X et Y
xticks(linspace(-5, 62, 6)); % fonction (valeur de départ , valeur d'arrivée, combien de valeurs pour y arriver

% Spécifier les positions des ticks sur l'axe X
xticks([-0.5, 8.6666, 18.3333, 28.8, 38.6, 48.2,58.8]);  % Positions des ticks sur l'axe X

% Spécifier les labels correspondants
xticklabels({'0', '0.5', '1', '1.5', '2','2.5','3'});  % Labels personnalisés

yticks(linspace(0, 600, 5));

% Tracer les scatter plots
s1 = plot(x, y, 'r-', 'LineWidth', 1.0); % scatter c'est tracer les points
t = linspace(-5,65,10000);
p1 = plot(t,490*exp(-0.0504*t)+5,'k-', 'LineStyle','--','LineWidth', 1.0);

% On créé des "faux objets" pour mettre ce qu'on veut dans la légende
h1 = plot(NaN, NaN, 'r-', 'LineStyle','-','LineWidth', 1.0);
h2 = plot(NaN, NaN, 'k-', 'LineStyle','--','LineWidth', 1.0); 
 
h=[h1,h2];

legend(h,{'$R$','fit exponentiel'}, 'Location', 'best', 'Interpreter', 'latex', 'FontSize', 27); % légende

% Personnalisation du graphique
ylabel('$R$ [s$^{-1}$]', 'Interpreter', 'Latex', 'FontSize', 27); % Noms des axes
xlabel('$d$ [mm]', 'Interpreter', 'Latex', 'FontSize', 27);

%set(gca, 'XScale', 'log'); % si on veut mettre à l'échelle logarithmique


grid on; % Quadrillage
grid minor; % Placer la "sous-grille"

set(gca,'fontsize',fs)



hold off;

%% Réponse 5

R_errb = fitexpoCopy(:,2) - fitexpoCopy(:,3);
R_errh = fitexpoCopy(:,4)-fitexpoCopy(:,2);
R_errd = 0.15;
R_errg = 0.15;

% Extraire les colonnes pertinentes
x = fitexpoCopy(:,5);
y = fitexpoCopy(:,2);

figure;

hold on;

%Limites des axes X et Y
xlim([-0.2, 3.2]);  
ylim([-0.1, 3.1]);

%Nombre de valeurs sur les axes X et Y
xticks(linspace(0, 3, 4)); % fonction (valeur de départ , valeur d'arrivée, combien de valeurs pour y arriver
yticks(linspace(0, 3, 5));

% Tracer les scatter plots
s1 = scatter(x, y, 30, 'red', 'filled'); % scatter c'est tracer les points

% Trouver les fits polynômiaux
% Coefficients fournis pour chaque modèle
p1 =      0.8882; %  (0.8053, 0.9711)
p2 =      0.1118; %  (-0.03762, 0.2613)

t = linspace(-1,3,10000);

% Fit pour y (poly1)
y_fit = p1*t+p2;

% Tracer les fits en utilisant les valeurs calculées
plot(t, y_fit, 'Color', 'blue','LineStyle','--', 'LineWidth', 0.5);

%Placer les barres d'erreur
%errorbar(x, y, R_err/2, R_err/2, I_err/2, I_err/2, '-^', 'MarkerSize', 8, 'LineWidth', 1.5, 'Color', '[0 0.4470 0.7410]' );
%errorbar(x, y, R_err/2, R_err/2, I_err/2, I_err/2, '-o', 'MarkerSize', 8, 'LineWidth', 1.5, 'Color', '[0.8500 0.3250 0.0980]' );
%errorbar(x, y, R_err/2, R_err/2, I_err/2, I_err/2, '-s', 'MarkerSize', 8, 'LineWidth', 1.5, 'Color', '[0.9290 0.6940 0.1250]' );
e1=errorbar(x, y, R_errh, R_errb, R_errg, R_errd, 'o', 'MarkerSize', 3, ...
         'MarkerEdgeColor', 'red', 'MarkerFaceColor', 'red', ...
          'CapSize', 3.5, 'LineWidth', 1.5, 'Color', '[0.4940 0.1840 0.5560]');

% On créé des "faux objets" pour mettre ce qu'on veut dans la légende
h1 = plot(10, 10, 'blue', 'LineStyle','--','LineWidth', 1);
h2 = errorbar(10, 10, R_errh, R_errb, R_errg, R_errd, 'o', 'MarkerSize', 3, ...
         'MarkerEdgeColor', 'red', 'MarkerFaceColor', 'red', ...
          'CapSize', 3.5, 'LineWidth', 1.5, 'Color', '[0.4940 0.1840 0.5560]');
h=[h1,h2];

legend(h,{'Fit lineaire de pente $m$','$\ln(R_0/R)$'}, 'Location', 'best', 'Interpreter', 'latex', 'FontSize', 27); % légende

% Personnalisation du graphique
ylabel('$\ln(R_0/R)$', 'Interpreter', 'Latex', 'FontSize', 27); % Noms des axes
xlabel('$d$ [mm]', 'FontSize', 27);

%set(gca, 'XScale', 'log'); % si on veut mettre à l'échelle logarithmique


grid on; % Quadrillage
grid minor; % Placer la "sous-grille"

set(gca,'fontsize',fs)



hold off;


%% Réponse 6

% Erreurs

    % Extraire les colonnes pertinentes
x = Bragg20kV.Degre;
z = experienceBraggLiF30kVqu5.Reponse;

figure;

hold on;

%Limites des axes X et Y
xlim([3.8, 25]);  
ylim([0, 1100]);

%Nombre de valeurs sur les axes X et Y
xticks(linspace(4, 25, 4)); % fonction (valeur de départ , valeur d'arrivée, combien de valeurs pour y arriver
yticks(linspace(0,1100, 5));

% Couleur bleu nuit (en proportions [0,1])
blanc = [1, 1, 1];

% Couleur violet (en proportions [0,1])
violet = [0.65, 0, 0.6];

% Mélange des deux couleurs (50% de chaque)
mixed_color = (blanc + violet) ./ 2;

% Tracer les scatter plots
s2 = plot(x, z, 'Color',mixed_color, 'LineWidth', 1.5); 

% Tracer des lignes
x1 = 10.05; % Valeur de l'abscisse
y1 = 0; % Position inférieure de la ligne
y2 = 1100; % Position supérieure de la ligne
line([x1 x1], [y1 y2], 'Color', '[0.3, 0.3, 0.3]', 'LineStyle', '--', 'LineWidth', 0.7); % Tracé de la ligne verticale pointillée
text(6.799386503067485,400, '$K_{\beta ,\,1}$', 'FontSize', 25, 'Color', '[0.3, 0.3, 0.3]');
x1 = 11.2;
line([x1 x1], [y1 y2], 'Color', '[0.3, 0.3, 0.3]', 'LineStyle', '--', 'LineWidth', 0.7); % Tracé de la ligne verticale pointillée
text(11.6, 1000, '$K_{\alpha ,\,1}$', 'FontSize', 25, 'Color', '[0.3, 0.3, 0.3]');
x1 = 21.7;
line([x1 x1], [y1 y2], 'Color', '[0.3, 0.3, 0.3]', 'LineStyle', '--', 'LineWidth', 0.7); % Tracé de la ligne verticale pointillée
text(22, 180, '$K_{\alpha ,\,2}$', 'FontSize', 25, 'Color', '[0.3, 0.3, 0.3]');

%text(x_position, y_position, 'Ton texte ici', 'FontSize', 12, 'Color', 'r');
%text(x_position, y_position, 'Ton texte ici', 'FontSize', 12, 'Color', 'r');
%text(x_position, y_position, 'Ton texte ici', 'FontSize', 12, 'Color', 'r');

% On créé des "faux objets" pour mettre ce qu'on veut dans la légende
%h1 = plot(NaN, NaN, 'mixed_color', 'MarkerSize', 20); 
%h=[h1,];

%legend(h,{''},'NumColumns', 2, 'Location', 'best', 'Interpreter', 'latex', 'FontSize', 27); % légende

% Personnalisation du graphique
ylabel('$R$ [s$^{-1}$]', 'Interpreter', 'Latex', 'FontSize', 27); % Noms des axes
xlabel('$\theta \, [^\circ]$', 'Interpreter', 'Latex', 'FontSize', 27);

%set(gca, 'XScale', 'log'); % si on veut mettre à l'échelle logarithmique


grid on; % Quadrillage
grid minor; % Placer la "sous-grille"

set(gca,'fontsize',fs)



hold off;

%% Réponse Annexe a


% Erreurs

% Extraire les colonnes pertinentes
x = test1absorptionmateriaux.Degre(1:271);
y = test2absorptionmateriaux.Reponse(1:271);

figure;

hold on;

%Limites des axes X et Y
xlim([-5, 22]);  
ylim([0, 2400]);

%Nombre de valeurs sur les axes X et Y
xticks(linspace(-5, 22, 4)); % fonction (valeur de départ , valeur d'arrivée, combien de valeurs pour y arriver

% Spécifier les positions des ticks sur l'axe X
xticks([-0.5, 8.6666, 18.3333, 28.8, 38.6, 48.2,58.8]);  % Positions des ticks sur l'axe X

% Spécifier les labels correspondants
xticklabels({'','6', '13',});  % Labels personnalisés

yticks(linspace(0, 2400, 5));

% Tracer les scatter plots
s1 = plot(x, y, 'm-', 'LineWidth', 1.0); % scatter c'est tracer les points

% Personnalisation du graphique
ylabel('$R$ [s$^{-1}$]', 'Interpreter', 'Latex', 'FontSize', 27); % Noms des axes
xlabel('Z', 'Interpreter', 'Latex', 'FontSize', 27);

%set(gca, 'XScale', 'log'); % si on veut mettre à l'échelle logarithmique


grid on; % Quadrillage
grid minor; % Placer la "sous-grille"

set(gca,'fontsize',fs)



hold off;

%% Réponse Annexe b


% Erreurs

% Extraire les colonnes pertinentes
x = test3absorptionmateriaux.Degre;
y = test3absorptionmateriaux.Reponse;

figure;

hold on;

%Limites des axes X et Y
xlim([23, 61.5]);  
ylim([0, 50]);

%Nombre de valeurs sur les axes X et Y
xticks(linspace(22, 60, 4)); % fonction (valeur de départ , valeur d'arrivée, combien de valeurs pour y arriver

% Spécifier les positions des ticks sur l'axe X
xticks([27.2, 36.9, 46.8, 56.9]);  % Positions des ticks sur l'axe X

% Spécifier les labels correspondants
xticklabels({'26','29','40', '47'});  % Labels personnalisés

yticks(linspace(0, 50, 5));

% Tracer les scatter plots
s1 = plot(x, y, 'm-', 'LineWidth', 1.0); % scatter c'est tracer les points

% Personnalisation du graphique
ylabel('$R$ [s$^{-1}$]', 'Interpreter', 'Latex', 'FontSize', 27); % Noms des axes
xlabel('Z', 'Interpreter', 'Latex', 'FontSize', 27);

%set(gca, 'XScale', 'log'); % si on veut mettre à l'échelle logarithmique


grid on; % Quadrillage
grid minor; % Placer la "sous-grille"

set(gca,'fontsize',fs)



hold off;
