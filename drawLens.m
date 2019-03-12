function drawLens(figHandler,lens)
axis_current = get(figHandler,'currentaxes');

view(axis_current,[0 0]);
%
%axis(axis_current,'vis3d');
%
%hold(axis_current ,'on');
hold on;

axis equal;

plot3( lens.frontSurfDrawData.xy(1,:),lens.frontSurfDrawData.xy(2,:),lens.frontSurfDrawData.xy(3,:) ,'r');

plot3(lens.frontSurfDrawData.x(1,:),lens.frontSurfDrawData.x(2,:),lens.frontSurfDrawData.x(3,:) ,'k' );

plot3(lens.frontSurfDrawData.y(1,:),lens.frontSurfDrawData.y(2,:),lens.frontSurfDrawData.y(3,:) ,'k' );
%front surf
%back surf

plot3(lens.backSurfDrawData.xy(1,:),lens.backSurfDrawData.xy(2,:),lens.backSurfDrawData.xy(3,:),'r' );

plot3(lens.backSurfDrawData.x(1,:),lens.backSurfDrawData.x(2,:),lens.backSurfDrawData.x(3,:),'k' );

plot3(lens.backSurfDrawData.y(1,:),lens.backSurfDrawData.y(2,:),lens.backSurfDrawData.y(3,:) ,'k' );


end