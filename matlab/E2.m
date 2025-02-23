% Jordi Villà, adaptat de Montse Corbera
% 14/02/25

pwd
clear;
% definim el nom del fitxer on escriurem les preguntes en format 
% XML apte per a moodle cloze
fout=fopen('EX1.xml','w'); 

fprintf(fout,'<?xml version="1.0" encoding="UTF-8"?>\r\n');
fprintf(fout,'<quiz>\r\n');



npreg=30 % nombre de preguntes diferents a generar

r = randi([-10 10],1,npreg); % generador de valors enters aleatoris

for ipreg=1:npreg 
  
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % problema 1 Mahan 2-7
    syms a b
    P1=ceil(64+randsample(r,1))
    P2=ceil(95+randsample(r,1))
    eqP=(a+b)/(a+2*b)==P1/P2
    assume(a>0 & b>0)
    asol=solve(eqP,a)
    afrac=simplify(asol/(asol+b))
    afrac=vpa(afrac)
    % final problema 1
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % problema 2 equació de vander Waals
    % Constants de van der Waals per a diferents gasos
    nmols=randi(10)
    P=randi(10) %en kPa
    V=randi(10) % en m^3
    % a i b segons Mahan, amb P en atm i V en litres
    vanDerWaals = struct( ...
        'H2', struct('a', 0.2444, 'b', 0.02661), ...
        'He', struct('a', 0.03412, 'b', 0.02370), ...
        'N2', struct('a', 1.3900, 'b', 0.03913), ...
        'O2', struct('a', 1.3600, 'b', 0.03183), ...
        'CO', struct('a', 1.4850, 'b', 0.03985), ...
        'NO', struct('a', 1.3400, 'b', 0.02789), ...
        'CO2', struct('a', 3.5920, 'b', 0.04267), ...
        'H2O', struct('a', 5.4640, 'b', 0.03049) ...
    );

    % Obtenim els noms dels camps (gasos) de l'estructura
    gasos = fieldnames(vanDerWaals);

    % Triem un índex aleatori
    idxAleatori = randi(length(gasos));

    % Accedim al gas seleccionat aleatòriament
    gasAleatori = gasos{idxAleatori};
    valorsGas = vanDerWaals.(gasAleatori);

    % Mostrem el resultat
    disp(['Gas seleccionat: ', gasAleatori]);
    disp(['a = ', num2str(valorsGas.a), ' L^2·atm/mol^2']);
    disp(['b = ', num2str(valorsGas.b), ' L/mol']);

    valorsGas.a=valorsGas.a*101325/1e6
    valorsGas.b=valorsGas.b/1000  % per passar a m^3/mol

    % calculem la temperatura amb la fòrmula de van der Waals
    T=1/(nmols*8.314)*(P*1000+(nmols^2*valorsGas.a/V^2))*(V-nmols*valorsGas.b)
    % final problema 2
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % Escrivim l'exercici al fitxer XML 
    fprintf(fout, '<!-- question: %d  -->\r\n', ipreg);
    fprintf(fout, '<question type="cloze">\r\n');
    fprintf(fout, '  <name><text>E12024 %d</text></name>\r\n', ipreg);
    fprintf(fout, '  <questiontext format="html">\r\n');
    fprintf(fout, '    <text><![CDATA[\r\n');
    fprintf(fout, '<p><strong>Problema 1</strong></p>\r\n');
    fprintf(fout, 'Una barreja de metà (CH\\(_4\\)) i d''acetilè (C\\(_2\\)H\\(_2\\)) ocupava un cert volum a una pressió total de %d mmHg.<br>\r\n', P1);
    fprintf(fout, 'La mostra es va cremar a CO\\(_2\\) i H\\(_2\\)O. Se''n va recollir el CO\\(_2\\) en el mateix volum inicial i la mateixa temperatura inicial,<br>\r\n');
    fprintf(fout, ' i es va veure que la seva pressió era de %d mmHg.<br>\r\n', P2);
    fprintf(fout, 'La fracció inicial de metà era de {1:NUMERICAL:=%.3f:0.01}.<br>\r\n', afrac);
    fprintf(fout, ' (escriu el resultat amb 3 xifres decimals exactes)');
    fprintf(fout, '<p><strong>Problema 2</strong></p>\r\n');
    fprintf(fout, 'La temperatura de %d mols d''un gas no ideal (%s) sotmès a una pressió de %d kPa en un volum de %d m\\(^3\\)<br>\r\n', nmols, gasAleatori, P, V);
    fprintf(fout, 'és de {1:NUMERICAL:=%.3f:0.01} K.<br>\r\n', T);
    fprintf(fout, ' (usa els paràmetres de van der Waals de la taula dels apunts; escriu el resultat amb 3 xifres decimals exactes)');
    fprintf(fout, ']]></text>\r\n');
    fprintf(fout, '  </questiontext>\r\n');
    fprintf(fout, '  <generalfeedback>\r\n');
    fprintf(fout, '    <text>Cal usar l''equació de van der Waals i assegurar-se que les unitats són consistents.</text>\r\n');
    fprintf(fout, '  </generalfeedback>\r\n');
    fprintf(fout, '  <shuffleanswers>0</shuffleanswers>\r\n');
    fprintf(fout, '</question>\r\n');end
fclose(fout);