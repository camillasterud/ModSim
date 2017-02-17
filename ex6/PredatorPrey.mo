within ;
package PredatorPrey
  model LotkaVolterra
    import math = Modelica.Math;

    Real V;

    Real u( start = 1);
    Real v( start = 4);

  equation
    der(u) = u*(v-3);
    der(v) = v*(2-u);

    V = u - 2*math.log(u) + v - 3*log(v);

  end LotkaVolterra;
  annotation (uses(Modelica(version="3.2.1")));
  model LinLotkaVolterra
    import math = Modelica.Math;

    Real u( start = 2);
    Real v( start = 3);

  equation
    der(u) = 2*(v-3);
    der(v) = 3*(u-2);

  end LinLotkaVolterra;
end PredatorPrey;
