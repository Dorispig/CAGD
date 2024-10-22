figure; 
t = 0:0.001:1;

%%
h = drawpolyline;
hold on;

hcurve_3 = plot(bezier_3(h.Position, t), 'g', 'linewidth', 2);
h.addlistener('MovingROI', @(h, evt) bezier_3(evt.CurrentPosition, t, hcurve_3));
legend('bezier\_3');





