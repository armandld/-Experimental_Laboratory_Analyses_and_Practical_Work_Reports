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

R_errb = 1;
R_errh = 1;
R_errd = 0.10;
R_errg = 0.10;

% Extraire les colonnes pertinentes
z = Dilatation_thrm_par_mat(:,1);
x = Dilatation_thrm_par_mat(:,2);
y = Dilatation_thrm_par_mat(:,5);

figure;

hold on;

%Limites des axes X et Y
xlim([-0.2, 2.75]);  
ylim([-1, 31]);

%xlim([-0.2, 2]);  
%ylim([-1, 20]);

%Nombre de valeurs sur les axes X et Y
xticks(linspace(0, 2.7, 4)); % fonction (valeur de départ , valeur d'arrivée, combien de valeurs pour y arriver
yticks(linspace(0, 30, 5));

% Tracer les scatter plots
s1 = scatter(x, z, 50,'v', 'red', 'filled'); % scatter c'est tracer les points
s2 = scatter(y, z, 50, 'blue', 'filled');

% Trouver les fits polynômiaux
t = linspace(-1,3,10000);
% Coefficients fournis pour chaque modèle
p1 =       11.51; %  (11.08, 11.94)
p2 =      0.2504; %  (-0.4203, 0.9211)
% Fit pour y (poly1)
y_fit1 = p1*t+p2;

% Coefficients fournis pour chaque modèle
p1 =        41.5; %  (36.75, 46.26)
p2 =       1.482; %  (-0.4416, 3.405)



% Fit pour y (poly2)
y_fit2 = p1*t+p2;



% Tracer les fits en utilisant les valeurs calculées
plot(t, y_fit1, 'Color', 'red','LineStyle','--', 'LineWidth', 0.5);
plot(t, y_fit2, 'Color', 'blue','LineStyle','--', 'LineWidth', 0.5);
%Placer les barres d'erreur
%errorbar(x, y, R_err/2, R_err/2, I_err/2, I_err/2, '-^', 'MarkerSize', 8, 'LineWidth', 1.5, 'Color', '[0 0.4470 0.7410]' );
%errorbar(x, y, R_err/2, R_err/2, I_err/2, I_err/2, '-o', 'MarkerSize', 8, 'LineWidth', 1.5, 'Color', '[0.8500 0.3250 0.0980]' );
%errorbar(x, y, R_err/2, R_err/2, I_err/2, I_err/2, '-s', 'MarkerSize', 8, 'LineWidth', 1.5, 'Color', '[0.9290 0.6940 0.1250]' );
e1=errorbar(x, z, R_errh, R_errb, R_errg, R_errd, 'v', 'MarkerSize', 5, ...
         'MarkerEdgeColor', 'red', 'MarkerFaceColor', 'red', ...
          'CapSize', 3.5, 'LineWidth', 1.5, 'Color', '[0.4940 0.1840 0.5560]');
e2=errorbar(y, z, R_errh, R_errb, R_errg, R_errd, 'o', 'MarkerSize', 5, ...
         'MarkerEdgeColor', 'blue', 'MarkerFaceColor', 'red', ...
          'CapSize', 3.5, 'LineWidth', 1.5, 'Color', '[0.4940 0.1840 0.5560]');


% On créé des "faux objets" pour mettre ce qu'on veut dans la légende
h1 = errorbar(10, 10, R_errh, R_errb, R_errg, R_errd, 'v', 'MarkerSize', 5, ...
         'MarkerEdgeColor', 'red', 'MarkerFaceColor', 'red', ...
          'CapSize', 3.5, 'LineWidth', 1.5, 'Color', '[0.4940 0.1840 0.5560]');
h2 = errorbar(10, 10, R_errh, R_errb, R_errg, R_errd, 'o', 'MarkerSize', 5, ...
         'MarkerEdgeColor', 'blue', 'MarkerFaceColor', 'red', ...
          'CapSize', 3.5, 'LineWidth', 1.5, 'Color', '[0.4940 0.1840 0.5560]');
h3 = plot(10, 10, 'red', 'LineStyle','--','LineWidth', 1);
h4 = plot(10, 10, 'blue', 'LineStyle','--','LineWidth', 1);

h=[h1,h2,h3,h4];

legend(h,{'Cuivre (Cu)','Aluminium (Alu)','Fit lineaire Cu','Fit lineaire Alu'}, 'Location', 'best', 'Interpreter', 'latex', 'FontSize', 27); % légende

% Personnalisation du graphique
ylabel('$N$', 'Interpreter', 'Latex', 'FontSize', 27); % Noms des axes
xlabel('$\Delta T$ [$^\circ$C]', 'FontSize', 27);

%set(gca, 'XScale', 'log'); % si on veut mettre à l'échelle logarithmique


grid on; % Quadrillage
grid minor; % Placer la "sous-grille"

set(gca,'fontsize',fs)



hold off;

%% Réponse 2

R_errb = Dilatation_thrm_mag(1:7,4);
R_errh = Dilatation_thrm_mag(1:7,4);
R_errd = 0.0010;
R_errg = 0.0010;

% Extraire les colonnes pertinentes
x = Dilatation_thrm_mag(1:7,1);
y = Dilatation_thrm_mag(1:7,2);

figure;

hold on;

%Limites des axes X et Y
xlim([-0.0015, 0.0261]);  
ylim([-2*(1e-6), 4.75*(1e-5)]);

%xlim([-0.2, 2]);  
%ylim([-1, 20]);

%Nombre de valeurs sur les axes X et Y
xticks(linspace(0, 0.025, 6)); % fonction (valeur de départ , valeur d'arrivée, combien de valeurs pour y arriver
yticks(linspace(0, 4*(1e-5), 5));

% Tracer les scatter plots
s1 = scatter(x, y, 50, 'red', 'filled'); % scatter c'est tracer les points

%Placer les barres d'erreur
%errorbar(x, y, R_err/2, R_err/2, I_err/2, I_err/2, '-^', 'MarkerSize', 8, 'LineWidth', 1.5, 'Color', '[0 0.4470 0.7410]' );
%errorbar(x, y, R_err/2, R_err/2, I_err/2, I_err/2, '-o', 'MarkerSize', 8, 'LineWidth', 1.5, 'Color', '[0.8500 0.3250 0.0980]' );
%errorbar(x, y, R_err/2, R_err/2, I_err/2, I_err/2, '-s', 'MarkerSize', 8, 'LineWidth', 1.5, 'Color', '[0.9290 0.6940 0.1250]' );
e1=errorbar(x, y, R_errh, R_errb, R_errg, R_errd, 'o', 'MarkerSize', 5, ...
         'MarkerEdgeColor', 'red', 'MarkerFaceColor', 'red', ...
          'CapSize', 3.5, 'LineWidth', 1.5, 'Color', '[0.4940 0.1840 0.5560]');

% Personnalisation du graphique
ylabel('$\frac{\Delta L}{L}$', 'Interpreter', 'Latex', 'FontSize', 27); % Noms des axes
xlabel('$B$ [T]', 'FontSize', 27);

%set(gca, 'XScale', 'log'); % si on veut mettre à l'échelle logarithmique


grid on; % Quadrillage
grid minor; % Placer la "sous-grille"

set(gca,'fontsize',fs)



hold off;


%% Réponse 3

R_errb = 2;
R_errh = 2;
R_errd = 2000;
R_errg = 2000;

% Extraire les colonnes pertinentes
x = indice_ref(:,1);
y = indice_ref(:,2);

figure;

hold on;

%Limites des axes X et Y
xlim([27000, 0.75*(1e5)]);  
ylim([-3, 22]);

%xlim([-0.2, 2]);  
%ylim([-1, 20]);

%Nombre de valeurs sur les axes X et Y
xticks(linspace(3*(1e4), 7*(1e4), 5)); % fonction (valeur de départ , valeur d'arrivée, combien de valeurs pour y arriver
yticks(linspace(0, 20, 5));

% Tracer les scatter plots
s1 = scatter(x, y, 50, 'red', 'filled'); % scatter c'est tracer les points

% Trouver les fits polynômiaux
t = linspace(27000, 0.75*(1e5),10000);
% Coefficients fournis pour chaque modèle
p1 =     0.00048; % (0.0004433, 0.0005167)
p2 =       -14.2; % (-16.11, -12.29)
% Fit pour y (poly1)
y_fit1 = p1*t+p2;

% Tracer les fits en utilisant les valeurs calculées
plot(t, y_fit1, 'Color', 'red','LineStyle','--', 'LineWidth', 0.5);

%Placer les barres d'erreur
%errorbar(x, y, R_err/2, R_err/2, I_err/2, I_err/2, '-^', 'MarkerSize', 8, 'LineWidth', 1.5, 'Color', '[0 0.4470 0.7410]' );
%errorbar(x, y, R_err/2, R_err/2, I_err/2, I_err/2, '-o', 'MarkerSize', 8, 'LineWidth', 1.5, 'Color', '[0.8500 0.3250 0.0980]' );
%errorbar(x, y, R_err/2, R_err/2, I_err/2, I_err/2, '-s', 'MarkerSize', 8, 'LineWidth', 1.5, 'Color', '[0.9290 0.6940 0.1250]' );
e1=errorbar(x, y, R_errh, R_errb, R_errg, R_errd, 'o', 'MarkerSize', 5, ...
         'MarkerEdgeColor', 'red', 'MarkerFaceColor', 'red', ...
          'CapSize', 3.5, 'LineWidth', 1.5, 'Color', '[0.4940 0.1840 0.5560]');

% Personnalisation du graphique
ylabel('$N$', 'Interpreter', 'Latex', 'FontSize', 27); % Noms des axes
xlabel('$p$ [Pa]', 'FontSize', 27);

%set(gca, 'XScale', 'log'); % si on veut mettre à l'échelle logarithmique


grid on; % Quadrillage
grid minor; % Placer la "sous-grille"

set(gca,'fontsize',fs)

hold off;