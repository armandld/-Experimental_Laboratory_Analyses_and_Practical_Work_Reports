% Figures 
fs=28; % font size
lw=1.5;  % linewidth
fl =40;
    set(groot, 'defaultAxesTickLabelInterpreter','latex');
    set(groot, 'defaultLegendInterpreter','latex');
    set(groot, 'defaultTextInterpreter', 'latex');
    set(groot, 'defaultAxesFontSize', fl);
% Figures 
%% Réponse 1

% Extraire les colonnes pertinentes
x = Freq(:,1);
y = Freq(:,2);

figure;

hold on;

%Limites des axes X et Y
xlim([35.6, 55]);  
ylim([-0.0025, 0.15]);

%xlim([-0.2, 2]);  
%ylim([-1, 20]);

%Nombre de valeurs sur les axes X et Y
xticks(linspace(37, 55, 7)); % fonction (valeur de départ , valeur d'arrivée, combien de valeurs pour y arriver
yticks(linspace(0, 0.15, 4));

% Tracer les scatter plots
s1 = scatter(x, y, 1,'o', 'blue'); % scatter c'est tracer les points

l1 = line([40.1771 40.1771], [-1 0.2], 'Color', 'black', 'LineWidth', 1, 'LineStyle', '--');
%l2 = line([50 50],[-1 4],'Color','[0.5,0,0.5]','LineWidth',1,'LineStyle','--');
%Placer les barres d'erreur
%errorbar(x, y, R_err/2, R_err/2, I_err/2, I_err/2, '-^', 'MarkerSize', 8, 'LineWidth', 1.5, 'Color', '[0 0.4470 0.7410]' );
%errorbar(x, y, R_err/2, R_err/2, I_err/2, I_err/2, '-o', 'MarkerSize', 8, 'LineWidth', 1.5, 'Color', '[0.8500 0.3250 0.0980]' );
%errorbar(x, y, R_err/2, R_err/2, I_err/2, I_err/2, '-s', 'MarkerSize', 8, 'LineWidth', 1.5, 'Color', '[0.9290 0.6940 0.1250]' );

% On créé des "faux objets" pour mettre ce qu'on veut dans la légende
h1 = scatter(NaN, NaN,50,'o', 'blue'); % scatter c'est tracer les points
h2 = line(NaN, NaN,'Color','black','LineWidth',1,'LineStyle','--');
%h3 = line(NaN, NaN,'Color','[0.5,0,0.5]','LineWidth',1,'LineStyle','--');
h=[h1,h2];

legend(h, {'Mesure', '$f_\mathrm{res}= (40.20\,\pm\,0.05)$ kHz'}, 'Location', 'best', 'Interpreter', 'latex', 'FontSize', 27);

% Personnalisation du graphique
ylabel('$U$ [V]', 'Interpreter', 'Latex', 'FontSize', 27); % Noms des axes
xlabel('$f$ [kHz]', 'FontSize', 27);

%set(gca, 'XScale', 'log'); % si on veut mettre à l'échelle logarithmique


grid on; % Quadrillage
grid minor; % Placer la "sous-grille"

set(gca,'fontsize',fs)



hold off;

%% Réponse 2

R_errb = 0.001;
R_errh = 0.001;
R_errd = 0;
R_errg = 0;

% Extraire les colonnes pertinentes
x = cont(:,1);
y = cont(:,2);

figure;

hold on;

%Limites des axes X et Y
xlim([0, 5.05e-4]);  
ylim([0, 0.180]);

%xlim([-0.2, 2]);  
%ylim([-1, 20]);

%Nombre de valeurs sur les axes X et Y
xticks(linspace(0, 5e-4, 6)); % fonction (valeur de départ , valeur d'arrivée, combien de valeurs pour y arriver
yticks(linspace(0, 0.180, 4));

% Trouver les fits polynômiaux
t = linspace(0,5e-4,10000);

% Coefficients fournis pour chaque modèle
p1 =   348 ; % (347.1, 349)

% Fit pour y (poly1)
y_fit1 = p1*t;

% Tracer les fits en utilisant les valeurs calculées
plot(t, y_fit1, 'Color', 'red','LineStyle','--', 'LineWidth', 0.5);
%Placer les barres d'erreur
%errorbar(x, y, R_err/2, R_err/2, I_err/2, I_err/2, '-^', 'MarkerSize', 8, 'LineWidth', 1.5, 'Color', '[0 0.4470 0.7410]' );
%errorbar(x, y, R_err/2, R_err/2, I_err/2, I_err/2, '-o', 'MarkerSize', 8, 'LineWidth', 1.5, 'Color', '[0.8500 0.3250 0.0980]' );
%errorbar(x, y, R_err/2, R_err/2, I_err/2, I_err/2, '-s', 'MarkerSize', 8, 'LineWidth', 1.5, 'Color', '[0.9290 0.6940 0.1250]' );
e1=errorbar(x, y, R_errh, R_errb, 'o', 'MarkerSize', 1, ...
         'MarkerEdgeColor', 'red', 'MarkerFaceColor', 'red', ...
          'CapSize', 3, 'LineWidth',1.5 , 'Color', '[0.4940 0.1840 0.5560]');


% On créé des "faux objets" pour mettre ce qu'on veut dans la légende
h1 = errorbar(10, 10, R_errh, R_errb, 'o', 'MarkerSize', 1, ...
         'MarkerEdgeColor', 'red', 'MarkerFaceColor', 'red', ...
          'CapSize', 3, 'LineWidth', 1.5, 'Color', '[0.4940 0.1840 0.5560]');
h2 = plot(10, 10, 'Color', 'red','LineStyle','--', 'LineWidth', 1); % si ça marche pas remplacer chaque NaN par 10

h=[h1,h2];

legend(h,{'Mesure','Fit de pente $a\,=\,348\,\pm\,1$'}, 'Location', 'best', 'Interpreter', 'latex', 'FontSize', 27); % légende

% Personnalisation du graphique
ylabel('$\Delta d$ [m]', 'Interpreter', 'Latex', 'FontSize', 27); % Noms des axes
xlabel('$\frac{n}{f}$ [s]', 'FontSize', 27);

%set(gca, 'XScale', 'log'); % si on veut mettre à l'échelle logarithmique


grid on; % Quadrillage
grid minor; % Placer la "sous-grille"

set(gca,'fontsize',fs)



hold off;

%% Réponse 3

R_errd = 0.2;
R_errg = 0.2;

% Extraire les colonnes pertinentes
x = puls(:,1);
y = puls(:,2);

figure;

hold on;

%Limites des axes X et Y
xlim([0, 10]);  
ylim([0, 3.4]);

%xlim([-0.2, 2]);  
%ylim([-1, 20]);

%Nombre de valeurs sur les axes X et Y
xticks(linspace(0, 10, 6)); % fonction (valeur de départ , valeur d'arrivée, combien de valeurs pour y arriver
yticks(linspace(0, 3.3, 4));

% Trouver les fits polynômiaux
t = linspace(0,10,10000);

% Coefficients fournis pour chaque modèle
p1 =      351.6/1000  ;%  (350.6, 352.5)
p2 =      0.1279 ;% (0.1224, 0.1335)
% Fit pour y (poly1)
y_fit1 = p1*t +p2;

% Tracer les fits en utilisant les valeurs calculées
plot(t, y_fit1, 'Color', 'black','LineStyle','--', 'LineWidth', 1);
%Placer les barres d'erreur
%errorbar(x, y, R_err/2, R_err/2, I_err/2, I_err/2, '-^', 'MarkerSize', 8, 'LineWidth', 1.5, 'Color', '[0 0.4470 0.7410]' );
%errorbar(x, y, R_err/2, R_err/2, I_err/2, I_err/2, '-o', 'MarkerSize', 8, 'LineWidth', 1.5, 'Color', '[0.8500 0.3250 0.0980]' );
%errorbar(x, y, R_err/2, R_err/2, I_err/2, I_err/2, '-s', 'MarkerSize', 8, 'LineWidth', 1.5, 'Color', '[0.9290 0.6940 0.1250]' );
e1=errorbar(x, y,NaN,NaN, R_errg, R_errd, 'o', 'MarkerSize', 3, ...
         'MarkerEdgeColor', 'red', 'MarkerFaceColor', 'red', ...
          'CapSize', 3.5, 'LineWidth', 1.5, 'Color', '[0.4940 0.1840 0.5560]');


% On créé des "faux objets" pour mettre ce qu'on veut dans la légende
h1 = errorbar(10, 10, NaN, NaN, R_errg, R_errd, 'o', 'MarkerSize', 3, ...
         'MarkerEdgeColor', 'red', 'MarkerFaceColor', 'red', ...
          'CapSize', 3.5, 'LineWidth', 1.5, 'Color', '[0.4940 0.1840 0.5560]');
h2 = plot(10, 10, 'Color', 'black','LineStyle','--', 'LineWidth', 1); % si ça marche pas remplacer chaque NaN par 10

h=[h1,h2];
legend(h,{'Mesure','Fit de pente $a\,=\,351\,\pm\,1$'}, 'Location', 'best', 'Interpreter', 'latex', 'FontSize', 27); % légende

% Personnalisation du graphique
ylabel('$2 \Delta d$ [m]', 'Interpreter', 'Latex', 'FontSize', 27); % Noms des axes
xlabel('$\Delta \tau$ [ms]', 'FontSize', 27);

%set(gca, 'XScale', 'log'); % si on veut mettre à l'échelle logarithmique


grid on; % Quadrillage
grid minor; % Placer la "sous-grille"

set(gca,'fontsize',fs)



hold off;