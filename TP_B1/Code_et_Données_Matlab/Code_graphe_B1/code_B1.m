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
x = Exp1(:,1);

y = Exp1(:,5);
R_errh = Exp1(:,5)-Exp1(:,3);
R_errb = Exp1(:,4)-Exp1(:,5);
R_errgd = 0.05;

z = Exp1(:,8);

figure;

hold on;

%Limites des axes X et Y
xlim([-0.1, 11]);  
ylim([2.8, 5.1]);

%xlim([-0.2, 2]);  
%ylim([-1, 20]);

%Nombre de valeurs sur les axes X et Y
xticks(linspace(0, 10, 6)); % fonction (valeur de départ , valeur d'arrivée, combien de valeurs pour y arriver
yticks(linspace(3, 5, 5));

% Tracer les scatter plots


e1=errorbar(x, y,R_errb,R_errh, R_errgd, R_errgd, 'o', 'MarkerSize', 3, ...
         'MarkerEdgeColor', 'red', 'MarkerFaceColor', 'red', ...
          'CapSize', 3.5, 'LineWidth', 1.5, 'Color', '[0.4940 0.1840 0.5560]');

% Trouver les fits polynômiaux
t = linspace(-11,11,10000);

% Coefficients fournis pour chaque modèle
a0 =       3.074  ;% (3.011, 3.136)
a2 =    -0.01502  ;% (-0.02174, -0.008293)
a4 =   0.0005079  ;% (0.000346, 0.0006698)
a6 =  -1.816e-06  ;% (-2.837e-06, -7.947e-07)
%{
a0 =       3.019  ;% (2.949, 3.088)
a2 =   -0.004309  ;% (-0.008176, -0.0004426)
a4 =   0.0002248  ;% (0.000187, 0.0002626)
%}
% Fit pour y (poly1)
y_fit1 = a0 + a2*t.^2 + a4*t.^4 +a6*t.^6;

% Tracer les fits en utilisant les valeurs calculées
plot(t, y_fit1, 'Color', 'black','LineStyle','--', 'LineWidth', 1);


%l2 = line([50 50],[-1 4],'Color','[0.5,0,0.5]','LineWidth',1,'LineStyle','--');
%Placer les barres d'erreur
%errorbar(x, y, R_err/2, R_err/2, I_err/2, I_err/2, '-^', 'MarkerSize', 8, 'LineWidth', 1.5, 'Color', '[0 0.4470 0.7410]' );
%errorbar(x, y, R_err/2, R_err/2, I_err/2, I_err/2, '-o', 'MarkerSize', 8, 'LineWidth', 1.5, 'Color', '[0.8500 0.3250 0.0980]' );
%errorbar(x, y, R_err/2, R_err/2, I_err/2, I_err/2, '-s', 'MarkerSize', 8, 'LineWidth', 1.5, 'Color', '[0.9290 0.6940 0.1250]' );

% On créé des "faux objets" pour mettre ce qu'on veut dans la légende

h2 = plot(10, 10, 'Color', 'black','LineStyle','--', 'LineWidth', 1);
h1 = errorbar(10, 10,R_errb,R_errh, R_errgd, R_errgd, 'o', 'MarkerSize', 3, ...
         'MarkerEdgeColor', 'red', 'MarkerFaceColor', 'red', ...
          'CapSize', 3.5, 'LineWidth', 1.5, 'Color', '[0.4940 0.1840 0.5560]');


%h3 = line(NaN, NaN,'Color','[0.5,0,0.5]','LineWidth',1,'LineStyle','--');
h=[h2,h1];

legend(h, {'fit: $y =\beta_0 + \beta_2 x^2 + \beta_4 x^4 +\beta_6 x^6$', 'Mesure'}, 'Location', 'best', 'Interpreter', 'latex', 'FontSize', 22);

% Personnalisation du graphique
ylabel('$v$ [m/s]', 'Interpreter', 'Latex', 'FontSize', 27); % Noms des axes
xlabel('$r$ [cm]', 'FontSize', 27);

%set(gca, 'XScale', 'log'); % si on veut mettre à l'échelle logarithmique


grid on; % Quadrillage
grid minor; % Placer la "sous-grille"

set(gca,'fontsize',fs)



hold off;

%% Réponse 2

% Extraire les colonnes pertinentes
x1 = Exp2(:,3);
y1 = Exp2(:,6);
R_errh1 = Exp2(:,5)-Exp2(:,6);
R_errb1 = Exp2(:,6)-Exp2(:,4);
R_errg1 = Exp2(:,2)-Exp2(:,3);
R_errd1 = Exp2(:,3)-Exp2(:,1);


x2 = Exp2(:,10);
y2 = Exp2(:,13);
R_errd2 = Exp2(:,9)- Exp2(:,10);
R_errg2 = Exp2(:,10)-Exp2(:,8);
R_errb2 = Exp2(:,12)-Exp2(:,13);
R_errh2 = Exp2(:,13)-Exp2(:,11);

x3 = Exp2(:,17);
y3 = Exp2(:,20);
R_errd3 = Exp2(:,16)-Exp2(:,17);
R_errg3 = Exp2(:,17)-Exp2(:,15);
R_errb3 = Exp2(:,19)-Exp2(:,20);
R_errh3 = Exp2(:,20)-Exp2(:,18);


figure;

hold on;

%Limites des axes X et Y
xlim([0, 10.5]);  
ylim([0, 0.15]);

%xlim([-0.2, 2]);  
%ylim([-1, 20]);

%Nombre de valeurs sur les axes X et Y
xticks(linspace(0, 10, 6)); % fonction (valeur de départ , valeur d'arrivée, combien de valeurs pour y arriver
yticks(linspace(0, 0.15, 6));

% Tracer les scatter plots

e1 = errorbar(x1, y1,R_errb1,R_errh1, R_errg1, R_errd1, 'o', 'MarkerSize', 8, ...
         'MarkerEdgeColor', 'red', 'MarkerFaceColor', 'none', ...
          'CapSize', 3.5, 'LineWidth', 1.5, 'Color', 'black');

e2 = errorbar(x2, y2,R_errb2,R_errh2, R_errg2, R_errd2, 'v', 'MarkerSize', 8, ...
         'MarkerEdgeColor', 'blue', 'MarkerFaceColor', 'none', ...
          'CapSize', 3.5, 'LineWidth', 1.5, 'Color', 'black');

e3 = errorbar(x3, y3,R_errb3,R_errh3, R_errg3, R_errd3, '*', 'MarkerSize', 8, ...
         'MarkerEdgeColor', 'magenta', 'MarkerFaceColor', 'none', ...
          'CapSize', 3.5, 'LineWidth', 1.5, 'Color', 'black');

% Trouver les fits polynômiaux
t = linspace(0,11,10000);

a1_0 = 0.01408 ;% (0.01285, 0.0153)
a0_0 = 0.005421 ;% (-0.002573, 0.01342)

a1_1 = 0.006728  ;%(0.005854, 0.007601)
a0_1 = 0.001686  ;%(-0.00407, 0.007442)

a1_2 = 0.003059 ;% (0.002665, 0.003452)
a0_2 = 0.00194  ;%(-0.0004668, 0.004346)


y_fit1 = a0_0 + a1_0*t;

y_fit2 = a0_1 + a1_1*t;

y_fit3 = a0_2 + a1_2*t;

% Tracer les fits en utilisant les valeurs calculées

plot(t, y_fit1, 'Color', 'black','LineStyle','--', 'LineWidth', 1);

plot(t, y_fit2, 'Color', 'blue','LineStyle','--', 'LineWidth', 1);

plot(t, y_fit3, 'Color', 'magenta','LineStyle','--', 'LineWidth', 1);


%l2 = line([50 50],[-1 4],'Color','[0.5,0,0.5]','LineWidth',1,'LineStyle','--');
%Placer les barres d'erreur
%errorbar(x, y, R_err/2, R_err/2, I_err/2, I_err/2, '-^', 'MarkerSize', 8, 'LineWidth', 1.5, 'Color', '[0 0.4470 0.7410]' );
%errorbar(x, y, R_err/2, R_err/2, I_err/2, I_err/2, '-o', 'MarkerSize', 8, 'LineWidth', 1.5, 'Color', '[0.8500 0.3250 0.0980]' );
%errorbar(x, y, R_err/2, R_err/2, I_err/2, I_err/2, '-s', 'MarkerSize', 8, 'LineWidth', 1.5, 'Color', '[0.9290 0.6940 0.1250]' );

% On créé des "faux objets" pour mettre ce qu'on veut dans la légende

% Créer des objets dédiés pour la légende
h1 = errorbar(NaN, NaN, NaN, NaN, 'o', 'MarkerSize', 8, ...
         'MarkerEdgeColor', 'red', 'MarkerFaceColor', 'none', ...
         'CapSize', 3.5, 'LineWidth', 1.5, 'Color', 'black');

h2 = plot(NaN, NaN, 'Color', 'black', 'LineStyle', '--', 'LineWidth', 1);

h3 = errorbar(NaN, NaN, NaN, NaN, 'v', 'MarkerSize', 8, ...
         'MarkerEdgeColor', 'blue', 'MarkerFaceColor', 'none', ...
         'CapSize', 3.5, 'LineWidth', 1.5, 'Color', 'black');

h4 = plot(NaN, NaN, 'Color', 'blue', 'LineStyle', '--', 'LineWidth', 1);

h5 = errorbar(NaN, NaN, NaN, NaN, '*', 'MarkerSize', 8, ...
         'MarkerEdgeColor', 'magenta', 'MarkerFaceColor', 'none', ...
         'CapSize', 3.5, 'LineWidth', 1.5, 'Color', 'black');

h6 = plot(NaN, NaN, 'Color', 'magenta', 'LineStyle', '--', 'LineWidth', 1);

% Grouper tous les objets pour la légende
h = [h1, h2, h3, h4, h5, h6];

% Ajouter la légende avec les styles définis
legend(h, {'Mesure Palet', 'Fit Palet', ...
           'Mesure Sphere', 'Fit Sphere', ...
           'Mesure Profil aerodynamique', 'Fit Profil aerodynamique'}, ...
       'Location', 'best', 'Interpreter', 'latex', 'FontSize', 20);

% Personnalisation du graphique
ylabel('$|\vec{R}|$ [N]', 'Interpreter', 'Latex', 'FontSize', 27); % Noms des axes
xlabel('$v^2$ [m$^2\cdot$s$^{-2}$]', 'FontSize', 27);

%set(gca, 'XScale', 'log'); % si on veut mettre à l'échelle logarithmique


grid on; % Quadrillage
grid minor; % Placer la "sous-grille"

set(gca,'fontsize',fs)



hold off;

%% Réponse 3

% Extraire les colonnes pertinentes
x = Exp3(:,4);

y = Exp3(:,7);
R_errg = Exp3(:,3)-Exp3(:,4);
R_errd = Exp3(:,4)-Exp3(:,2);

figure;

hold on;

%Limites des axes X et Y
xlim([0.12, 0.5]);  
ylim([-1.2, 1.85]);

%xlim([-0.2, 2]);  
%ylim([-1, 20]);

%Nombre de valeurs sur les axes X et Y
xticks(linspace(0.1, 0.5, 5)); % fonction (valeur de départ , valeur d'arrivée, combien de valeurs pour y arriver
yticks(linspace(-1, 2, 6));

% Tracer les scatter plots
e1=errorbar(x, y,NaN,NaN, R_errg, R_errd, 'o', 'MarkerSize', 3, ...
         'MarkerEdgeColor', 'red', 'MarkerFaceColor', 'red', ...
          'CapSize', 3.5, 'LineWidth', 1.5, 'Color', '[0.4940 0.1840 0.5560]');


% Tracer les fits en utilisant les valeurs calculées
t =linspace(0,0.5,1000);
a = 4.05;
y_fit = a*t;
plot(t, y_fit, 'Color', 'black','LineStyle','--', 'LineWidth', 1);

%l2 = line([50 50],[-1 4],'Color','[0.5,0,0.5]','LineWidth',1,'LineStyle','--');
%Placer les barres d'erreur
%errorbar(x, y, R_err/2, R_err/2, I_err/2, I_err/2, '-^', 'MarkerSize', 8, 'LineWidth', 1.5, 'Color', '[0 0.4470 0.7410]' );
%errorbar(x, y, R_err/2, R_err/2, I_err/2, I_err/2, '-o', 'MarkerSize', 8, 'LineWidth', 1.5, 'Color', '[0.8500 0.3250 0.0980]' );
%errorbar(x, y, R_err/2, R_err/2, I_err/2, I_err/2, '-s', 'MarkerSize', 8, 'LineWidth', 1.5, 'Color', '[0.9290 0.6940 0.1250]' );

% On créé des "faux objets" pour mettre ce qu'on veut dans la légende
h2 = plot(NaN, NaN, 'Color', 'black','LineStyle','--', 'LineWidth', 1);
h1 = errorbar(10, 10,NaN,NaN, R_errgd, R_errgd, 'o', 'MarkerSize', 3, ...
         'MarkerEdgeColor', 'red', 'MarkerFaceColor', 'red', ...
          'CapSize', 3.5, 'LineWidth', 1.5, 'Color', '[0.4940 0.1840 0.5560]');


%h3 = line(NaN, NaN,'Color','[0.5,0,0.5]','LineWidth',1,'LineStyle','--');
h=[h1,h2];

legend(h, {'Mesure','Tangente'}, 'Location', 'best', 'Interpreter', 'latex', 'FontSize', 27);

% Personnalisation du graphique
ylabel('$C_F$', 'Interpreter', 'Latex', 'FontSize', 27); % Noms des axes
xlabel('$C_W$', 'FontSize', 27);

%set(gca, 'XScale', 'log'); % si on veut mettre à l'échelle logarithmique


grid on; % Quadrillage
grid minor; % Placer la "sous-grille"

set(gca,'fontsize',fs)



hold off;


%% Réponse 4
% Extraire les colonnes pertinentes
x = Exp4(:,3);
y = Exp4(:,6); 
R_errh = Exp4(:,5)-Exp4(:,6);
R_errb = Exp4(:,6)-Exp4(:,4);
R_errg = Exp4(:,2)-Exp4(:,3);
R_errd = Exp4(:,3)-Exp4(:,1);

figure;

hold on;

%Limites des axes X et Y
xlim([0, 10]);  
ylim([0.00, 0.046]);

%xlim([-0.2, 2]);  
%ylim([-1, 20]);

%Nombre de valeurs sur les axes X et Y
xticks(linspace(0, 10, 5)); % fonction (valeur de départ , valeur d'arrivée, combien de valeurs pour y arriver
yticks(linspace(0.004, 0.04, 3));

% Tracer les scatter plots
  e1=errorbar(x, y,R_errb,R_errh, R_errgd, R_errgd, 'o', 'MarkerSize', 3, ...
         'MarkerEdgeColor', 'red', 'MarkerFaceColor', 'red', ...
          'CapSize', 3.5, 'LineWidth', 1.5, 'Color', '[0.4940 0.1840 0.5560]');

% Trouver les fits polynômiaux
t = linspace(0,10,10000);

% Coefficients fournis pour chaque modèle
a0 =  0.001231 ;% (-0.001302, 0.003765)
a1 =  0.004416 ;% (0.004027, 0.004805)

y_fit1 = a0 + a1*t ;

% Tracer les fits en utilisant les valeurs calculées
plot(t, y_fit1, 'Color', 'black','LineStyle','--', 'LineWidth', 1);


%l2 = line([50 50],[-1 4],'Color','[0.5,0,0.5]','LineWidth',1,'LineStyle','--');
%Placer les barres d'erreur
%errorbar(x, y, R_err/2, R_err/2, I_err/2, I_err/2, '-^', 'MarkerSize', 8, 'LineWidth', 1.5, 'Color', '[0 0.4470 0.7410]' );
%errorbar(x, y, R_err/2, R_err/2, I_err/2, I_err/2, '-o', 'MarkerSize', 8, 'LineWidth', 1.5, 'Color', '[0.8500 0.3250 0.0980]' );
%errorbar(x, y, R_err/2, R_err/2, I_err/2, I_err/2, '-s', 'MarkerSize', 8, 'LineWidth', 1.5, 'Color', '[0.9290 0.6940 0.1250]' );

% On créé des "faux objets" pour mettre ce qu'on veut dans la légende

h2 = plot(10, 10, 'Color', 'black','LineStyle','--', 'LineWidth', 1);
h1 = errorbar(10, 10,R_errb,R_errh, R_errgd, R_errgd, 'o', 'MarkerSize', 3, ...
         'MarkerEdgeColor', 'red', 'MarkerFaceColor', 'red', ...
          'CapSize', 3.5, 'LineWidth', 1.5, 'Color', '[0.4940 0.1840 0.5560]');


%h3 = line(NaN, NaN,'Color','[0.5,0,0.5]','LineWidth',1,'LineStyle','--');
h=[h2,h1];

legend(h, {'fit', 'Mesure'}, 'Location', 'best', 'Interpreter', 'latex', 'FontSize', 27);

% Personnalisation du graphique
ylabel('$|\vec{R}|$ [N]', 'Interpreter', 'Latex', 'FontSize', 27); % Noms des axes
xlabel('$v^2$ [m$^2\cdot$s$^{-2}$]', 'FontSize', 27);

ax = gca;                   % Obtenir les axes courants
ax.YAxis.Exponent = -3;     % Définir l'exposant global à -3 (équivalent à multiplier par 10^3)
ax.YAxis.TickLabelFormat = '%g'; % Formater les ticks pour afficher des nombres simples

%set(gca, 'XScale', 'log'); % si on veut mettre à l'échelle logarithmique


grid on; % Quadrillage
grid minor; % Placer la "sous-grille"

set(gca,'fontsize',fs)



hold off;


%% Réponse 5
% Extraire les colonnes pertinentes
x = Exp4(:,3);
y = Exp4(:,9); 
R_errh = Exp4(:,8)-Exp4(:,9);
R_errb = Exp4(:,9)-Exp4(:,7);
R_errg = Exp4(:,2)-Exp4(:,3);
R_errd = Exp4(:,3)-Exp4(:,1);

figure;

hold on;

%Limites des axes X et Y
xlim([0.5, 10]);  
ylim([-0.25,-0.07]);

%xlim([-0.2, 2]);  
%ylim([-1, 20]);

%Nombre de valeurs sur les axes X et Y
xticks(linspace(0, 10, 5)); % fonction (valeur de départ , valeur d'arrivée, combien de valeurs pour y arriver
yticks(linspace(-0.25, 0, 6));

% Tracer les scatter plots
  e1=errorbar(x, y,R_errb,R_errh, NaN, NaN, 'o', 'MarkerSize', 3, ...
         'MarkerEdgeColor', 'red', 'MarkerFaceColor', 'red', ...
          'CapSize', 3.5, 'LineWidth', 1.5, 'Color', '[0.4940 0.1840 0.5560]');

%{ 
Trouver les fits polynômiaux
t = linspace(0,10,10000);

% Coefficients fournis pour chaque modèle
a0 =  -0.06784  ;% (-0.1114, -0.02425)
a1 =  -0.01472  ;% (-0.02141, -0.008037)

y_fit1 = a0 + a1*t ;

% Tracer les fits en utilisant les valeurs calculées
plot(t, y_fit1, 'Color', 'black','LineStyle','--', 'LineWidth', 1);
%}

%l2 = line([50 50],[-1 4],'Color','[0.5,0,0.5]','LineWidth',1,'LineStyle','--');
%Placer les barres d'erreur
%errorbar(x, y, R_err/2, R_err/2, I_err/2, I_err/2, '-^', 'MarkerSize', 8, 'LineWidth', 1.5, 'Color', '[0 0.4470 0.7410]' );
%errorbar(x, y, R_err/2, R_err/2, I_err/2, I_err/2, '-o', 'MarkerSize', 8, 'LineWidth', 1.5, 'Color', '[0.8500 0.3250 0.0980]' );
%errorbar(x, y, R_err/2, R_err/2, I_err/2, I_err/2, '-s', 'MarkerSize', 8, 'LineWidth', 1.5, 'Color', '[0.9290 0.6940 0.1250]' );

% On créé des "faux objets" pour mettre ce qu'on veut dans la légende

%h2 = plot(10, 10, 'Color', 'black','LineStyle','--', 'LineWidth', 1);
h1 = errorbar(10, 10,R_errb,R_errh, R_errgd, R_errgd, 'o', 'MarkerSize', 3, ...
         'MarkerEdgeColor', 'red', 'MarkerFaceColor', 'red', ...
          'CapSize', 3.5, 'LineWidth', 1.5, 'Color', '[0.4940 0.1840 0.5560]');


%h3 = line(NaN, NaN,'Color','[0.5,0,0.5]','LineWidth',1,'LineStyle','--');
h=[h1];

legend(h, {'Mesure'}, 'Location', 'best', 'Interpreter', 'latex', 'FontSize', 27);

% Personnalisation du graphique
ylabel('$F_L$ [N]', 'Interpreter', 'Latex', 'FontSize', 27); % Noms des axes
xlabel('$v^2$ [m$^2\cdot$s$^{-2}$]', 'FontSize', 27);

%set(gca, 'XScale', 'log'); % si on veut mettre à l'échelle logarithmique


grid on; % Quadrillage
grid minor; % Placer la "sous-grille"

set(gca,'fontsize',fs)



hold off;
