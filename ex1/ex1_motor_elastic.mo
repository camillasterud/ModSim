within ;
model ex1_motor_elastic "Model of a motor with elastic loads connected"
  Modelica.Mechanics.Rotational.Sources.Torque torque
    annotation (Placement(transformation(extent={{-70,30},{-50,50}})));
  Modelica.Mechanics.Rotational.Components.Inertia MotorInteria(J=1)
    annotation (Placement(transformation(extent={{-38,30},{-18,50}})));
  Modelica.Mechanics.Rotational.Components.SpringDamper springDamper2(c=0.5, d=
        0.01) annotation (Placement(transformation(extent={{44,30},{64,50}})));
  Modelica.Mechanics.Rotational.Components.SpringDamper springDamper1(c=0.5, d=
        0.01) annotation (Placement(transformation(extent={{-10,30},{10,50}})));
  Modelica.Mechanics.Rotational.Components.Inertia LoadInteria1(J=1)
    annotation (Placement(transformation(extent={{18,30},{38,50}})));
  Modelica.Mechanics.Rotational.Components.Inertia LoadInteria2(J=1)
    annotation (Placement(transformation(extent={{70,30},{90,50}})));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor
    annotation (Placement(transformation(extent={{64,-20},{84,0}})));
  Modelica.Blocks.Interfaces.RealInput u
    annotation (Placement(transformation(extent={{-116,20},{-76,60}})));
  Modelica.Blocks.Interfaces.RealOutput y
    annotation (Placement(transformation(extent={{92,-20},{112,0}})));
equation
  connect(torque.flange, MotorInteria.flange_a) annotation (Line(
      points={{-50,40},{-38,40}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(LoadInteria1.flange_a, springDamper1.flange_b) annotation (Line(
      points={{18,40},{10,40}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(MotorInteria.flange_b, springDamper1.flange_a) annotation (Line(
      points={{-18,40},{-10,40}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(LoadInteria1.flange_b, springDamper2.flange_a) annotation (Line(
      points={{38,40},{44,40}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(springDamper2.flange_b, LoadInteria2.flange_a) annotation (Line(
      points={{64,40},{70,40}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(speedSensor.flange, LoadInteria2.flange_b) annotation (Line(
      points={{64,-10},{60,-10},{60,22},{96,22},{96,40},{90,40}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(torque.tau, u) annotation (Line(
      points={{-72,40},{-96,40}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(speedSensor.w, y) annotation (Line(
      points={{85,-10},{102,-10}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(y, y) annotation (Line(
      points={{102,-10},{102,-10}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (uses(Modelica(version="3.2.1")), Diagram(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics));
end ex1_motor_elastic;
