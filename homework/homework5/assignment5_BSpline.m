figure; 
%t = 0:0.001:1;

%%
h = drawpolyline;
hold on;

h_BSpline_inter_ord4 = plot(BSpline_interpolation_ord4(h.Position), 'g', 'linewidth', 2);
%h_scatter = scatter(h.Position(:,1),h.Position(:,2),'red','filled');
h_scatter = scatter(0,0,10,'red','filled');
h_De_Boor_line = plot(BSpline_interpolation_ord4(h.Position), 'b', 'linewidth', 1);
h.addlistener('MovingROI', @(h, evt) BSpline_interpolation_ord4(evt.CurrentPosition,  h_BSpline_inter_ord4,h_scatter,h_De_Boor_line));
legend('BSpline\_inter\_ord4');





