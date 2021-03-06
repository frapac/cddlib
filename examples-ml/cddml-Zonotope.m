(*******************************************************************
This file was generated automatically by the Mathematica front end.
It contains Initialization cells from a Notebook file, which
typically will have the same name as this file except ending in
".nb" instead of ".m".

This file is intended to be loaded into the Mathematica kernel using
the package loading commands Get or Needs.  Doing so is equivalent
to using the Evaluate Initialization Cells menu command in the front
end.

DO NOT EDIT THIS FILE.  This entire file is regenerated
automatically each time the parent Notebook file is saved in the
Mathematica front end.  Any changes you make to this file will be
overwritten.
***********************************************************************)

Off[General::spell1];Off[General::spell]


(* Russell Towle's codes to create projections (zonotopes) of
hypercubes.  *)

cross[ {ax_, ay_, az_}, {bx_, by_, bz_} ] := (*cross product*)
   {ay bz - az by, az bx - ax bz, ax by - ay bx}

mag[v_]:= Sqrt[Plus@@(v^2)] (*magnitude of a vector*)

unit[v_]:= v/Sqrt[v.v] (*make unit vector*)

tolerance=0.000001;
collinear[ v1_, v2_ ] := (*test for collinearity*)
   Apply[And, Map[Abs[#]<tolerance&, cross[v1,v2]]]

setStar[vlist_] := (*discard collinear vectors*)
   Module[{selected={}},
    Scan[Function[v, If[v!={0,0,0} &&
                        Select[selected,
                               collinear[v,#]&]=={},
                        AppendTo[selected,v]] ],
         vlist];

    Print[Length[selected]," zonal directions."];
    gStar=selected] (*gStar is global, list of non-collinear vectors*)



(* Here I set to a directory where I store
the packages I need *)

SetDirectory["~/Math"]

cddml=Install["~/Math/cddmathlink"]

Needs["ExtendGraphics`View3D`"];

<<UnfoldPolytope.m

<<Combinatorica5.m

<<PolytopeSkeleton.m

<<IOPolyhedra.m

(*the vectors which determine an n-merous polar zonohedron*)
(*3<=n, 0<=pitch<=90 degrees*)

vectors[n_Integer,pitch_]:=
Table[N[{Cos[Degree pitch] Cos[2Pi i/n],
	Cos[Degree pitch] Sin[2Pi i/n],
	-Sin[Degree pitch]},15],
	{i,n}]      (* modified by KF, precision 15 added *)

(*the pitch at which a polar zonohedron is
an isometric shadow of an n-cube*)

N[1/Degree * ArcTan[(1/2)^(1/2)],15];


(*Here, we obtain the vectors for an isometric projection of
a d-cube into cyclic symmetry*)

dim=8;
gen=Zonotope[vectors[dim, N[ 1/Degree * ArcTan[(1/2)^(1/2)],15 ] ] ];
genc = Chop[gen,10^(-12)];

extlist=Map[Prepend[#,1]&,genc];
{n,d}=Dimensions[extlist]