within ;
package CoupledDrives
  model CoupledDrives
    Drive drive
      annotation (Placement(transformation(extent={{-44,18},{-24,38}})));
    Drive drive1
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},
          rotation=180,
          origin={92,34})));
    Modelica.Mechanics.Translational.Components.SpringDamper springDamper(c=50,
        d=0.5) annotation (Placement(transformation(extent={{-18,20},{2,40}})));
    Pulley pulley
      annotation (Placement(transformation(extent={{14,20},{34,40}})));
    Modelica.Mechanics.Translational.Components.SpringDamper springDamper1(
                                                                          c=50,
        d=0.5) annotation (Placement(transformation(extent={{46,20},{66,40}})));
    Modelica.Blocks.Interfaces.RealInput u annotation (Placement(transformation(
          extent={{-20,-20},{20,20}},
          rotation=180,
          origin={128,30})));
    Modelica.Blocks.Interfaces.RealInput u1
      annotation (Placement(transformation(extent={{-124,8},{-84,48}})));
    Modelica.Blocks.Math.Gain gain(k=-1)
      annotation (Placement(transformation(extent={{-70,20},{-50,40}})));
    Modelica.Blocks.Interfaces.RealOutput y
      annotation (Placement(transformation(extent={{22,-2},{42,18}})));
  equation
    connect(springDamper1.flange_b, drive1.flange_b) annotation (Line(
        points={{66,30},{77.6,30},{77.6,30.6},{85.2,30.6}},
        color={0,127,0},
        smooth=Smooth.None));
    connect(drive1.u, u) annotation (Line(
        points={{101,30.6},{107,30.6},{107,30},{128,30}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(springDamper.flange_a, drive.flange_b) annotation (Line(
        points={{-18,30},{-28,30},{-28,31.4},{-27.2,31.4}},
        color={0,127,0},
        smooth=Smooth.None));
    connect(drive.u, gain.y) annotation (Line(
        points={{-43,31.4},{-43,28.7},{-49,28.7},{-49,30}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(gain.u, u1) annotation (Line(
        points={{-72,30},{-90,30},{-90,28},{-104,28}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(springDamper.flange_b, pulley.flange_a) annotation (Line(
        points={{2,30},{14,30}},
        color={0,127,0},
        smooth=Smooth.None));
    connect(springDamper1.flange_a, pulley.flange_b) annotation (Line(
        points={{46,30},{34,30}},
        color={0,127,0},
        smooth=Smooth.None));
    connect(pulley.y, y) annotation (Line(
        points={{25.6,30.2},{25.6,19.1},{32,19.1},{32,8}},
        color={0,0,127},
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}),      graphics));
  end CoupledDrives;

  model Drive

    Modelica.Mechanics.Rotational.Components.Inertia interia( J = 1*10^(-3))
      annotation (Placement(transformation(extent={{-30,24},{-10,44}})));
    Modelica.Mechanics.Rotational.Sources.Torque torque
      annotation (Placement(transformation(extent={{-58,24},{-38,44}})));
    Modelica.Mechanics.Rotational.Components.IdealGearR2T idealGearR2T( ratio = 10)
      annotation (Placement(transformation(extent={{26,24},{46,44}})));
    Modelica.Mechanics.Rotational.Components.Damper damper( d = 0.1)
      annotation (Placement(transformation(extent={{-4,24},{16,44}})));
    Modelica.Blocks.Interfaces.RealInput u
      annotation (Placement(transformation(extent={{-110,14},{-70,54}})));
    Modelica.Mechanics.Translational.Interfaces.Flange_b flange_b
      annotation (Placement(transformation(extent={{58,24},{78,44}})));
  equation
    connect(torque.flange, interia.flange_a) annotation (Line(
        points={{-38,34},{-30,34}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(damper.flange_b, idealGearR2T.flangeR) annotation (Line(
        points={{16,34},{26,34}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(interia.flange_b, damper.flange_a) annotation (Line(
        points={{-10,34},{-4,34}},
        color={0,0,0},
        smooth=Smooth.None));
    connect(torque.tau, u) annotation (Line(
        points={{-60,34},{-90,34}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(idealGearR2T.flangeT, flange_b) annotation (Line(
        points={{46,34},{68,34}},
        color={0,127,0},
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics), Icon(coordinateSystem(
            preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
            Ellipse(
            extent={{-10,54},{38,6}},
            lineColor={0,0,255},
            fillPattern=FillPattern.Solid,
            fillColor={0,0,255}), Rectangle(
            extent={{-2,40},{-48,20}},
            lineColor={0,0,255},
            fillPattern=FillPattern.Solid,
            fillColor={0,0,255})}));
  end Drive;

  model Pulley

    extends Modelica.Mechanics.Translational.Interfaces.PartialTwoFlanges;

    import SI = Modelica.SIunits;
    import math = Modelica.Math;

    SI.Velocity v1 "Velocity section belt 1";
    SI.Velocity v2 "Velocity section belt 2";
    SI.Velocity vk "Vertical velocity pulley";
    SI.Position xk "Spring deflection/vertical position pulley";
    SI.Force Fk "Spring force";

    parameter Real k = 200 "Spring constant";
    parameter Real theta = 45 "Angle";

    Modelica.Blocks.Interfaces.RealOutput y
      annotation (Placement(transformation(extent={{6,-8},{26,12}})));
  equation
    der(xk) = vk;
    vk =  (v1 - v2)/(2*math.cos(theta));
    v1 = der(-flange_a.s);
    v2 = der(flange_b.s);

    Fk = k*xk;
    flange_a.f = Fk/(2*math.cos(theta));
    flange_b.f = flange_a.f;

    y = xk;

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
              {100,100}}), graphics={Line(
            points={{-90,0},{94,0},{0,80},{-90,0}},
            color={0,0,255},
            smooth=Smooth.None)}));
  end Pulley;
  annotation (uses(Modelica(version="3.2.1")));
end CoupledDrives;
