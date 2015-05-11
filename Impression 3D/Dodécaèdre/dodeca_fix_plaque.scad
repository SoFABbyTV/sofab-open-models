$fn = 36;


_rayontube = 4;
_decaltube = 0;
_epaistube = 1.5;

_epaisplanche = 3.5;
_decalplanche = 0;
_longuplanche = 12;

_largeur = 6;



_epaisseur = (_rayontube+_epaistube)*2;
_longueur = _longuplanche + _decalplanche;

difference() {

// l'enveloppe globale

union() {

	cube([_longueur+_rayontube-_decaltube,_epaisseur,_largeur], center=false);

	translate ([0,_epaisseur/2,0]) {
		cylinder(h=_largeur, r=_epaisseur/2);
	}

}

// la partie à enlever

translate([-_decaltube,_epaisseur/2,-5]) {
	cylinder(h=_largeur+10, r=_rayontube);
}

translate([(_decalplanche-_decaltube+_rayontube),(_epaisseur-_epaisplanche)/2,-5]) {
	cube([_longueur, _epaisplanche, _largeur+10]);
}


}