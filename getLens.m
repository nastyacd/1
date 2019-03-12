function lens = getLens(A,B,C,A1,B1,C1,tickness)
  
  
 [xyz_0, x_0,y_0] = createShape([A B C],2,[0 0 0],[0 0 0]);
  
 [xyz_1, x_1,y_1] = createShape([A1 B1 B1],2,[0 0 tickness],[0 0 0]);

  
lens=struct('ABC_front',[A, B, C],'frontSurfM',[[1/A^2 0 0 0];[0 1/B^2 0 0];[0 0 1/C^2 0];[0 0 0 -1]],...
         'backSurfM',[[1/A1^2 0 0 0];[0 1/B1^2 0 0];[0 0 1/C1^2 0];[0 0 0 -1]],'position',[0,0,0],...
         'apetrture',2,'direction',[0,0,0],'refractionIndex',1.33,'tickness',tickness,...
         'frontSurfDrawData',struct('xy',xyz_0,'x',x_0,'y',y_0),'backSurfDrawData',struct('xy',xyz_1,'x',x_1,'y',y_1));

end

function [xyz, x_cross,y_cross] = createShape(ABC,aperture,position,orientation)
  t=linspace(0,1,100)*2*pi;
  x=aperture*sin(t)+position(1);
  y=aperture*cos(t)+position(2);
  z=sqrt(ABC(3)^2*(1-x.^2/ABC(1)^2-y.^2/ABC(2)^2));
  xyz=[x;y;(z) - max(z) + position(3)];
  
  x=linspace(min(x),max(x),length(t));
  y=linspace(min(y),max(y),length(t));
  
  z=sqrt(ABC(3)^2*(1-x.^2/ABC(1)^2)); z=z-max(z);
  x_cross=[x+position(1);t*0;z+position(3)];
  
  
  
  z=sqrt(ABC(3)^2*(1-y.^2/ABC(2)^2)); z=z-max(z);
  y_cross=[t*0;y+position(2);z+position(3)]; 
  
  d_1=max(z)-min(z);
  
    xyz(3,:)=xyz(3,:)-d_1;%[x;y;(z) - max(z) + position(3)];
end