%Frames para jerarquia taxonomica

frame(animalia,   subclase_de(objeto),     propiedades([puede(respirar),puede(sentir)])). %Clase superior
frame(pantherinae,subclase_de(animalia),   propiedades([tiene(garras),come(carne),puede(rugir)])).
frame(canis,subclase_de(animalia),         propiedades([habitad(terrestre),tienen(cola),tienen(cuatro_patas)])).
frame(ateles,subclase_de(animalia),        propiedades([come(vegetacion),cuerpo(alargado),puede(trepar)])).

%Frame para el ultimo nivel de jerarquia
frame_a(panthera_tigris,
        subclase_de(pantherinae),
        propiedades([tiene(rayas),vive_en(africa)]),
        nombre_vulgar(tigre), imagen('tigre.jpg')).

frame_a(panthera_leo,
        subclase_de(pantherinae),
        propiedades([tiene(melena),vive_en(africa)]),
        nombre_vulgar(leon), imagen('leon.jpg')).

frame_a(panthera_pardu,
	subclase_de(pantherinae),
	propiedad([tiene(rayas),vive_en(africa),caza(noche)]),
	nombre_vulgar(leopardo),imagen('leopardo.jpg')).

frame_a(panthera_uncia,
	subclase_de(pantherinae),
	propiedad([tiene(rayas),vive_en(asia),caza(nocheydia),color(blanco)]),
	nombre_vulgar(leopardo_de_las_nieves),imagen('leopardo_de_las_nieves.jpg')).

%Frame para ateles
frame_a(ateles_geoffroyi,
        subclase_de(ateles),
        propiedades([tiene(manos_negras),come(frutas),vive_en(americacentral)]),
        nombre_vulgar(mono_arana_de_Geoffroy),imagen('monoarana.jpg')).
        
frame_a(fusciceps,
        subclase_de(ateles),
        propiedades([tiene(cola_muy_larga),come(hojas),come(flores),vive_en(americacentral),color(negro_grisaceo)]),
        nombre_vulgar(mono_arana_de_cabeza_negra),imagen('monoaranaf.jpg')).
        
frame_a(fusciceps,
        subclase_de(ateles),
        propiedades([tiene(vientre_amarillo),come(frutos_maduros),vive_en(americadelsur),color(negro_grisaceo_y_amarillo)]),
        nombre_vulgar(mono_arana_de_vientre_amarillo),imagen('monoaranab.jpg')).

%%Frame para los canis
frame_a(canis_lupus,
	subclase_de(canis),
	propiedades([color(blancoygris),vive_en(norteamerica),come(carne)]),
	nombre_vulgar(lobo),imagen('lobo.jpg')).

frame_a(canis_latrans,
	subclase_de(canis),
	propiedades([color(grisycanela),vive_en(america_central),come(detodo)]),
	nombre_vulgar(coyote),imagen('coyote.jpg')).

frame_a(canis_mesomelas,
	subclase_de(canis),
	propiedades([color(cafeynegro),vive_en(africa),come(carne)]),
	nombre_vulgar(chacal),imagen('chacal.jpg')).



%
% Regla para investigar que animal tiene una lista de propieades
%

quien(P,X,V,I,L2):-frame_a(X,subclase_de(C),propiedades(L),nombre_vulgar(V),imagen(I)),
                propiedadesc(C,L1),concatenar(L,L1,L2),sublista(P,L2).

% Investiga propiedades de clases jerarquicas en la taxonomia

propiedadesc(objeto,[]):-!.   % objeto es el tope
propiedadesc(X,P):-frame(X,subclase_de(Y),propiedades(Z)),propiedadesc(Y,Z1),concatenar(Z,Z1,P).

% Reglas de apoyo


sublista([P],L):-pertenece(P,L).
sublista([_|P],L):-sublista(P,L).

pertenece(E,[E|_]).
pertenece(E,[_|T]):-pertenece(E,T).

concatenar([],L,L).
concatenar([X|L1],L2,[X|L3]):-concatenar(L1,L2,L3).





