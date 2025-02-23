% Jordi Villà, adaptat de Montse Corbera
% 14/02/25

cd '~/GitHub/Classes/QuimicaAutomocio/matlab'
pwd
clear;
% definim el nom del fitxer on escriurem les preguntes en format 
% XML apte per a moodle cloze
fout=fopen('E2.xml','w'); 

fprintf(fout,'<?xml version="1.0" encoding="UTF-8"?>\r\n');
fprintf(fout,'<quiz>\r\n');



    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % 

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Exemple 6 pàgina 20 Caamaño
    dcombC = 393.5
    dcombH2 = 285.8
    dcombCH4 = 890.8
    dHform = -dcombC -2*dcombH2 +dcombCH4
    % final problema 1
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Exemple 8 pàgina 27 Caamaño però agafant les dades la taula 
    % "STRENGTHS OF CHEMICAL BONDS" del CRC handbook chemistry and physics
    dbondCH = 338.4
    dbondClCl = 242.580
    dbondCCl = 397
    dbondHCl = 431.62
    dH = (4*dbondCH+dbondClCl)-(3*dbondCH+dbondCCl+dbondHCl)
    % final problema 1
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    
    % Escrivim l'exercici al fitxer XML 
    fprintf(fout, '<!-- question: 1  -->\r\n');
    fprintf(fout, '<question type="cloze">\r\n');
    fprintf(fout, '  <name><text>E22024 1</text></name>\r\n');
    fprintf(fout, '  <questiontext format="html">\r\n');
    fprintf(fout, '    <text><![CDATA[\r\n');
    fprintf(fout, '<p><strong>Problema 1</strong></p>\r\n');
    fprintf(fout, 'El valor normal de formació del metà, a partir dels valors de les calors estàndar de combustió del C(grafit), l''H\\(_2\\) i el CH\\(_4\\) que tenim al formulari del curs, és {1:NUMERICAL:=%.1f:0.1} K.<br>\r\n',dHform);
    fprintf(fout, ' (escriu el resultat amb 1 xifra decimal exacta)');
    fprintf(fout, '<p><strong>Problema 2</strong></p>\r\n');
    fprintf(fout, 'Usant les energies d''enllaç de la Taula 1 dins STRENGTHS OF CHEMICAL BONDS del CRC handbook chemistry and physics, que podràs trobar a http://webdelprofesor.ula.ve/ciencias/isolda/libros/handbook.pdf, podem trobar que l''entalpia normal de la reacció\n  CH\\(_4\\)(g)+Cl\\(_2\\)(g) <mo>&rightarrow;</mo> CH\\(_3\\)Cl(g)+HCl(g) \n és {1:NUMERICAL:=%.1f:0.1} K.<br>\r\n',dH);
    fprintf(fout, ' (escriu el resultat amb 1 xifra decimal exacta)');
    fprintf(fout, ']]></text>\r\n');
    fprintf(fout, '  </questiontext>\r\n');
    fprintf(fout, '  <generalfeedback>\r\n');
    fprintf(fout, '    <text>Cal usar la Llei de Hess en els dos casos, després d''assegurar que tenim les reaccions igualades estequiomètricament.</text>\r\n');
    fprintf(fout, '  </generalfeedback>\r\n');
    fprintf(fout, '  <shuffleanswers>0</shuffleanswers>\r\n');
    fprintf(fout, '</question>\r\n')
fclose(fout);