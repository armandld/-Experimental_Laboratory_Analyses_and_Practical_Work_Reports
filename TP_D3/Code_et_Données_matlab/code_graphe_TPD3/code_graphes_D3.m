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

x = Echantillon_amb_1(1:4550,1);
y = Echantillon_amb_1(1:4550,2);

figure;

hold on;

%Limites des axes X et Y
xlim([-0.005/18.2, 0.043]);  
ylim([0, 5.45/(8.08*0.002)]);

%xlim([-0.2, 2]);  
%ylim([-1, 20]);

%Nombre de valeurs sur les axes X et Y
xticks(linspace(0, 0.03, 4)); % fonction (valeur de départ , valeur d'arrivée, combien de valeurs pour y arriver
yticks(linspace(0, 240, 5));

% Tracer les scatter plots
s1 = plot(x, y,'.r', 'MarkerSize', 2);
% Trouver les fits polynômiaux
t = linspace(0,0.0037674,10000);

% Coefficients fournis pour chaque modèle
p1 = 84776.73; %(84217.11, 85357.95)

% Fit pour y (poly1)
y_fit1 = p1*t;

% Coefficients fournis pour chaque modèle
p2 = 0.7043806327/18.2; %  (-0.4416, 3.405)

u = linspace(p2,0.0037674+p2,10000);
% Fit pour y (poly2)
y_fit2 = p1*(u-p2);

% Tracer les fits en utilisant les valeurs calculées
k1 =plot(t, y_fit1, 'Color', 'black','LineStyle','--', 'LineWidth', 1);
k2 = plot(u, y_fit2, 'Color', 'blue','LineStyle','--', 'LineWidth', 1);

x_sig = 0.002;
v=linspace(x_sig,0.00530632,1000);
y_sig= p1*(v-x_sig);
v1= plot(v,y_sig, 'Color', '[1, 0.647, 0]','LineStyle','-.', 'LineWidth', 1);
sig= line([-1 0.00530632], [281.545 281.545], 'Color', '[1, 0.647, 0]', 'LineStyle', '-.', 'LineWidth', 1);

l1=line([-1 1], [319.3942 319.3942], 'Color', 'magenta', 'LineStyle', '--', 'LineWidth', 1);
%Placer les barres d'erreur
%errorbar(x, y, R_err/2, R_err/2, I_err/2, I_err/2, '-^', 'MarkerSize', 8, 'LineWidth', 1.5, 'Color', '[0 0.4470 0.7410]' );
%errorbar(x, y, R_err/2, R_err/2, I_err/2, I_err/2, '-o', 'MarkerSize', 8, 'LineWidth', 1.5, 'Color', '[0.8500 0.3250 0.0980]' );
%errorbar(x, y, R_err/2, R_err/2, I_err/2, I_err/2, '-s', 'MarkerSize', 8, 'LineWidth', 1.5, 'Color', '[0.9290 0.6940 0.1250]' );
% Ajouter x=0.0387022 à xticks existants
% Ajouter x=0.0387022 à xticks existants
new_ticks = [get(gca, 'XTick'), 0.0387022]; % Ajouter 0.0387022 aux ticks existants
xticks(new_ticks);

% Récupérer les labels actuels
xticklabels = get(gca, 'XTickLabel');

% Changer le label pour le tick correspondant à 0.0387022
xticklabels{end} = '$\varepsilon_{rup}$'; % Modifie le dernier label en $\varepsilon_{rup}$

% Appliquer les nouveaux labels
set(gca, 'XTickLabel', xticklabels);

new_ticks = [get(gca, 'YTick'), 281.545]; % Ajouter 0.0387022 aux ticks existants
yticks(new_ticks);

% Récupérer les labels actuels
yticklabels = get(gca, 'YTickLabel');

% Changer le label pour le tick correspondant à 0.0387022
yticklabels{end} = '$\sigma_{0.2}$'; % Modifie le dernier label en $\varepsilon_{rup}$

% Appliquer les nouveaux labels
set(gca, 'YTickLabel', yticklabels);

new_ticks = [get(gca, 'YTick'), 319.388]; % Ajouter 0.0387022 aux ticks existants
yticks(new_ticks);

% Récupérer les labels actuels
yticklabels = get(gca, 'YTickLabel');

% Changer le label pour le tick correspondant à 0.0387022
yticklabels{end+1} = '$\sigma_{max}$'; % Modifie le dernier label en $\varepsilon_{rup}$

% Appliquer les nouveaux labels
set(gca, 'YTickLabel', yticklabels);
% On créé des "faux objets" pour mettre ce qu'on veut dans la légende
h1 = plot(NaN, NaN,'r', 'MarkerSize', 2);            
h2 = plot(NaN, NaN, 'Color', 'black','LineStyle','--', 'LineWidth', 1);
h3 = plot(NaN, NaN, 'Color', 'blue','LineStyle','--', 'LineWidth', 1);
h4=line(NaN, NaN, 'Color', 'magenta', 'LineStyle', '--', 'LineWidth', 1);
h5 = line(NaN, NaN, 'Color', '[1, 0.647, 0]', 'LineStyle', '-.', 'LineWidth', 1);

h=[h1,h2,h3,h4,h5];

legend(h,{'Mesure','Fit lineaire de $E$','$\varepsilon_{rup}$','$\sigma_{max}$','$\sigma_{0.2}$'}, 'Location', 'best', 'Interpreter', 'latex', 'FontSize', 27); % légende

% Personnalisation du graphique
ylabel('$\sigma$ [MPa]', 'Interpreter', 'Latex', 'FontSize', 27); % Noms des axes
xlabel('$\varepsilon$', 'FontSize', 27);

%set(gca, 'XScale', 'log'); % si on veut mettre à l'échelle logarithmique


grid on; % Quadrillage
grid minor; % Placer la "sous-grille"

set(gca,'fontsize',fs)

% Faire passer h1 au premier plan
uistack(k1, 'top');
uistack(k2, 'top');

hold off;

%% Réponse 2


% Extraire les colonnes pertinentes

x = Echantillon_amb_2(1:4865,1);
y = Echantillon_amb_2(1:4865,2);

figure;

hold on;

%Limites des axes X et Y
xlim([-0.01/18.06, 0.034]);  
ylim([0, 330]);

%xlim([-0.2, 2]);  
%ylim([-1, 20]);

%Nombre de valeurs sur les axes X et Y
xticks(linspace(0, 0.026,4)); % fonction (valeur de départ , valeur d'arrivée, combien de valeurs pour y arriver
yticks(linspace(0, 210, 4));

% Tracer les scatter plots
s1 = plot(x, y,'.r', 'MarkerSize', 2);
% Trouver les fits polynômiaux
t = linspace(-1,0.0019,10000);

% Coefficients fournis pour chaque modèle
p1 =  169265.57 ;% (156589.24,  181941.90)

% Fit pour y (poly1)
y_fit1 = p1*t;

% Coefficients fournis pour chaque modèle
p2 = 0.55315/18.06; 

u = linspace(0.0306,0.032521,10000);
% Fit pour y (poly2)
y_fit2 = p1*(u-p2);

% Tracer les fits en utilisant les valeurs calculées
plot(t, y_fit1, 'Color', 'black','LineStyle','--', 'LineWidth', 1);
plot(u, y_fit2, 'Color', 'blue','LineStyle','--', 'LineWidth', 1);


x_sig = 0.002;
v=linspace(x_sig,0.00368,1000);
y_sig= p1*(v-x_sig);
v1= plot(v,y_sig, 'Color', '[1, 0.647, 0]','LineStyle','-.', 'LineWidth', 1);
sig= line([-1 0.00368], [284.559 284.559], 'Color', '[1, 0.647, 0]', 'LineStyle', '-.', 'LineWidth', 1);

l1=line([-1 1], [320.6966 320.6966], 'Color', 'magenta', 'LineStyle', '--', 'LineWidth', 1);
%Placer les barres d'erreur
%errorbar(x, y, R_err/2, R_err/2, I_err/2, I_err/2, '-^', 'MarkerSize', 8, 'LineWidth', 1.5, 'Color', '[0 0.4470 0.7410]' );
%errorbar(x, y, R_err/2, R_err/2, I_err/2, I_err/2, '-o', 'MarkerSize', 8, 'LineWidth', 1.5, 'Color', '[0.8500 0.3250 0.0980]' );
%errorbar(x, y, R_err/2, R_err/2, I_err/2, I_err/2, '-s', 'MarkerSize', 8, 'LineWidth', 1.5, 'Color', '[0.9290 0.6940 0.1250]' );
new_ticks = [get(gca, 'XTick'), 0.030638]; % Ajouter 0.0387022 aux ticks existants
xticks(new_ticks);

% Récupérer les labels actuels
xticklabels = get(gca, 'XTickLabel');

% Changer le label pour le tick correspondant à 0.0387022
xticklabels{end} = '$\varepsilon_{rup}$'; % Modifie le dernier label en $\varepsilon_{rup}$

% Appliquer les nouveaux labels
set(gca, 'XTickLabel', xticklabels);

% Ajouter 96.1586 aux ticks de l'axe Y
new_yticks = sort([get(gca, 'YTick'), 284.559]); % Ajout et tri des valeurs
yticks(new_yticks);

% Modifier le label correspondant à 96.1586
yticklabels = get(gca, 'YTickLabel');
yticklabels{end} = '$\sigma_{0.2}$'; % Remplace le dernier label en $\sigma_{0.2}$
set(gca, 'YTickLabel', yticklabels);

% Ajouter 185.8319 aux ticks de l'axe Y
new_yticks2 = sort([get(gca, 'YTick'), 320.6966]); % Ajout et tri des valeurs
yticks(new_yticks2);

% Modifier le label correspondant à 185.8319
yticklabels = get(gca, 'YTickLabel');
yticklabels{end+1} = '$\sigma_{max}$'; % Remplace le dernier label en $\sigma_{max}$
set(gca, 'YTickLabel', yticklabels);


% On créé des "faux objets" pour mettre ce qu'on veut dans la légende
h1 = plot(NaN, NaN,'r', 'MarkerSize', 2);            
h2 = plot(NaN, NaN, 'Color', 'black','LineStyle','--', 'LineWidth', 1);
h3 = plot(NaN, NaN, 'Color', 'blue','LineStyle','--', 'LineWidth', 1);
h4=line(NaN, NaN, 'Color', 'magenta', 'LineStyle', '--', 'LineWidth', 1);
h5 = line(NaN, NaN, 'Color', '[1, 0.647, 0]', 'LineStyle', '-.', 'LineWidth', 1);

h=[h1,h2,h3,h4,h5];

legend(h,{'Mesure','Fit lineaire de $E$','$\varepsilon_{rup}$','$\sigma_{max}$','$\sigma_{0.2}$'}, 'Location', 'best', 'Interpreter', 'latex', 'FontSize', 27); % légende

% Personnalisation du graphique
ylabel('$\sigma$ [MPa]', 'Interpreter', 'Latex', 'FontSize', 27); % Noms des axes
xlabel('$\varepsilon$', 'FontSize', 27);

%set(gca, 'XScale', 'log'); % si on veut mettre à l'échelle logarithmique


grid on; % Quadrillage
grid minor; % Placer la "sous-grille"

set(gca,'fontsize',fs)

hold off;

%% Réponse 3

% Extraire les colonnes pertinentes

x = Echantillon_550_1(:,1);
y = Echantillon_550_1(:,2);

figure;

hold on;

%Limites des axes X et Y
xlim([-0.015/18.54, 0.0531]);  
ylim([0, 3.1/(0.002*7.9794)]);

%xlim([-0.2, 2]);  
%ylim([-1, 20]);

%Nombre de valeurs sur les axes X et Y
xticks(linspace(0, 0.044, 5)); % fonction (valeur de départ , valeur d'arrivée, combien de valeurs pour y arriver
yticks(linspace(0, 130, 4));
% Tracer les scatter plots
s1 = plot(x, y,'.r', 'MarkerSize', 2);

% Trouver les fits polynômiaux
t = linspace(0,17.338e-4,10000);

% Coefficients fournis pour chaque modèle
p1 = 1.062e+05 ;% (1.037e+05, 1.088e+05)
% Fit pour y (poly1)
y_fit1 = p1*t;

% Coefficients fournis pour chaque modèle
p2 = 0.05052935; 
u = linspace(p2,0.05227,10000);
% Fit pour y (poly2)
y_fit2 = p1*(u-p2);

% Tracer les fits en utilisant les valeurs calculées
plot(t, y_fit1, 'Color', 'black','LineStyle','--', 'LineWidth', 1);
plot(u, y_fit2, 'Color', 'blue','LineStyle','--', 'LineWidth', 1);

x_sig = 0.002;
v=linspace(x_sig,0.00300501,1000);
y_sig= p1*(v-x_sig);
v1= plot(v,y_sig, 'Color', '[1, 0.647, 0]','LineStyle','-.', 'LineWidth', 1);
sig= line([-1 0.00300501], [106.732 106.732], 'Color', '[1, 0.647, 0]', 'LineStyle', '-.', 'LineWidth', 1);

l1=line([-1 1], [ 182.731  185.731], 'Color', 'magenta', 'LineStyle', '--', 'LineWidth', 1);
%Placer les barres d'erreur
%errorbar(x, y, R_err/2, R_err/2, I_err/2, I_err/2, '-^', 'MarkerSize', 8, 'LineWidth', 1.5, 'Color', '[0 0.4470 0.7410]' );
%errorbar(x, y, R_err/2, R_err/2, I_err/2, I_err/2, '-o', 'MarkerSize', 8, 'LineWidth', 1.5, 'Color', '[0.8500 0.3250 0.0980]' );
%errorbar(x, y, R_err/2, R_err/2, I_err/2, I_err/2, '-s', 'MarkerSize', 8, 'LineWidth', 1.5, 'Color', '[0.9290 0.6940 0.1250]' );

new_ticks = [get(gca, 'XTick'), 0.05052935]; % Ajouter 0.0387022 aux ticks existants
xticks(new_ticks);

% Récupérer les labels actuels
xticklabels = get(gca, 'XTickLabel');

% Changer le label pour le tick correspondant à 0.0387022
xticklabels{end} = '$\varepsilon_{rup}$'; % Modifie le dernier label en $\varepsilon_{rup}$

% Appliquer les nouveaux labels
set(gca, 'XTickLabel', xticklabels);

% Ajouter 96.1586 aux ticks de l'axe Y
new_yticks = sort([get(gca, 'YTick'), 106.732]); % Ajout et tri des valeurs
yticks(new_yticks);

% Modifier le label correspondant à 96.1586
yticklabels = get(gca, 'YTickLabel');
yticklabels{4} = '$\sigma_{0.2}$'; % Remplace le dernier label en $\sigma_{0.2}$
set(gca, 'YTickLabel', yticklabels);

% Ajouter 185.8319 aux ticks de l'axe Y
new_yticks2 = sort([get(gca, 'YTick'), 182.731]); % Ajout et tri des valeurs
yticks(new_yticks2);

% Modifier le label correspondant à 185.8319
yticklabels = get(gca, 'YTickLabel');
yticklabels{end+1} = '$\sigma_{max}$'; % Remplace le dernier label en $\sigma_{max}$
set(gca, 'YTickLabel', yticklabels);

% On créé des "faux objets" pour mettre ce qu'on veut dans la légende
h1 = plot(NaN, NaN,'r', 'MarkerSize', 2);            
h2 = plot(NaN, NaN, 'Color', 'black','LineStyle','--', 'LineWidth', 1);
h3 = plot(NaN, NaN, 'Color', 'blue','LineStyle','--', 'LineWidth', 1);
h4=line(NaN, NaN, 'Color', 'magenta', 'LineStyle', '--', 'LineWidth', 1);
h5 = line(NaN, NaN, 'Color', '[1, 0.647, 0]', 'LineStyle', '-.', 'LineWidth', 1);

h=[h1,h2,h3,h4,h5];

legend(h,{'Mesure','Fit lineaire de $E$','$\varepsilon_{rup}$','$\sigma_{max}$','$\sigma_{0.2}$'}, 'Location', 'best', 'Interpreter', 'latex', 'FontSize', 27); % légende

% Personnalisation du graphique
ylabel('$\sigma$ [MPa]', 'Interpreter', 'Latex', 'FontSize', 27); % Noms des axes
xlabel('$\varepsilon$', 'FontSize', 27);

%set(gca, 'XScale', 'log'); % si on veut mettre à l'échelle logarithmique


grid on; % Quadrillage
grid minor; % Placer la "sous-grille"

set(gca,'fontsize',fs)

hold off;

%% Réponse 4

% Extraire les colonnes pertinentes

x = Echantillon_550_2(:,1);
y = Echantillon_550_2(:,2);

figure;

hold on;

%Limites des axes X et Y
xlim([-0.025/19.14, 0.066]);  
ylim([0, 3.1/(0.002*8.0802)]);

%xlim([-0.2, 2]);  
%ylim([-1, 20]);

%Nombre de valeurs sur les axes X et Y
xticks(linspace(0, 0.055, 5)); % fonction (valeur de départ , valeur d'arrivée, combien de valeurs pour y arriver
yticks(linspace(0, 150, 5));

% Tracer les scatter plots
s1 = plot(x, y,'.r', 'MarkerSize', 2);     

% Trouver les fits polynômiaux
t = linspace(0,6.5954e-4,10000);

% Coefficients fournis pour chaque modèle
p1 = 281759.84 ; % (275582.63, 287937.05)
% Fit pour y (poly1)
y_fit1 = p1*t;

% Coefficients fournis pour chaque modèle
p2 = 1.2377/19.14; 
u = linspace(p2,0.065323,10000);
% Fit pour y (poly2)
y_fit2 = p1*(u-p2);

% Tracer les fits en utilisant les valeurs calculées
plot(t, y_fit1, 'Color', 'black','LineStyle','--', 'LineWidth', 1);
plot(u, y_fit2, 'Color', 'blue','LineStyle','--', 'LineWidth', 1);

x_sig = 0.002;
v=linspace(x_sig,0.00233438,1000);
y_sig= p1*(v-x_sig);
v1= plot(v,y_sig, 'Color', '[1, 0.647, 0]','LineStyle','-.', 'LineWidth', 1);
sig= line([-1 0.00233438], [96.1586 96.1586], 'Color', '[1, 0.647, 0]', 'LineStyle', '-.', 'LineWidth', 1);

l1=line([-1 1], [ 185.8319  185.8319], 'Color', 'magenta', 'LineStyle', '--', 'LineWidth', 1);
%Placer les barres d'erreur
%errorbar(x, y, R_err/2, R_err/2, I_err/2, I_err/2, '-^', 'MarkerSize', 8, 'LineWidth', 1.5, 'Color', '[0 0.4470 0.7410]' );
%errorbar(x, y, R_err/2, R_err/2, I_err/2, I_err/2, '-o', 'MarkerSize', 8, 'LineWidth', 1.5, 'Color', '[0.8500 0.3250 0.0980]' );
%errorbar(x, y, R_err/2, R_err/2, I_err/2, I_err/2, '-s', 'MarkerSize', 8, 'LineWidth', 1.5, 'Color', '[0.9290 0.6940 0.1250]' );

new_ticks = [get(gca, 'XTick'), 0.0646656]; % Ajouter 0.0387022 aux ticks existants
xticks(new_ticks);

% Récupérer les labels actuels
xticklabels = get(gca, 'XTickLabel');

% Changer le label pour le tick correspondant à 0.0387022
xticklabels{end} = '$\varepsilon_{rup}$'; % Modifie le dernier label en $\varepsilon_{rup}$

% Appliquer les nouveaux labels
set(gca, 'XTickLabel', xticklabels);

% Ajouter 96.1586 aux ticks de l'axe Y
new_yticks = sort([get(gca, 'YTick'), 96.1586]); % Ajout et tri des valeurs
yticks(new_yticks);

% Modifier le label correspondant à 96.1586
yticklabels = get(gca, 'YTickLabel');
yticklabels{4} = '$\sigma_{0.2}$'; % Remplace le dernier label en $\sigma_{0.2}$
set(gca, 'YTickLabel', yticklabels);

% Ajouter 185.8319 aux ticks de l'axe Y
new_yticks2 = sort([get(gca, 'YTick'), 185.8319]); % Ajout et tri des valeurs
yticks(new_yticks2);

% Modifier le label correspondant à 185.8319
yticklabels = get(gca, 'YTickLabel');
yticklabels{end+1} = '$\sigma_{max}$'; % Remplace le dernier label en $\sigma_{max}$
set(gca, 'YTickLabel', yticklabels);

% On créé des "faux objets" pour mettre ce qu'on veut dans la légende
h1 = plot(NaN, NaN,'r', 'MarkerSize', 2);     
h2 = plot(NaN, NaN, 'Color', 'black','LineStyle','--', 'LineWidth', 1);
h3 = plot(NaN, NaN, 'Color', 'blue','LineStyle','--', 'LineWidth', 1);
h4=line(NaN, NaN, 'Color', 'magenta', 'LineStyle', '--', 'LineWidth', 1);
h5 = line(NaN, NaN, 'Color', '[1, 0.647, 0]', 'LineStyle', '-.', 'LineWidth', 1);

h=[h1,h2,h3,h4,h5];

legend(h,{'Mesure','Fit lineaire de $E$','$\varepsilon_{rup}$','$\sigma_{max}$','$\sigma_{0.2}$'}, 'Location', 'best', 'Interpreter', 'latex', 'FontSize', 27); % légende

% Personnalisation du graphique
ylabel('$\sigma$ [MPa]', 'Interpreter', 'Latex', 'FontSize', 27); % Noms des axes
xlabel('$\varepsilon$', 'FontSize', 27);

%set(gca, 'XScale', 'log'); % si on veut mettre à l'échelle logarithmique


grid on; % Quadrillage
grid minor; % Placer la "sous-grille"

set(gca,'fontsize',fs)

hold off;

%% Réponse 5

% Extraire les colonnes pertinentes

x = Echantillon_250_1(:,1);
y = Echantillon_250_1(:,2);

figure;

hold on;

%Limites des axes X et Y
xlim([-0.01/18.34, 0.038]);  
ylim([0, 205]);

%xlim([-0.2, 2]);  
%ylim([-1, 20]);

%Nombre de valeurs sur les axes X et Y
xticks(linspace(0, 0.03, 4)); % fonction (valeur de départ , valeur d'arrivée, combien de valeurs pour y arriver
yticks(linspace(0, 120, 4));

% Tracer les scatter plots
s1 = plot(x, y,'.r', 'MarkerSize', 2);

% Trouver les fits polynômiaux
t = linspace(-1,0.00084,10000);

% Coefficients fournis pour chaque modèle
p1 = 2.387e+05  ;%(2.377e+05, 2.396e+05)
% Fit pour y (poly1)
y_fit1 = p1*t;

% Coefficients fournis pour chaque modèle
p2 = 0.03675;

u = linspace(p2,0.03759,10000);
% Fit pour y (poly2)
y_fit2 = p1*(u-p2);

% Tracer les fits en utilisant les valeurs calculées
plot(t, y_fit1, 'Color', 'black','LineStyle','--', 'LineWidth', 1);
plot(u, y_fit2, 'Color', 'blue','LineStyle','--', 'LineWidth', 1);

x_sig = 0.002;
v=linspace(x_sig,0.00266,1000);
y_sig= p1*(v-x_sig);
v1= plot(v,y_sig, 'Color', '[1, 0.647, 0]','LineStyle','-.', 'LineWidth', 1);
sig= line([-1 0.00266], [158.273 158.273], 'Color', '[1, 0.647, 0]', 'LineStyle', '-.', 'LineWidth', 1);

l1=line([-1 1], [198.7683  198.7683], 'Color', 'magenta', 'LineStyle', '--', 'LineWidth', 1);

%Placer les barres d'erreur
%errorbar(x, y, R_err/2, R_err/2, I_err/2, I_err/2, '-^', 'MarkerSize', 8, 'LineWidth', 1.5, 'Color', '[0 0.4470 0.7410]' );
%errorbar(x, y, R_err/2, R_err/2, I_err/2, I_err/2, '-o', 'MarkerSize', 8, 'LineWidth', 1.5, 'Color', '[0.8500 0.3250 0.0980]' );
%errorbar(x, y, R_err/2, R_err/2, I_err/2, I_err/2, '-s', 'MarkerSize', 8, 'LineWidth', 1.5, 'Color', '[0.9290 0.6940 0.1250]' );
new_ticks = [get(gca, 'XTick'), 0.036753]; % Ajouter 0.0387022 aux ticks existants
xticks(new_ticks);

% Récupérer les labels actuels
xticklabels = get(gca, 'XTickLabel');

% Changer le label pour le tick correspondant à 0.0387022
xticklabels{end} = '$\varepsilon_{rup}$'; % Modifie le dernier label en $\varepsilon_{rup}$

% Appliquer les nouveaux labels
set(gca, 'XTickLabel', xticklabels);

new_ticks = [get(gca, 'YTick'), 158.273]; % Ajouter 0.0387022 aux ticks existants
yticks(new_ticks);

% Récupérer les labels actuels
yticklabels = get(gca, 'YTickLabel');

% Changer le label pour le tick correspondant à 0.0387022
yticklabels{end} = '$\sigma_{0.2}$'; % Modifie le dernier label en $\varepsilon_{rup}$

% Appliquer les nouveaux labels
set(gca, 'YTickLabel', yticklabels);

new_ticks = [get(gca, 'YTick'), 198.7683]; % Ajouter 0.0387022 aux ticks existants
yticks(new_ticks);

% Récupérer les labels actuels
yticklabels = get(gca, 'YTickLabel');

% Changer le label pour le tick correspondant à 0.0387022
yticklabels{end+1} = '$\sigma_{max}$'; % Modifie le dernier label en $\varepsilon_{rup}$

% Appliquer les nouveaux labels
set(gca, 'YTickLabel', yticklabels);

% On créé des "faux objets" pour mettre ce qu'on veut dans la légende
h1 = plot(NaN, NaN,'r', 'MarkerSize', 2);            
h2 = plot(NaN, NaN, 'Color', 'black','LineStyle','--', 'LineWidth', 1);
h3 = plot(NaN, NaN, 'Color', 'blue','LineStyle','--', 'LineWidth', 1);
h4=line(NaN, NaN, 'Color', 'magenta', 'LineStyle', '--', 'LineWidth', 1);
h5 = line(NaN, NaN, 'Color', '[1, 0.647, 0]', 'LineStyle', '-.', 'LineWidth', 1);

h=[h1,h2,h3,h4,h5];

legend(h,{'Mesure','Fit lineaire de $E$','$\varepsilon_{rup}$','$\sigma_{max}$','$\sigma_{0.2}$'}, 'Location', 'best', 'Interpreter', 'latex', 'FontSize', 27); % légende

% Personnalisation du graphique
ylabel('$\sigma$ [MPa]', 'Interpreter', 'Latex', 'FontSize', 27); % Noms des axes
xlabel('$\varepsilon$', 'FontSize', 27);

%set(gca, 'XScale', 'log'); % si on veut mettre à l'échelle logarithmique


grid on; % Quadrillage
grid minor; % Placer la "sous-grille"

set(gca,'fontsize',fs)

hold off;

%% Réponse 6

% Extraire les colonnes pertinentes

x = Echantillon_250_2(:,1);
y = Echantillon_250_2(:,2);

figure;

hold on;

%Limites des axes X et Y
xlim([-0.008/18.04, 0.0387]);  
ylim([0, 3.6/(0.002*8.2418)]);

%xlim([-0.2, 2]);  
%ylim([-1, 20]);

%Nombre de valeurs sur les axes X et Y
xticks(linspace(0, 0.03, 4)); % fonction (valeur de départ , valeur d'arrivée, combien de valeurs pour y arriver
yticks(linspace(0, 140, 5));

% Tracer les scatter plots
s1 = plot(x, y,'.r', 'MarkerSize', 2);

% Trouver les fits polynômiaux
t = linspace(0,0.001404,10000);

% Coefficients fournis pour chaque modèle
p1 = 1.487e+05 ;% (1.459e+05, 1.515e+05)
% Fit pour y (poly1)
y_fit1 = p1*t;

% Coefficients fournis pour chaque modèle
p2 = 0.037226;
u = linspace(p2,0.001404+p2,10000);
% Fit pour y (poly2)
y_fit2 = p1*(u-p2);

% Tracer les fits en utilisant les valeurs calculées
plot(t, y_fit1, 'Color', 'black','LineStyle','--', 'LineWidth', 1);
plot(u, y_fit2, 'Color', 'blue','LineStyle','--', 'LineWidth', 1);


x_sig = 0.002;
v=linspace(x_sig,0.00315,1000);
y_sig= p1*(v-x_sig);
v1= plot(v,y_sig, 'Color', '[1, 0.647, 0]','LineStyle','-.', 'LineWidth', 1);
sig= line([-1 0.00306303], [170.559 170.559], 'Color', '[1, 0.647, 0]', 'LineStyle', '-.', 'LineWidth', 1);

l1=line([-1 1], [ 208.8219 208.8219], 'Color', 'magenta', 'LineStyle', '--', 'LineWidth', 1);
%Placer les barres d'erreur
%errorbar(x, y, R_err/2, R_err/2, I_err/2, I_err/2, '-^', 'MarkerSize', 8, 'LineWidth', 1.5, 'Color', '[0 0.4470 0.7410]' );
%errorbar(x, y, R_err/2, R_err/2, I_err/2, I_err/2, '-o', 'MarkerSize', 8, 'LineWidth', 1.5, 'Color', '[0.8500 0.3250 0.0980]' );
%errorbar(x, y, R_err/2, R_err/2, I_err/2, I_err/2, '-s', 'MarkerSize', 8, 'LineWidth', 1.5, 'Color', '[0.9290 0.6940 0.1250]' );
new_ticks = [get(gca, 'XTick'), 0.0372278]; % Ajouter 0.0387022 aux ticks existants
xticks(new_ticks);

% Récupérer les labels actuels
xticklabels = get(gca, 'XTickLabel');

% Changer le label pour le tick correspondant à 0.0387022
xticklabels{end} = '$\varepsilon_{rup}$'; % Modifie le dernier label en $\varepsilon_{rup}$

% Appliquer les nouveaux labels
set(gca, 'XTickLabel', xticklabels);

new_ticks = [get(gca, 'YTick'), 170.559]; % Ajouter 0.0387022 aux ticks existants
yticks(new_ticks);

% Récupérer les labels actuels
yticklabels = get(gca, 'YTickLabel');

% Changer le label pour le tick correspondant à 0.0387022
yticklabels{end} = '$\sigma_{0.2}$'; % Modifie le dernier label en $\varepsilon_{rup}$

% Appliquer les nouveaux labels
set(gca, 'YTickLabel', yticklabels);

new_ticks = [get(gca, 'YTick'), 208.8219]; % Ajouter 0.0387022 aux ticks existants
yticks(new_ticks);

% Récupérer les labels actuels
yticklabels = get(gca, 'YTickLabel');

% Changer le label pour le tick correspondant à 0.0387022
yticklabels{end+1} = '$\sigma_{max}$'; % Modifie le dernier label en $\varepsilon_{rup}$

% Appliquer les nouveaux labels
set(gca, 'YTickLabel', yticklabels);

% On créé des "faux objets" pour mettre ce qu'on veut dans la légende
h1 = plot(NaN, NaN,'r', 'MarkerSize', 2);
h2 = plot(NaN, NaN, 'Color', 'black','LineStyle','--', 'LineWidth', 1);
h3 = plot(NaN, NaN, 'Color', 'blue','LineStyle','--', 'LineWidth', 1);
h4 = line(NaN, NaN, 'Color', 'magenta', 'LineStyle', '--', 'LineWidth', 1);
h5 = line(NaN, NaN, 'Color', '[1, 0.647, 0]', 'LineStyle', '-.', 'LineWidth', 1);

h=[h1,h2,h3,h4,h5];

legend(h,{'Mesure','Fit lineaire de $E$','$\varepsilon_{rup}$','$\sigma_{max}$','$\sigma_{0.2}$'}, 'Location', 'best', 'Interpreter', 'latex', 'FontSize', 27); % légende

% Personnalisation du graphique
ylabel('$\sigma$ [MPa]', 'Interpreter', 'Latex', 'FontSize', 27); % Noms des axes
xlabel('$\varepsilon$', 'FontSize', 27);

%set(gca, 'XScale', 'log'); % si on veut mettre à l'échelle logarithmique


grid on; % Quadrillage
grid minor; % Placer la "sous-grille"

set(gca,'fontsize',fs)

hold off;

%% Réponse 7

% Extraire les colonnes pertinentes

x1 = Echantillon_amb_1(:,1);
y1 = Echantillon_amb_1(:,2);
x2 = Echantillon_550_2(:,1);
y2 = Echantillon_550_2(:,2);
x3 = Echantillon_250_2(:,1);
y3 = Echantillon_250_2(:,2);

figure;

hold on;

%Limites des axes X et Y
xlim([-0.025/19.14, 0.0657]);  
ylim([0, 325]);
%xlim([-0.2, 2]);  
%ylim([-1, 20]);

%Nombre de valeurs sur les axes X et Y
xticks(linspace(0, 0.06, 6)); % fonction (valeur de départ , valeur d'arrivée, combien de valeurs pour y arriver
yticks(linspace(0, 300, 5));

% Tracer les scatter plots
s1 = plot(x1, y1,'.r', 'MarkerSize', 2);
s2 = plot(x2, y2,'.b', 'MarkerSize', 2);
s3 = plot(x3, y3,'.k', 'MarkerSize', 2);

% On créé des "faux objets" pour mettre ce qu'on veut dans la légende
h1 = plot(NaN, NaN,'r', 'MarkerSize', 2);
h2 = plot(NaN, NaN, 'Color', 'black', 'LineWidth', 1);
h3 = plot(NaN, NaN, 'Color', 'blue', 'LineWidth', 1);
h=[h1,h2,h3];

legend(h,{'non traite','Chauffe pendant 1h','Chauffe 1h puis rechauffe 20 min'}, 'Location', 'best', 'Interpreter', 'latex', 'FontSize', 27); % légende

% Personnalisation du graphique
ylabel('$\sigma$ [MPa]', 'Interpreter', 'Latex', 'FontSize', 27); % Noms des axes
xlabel('$\varepsilon$', 'FontSize', 27);

%set(gca, 'XScale', 'log'); % si on veut mettre à l'échelle logarithmique


grid on; % Quadrillage
grid minor; % Placer la "sous-grille"

set(gca,'fontsize',fs)

hold off;

