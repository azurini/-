function [fv,h,s] = flyagent(filename,color)

   %h = animatedline('color',color,'linestyle',':');%���°汾
   h = line('color',color,'linestyle',':','EraseMode','xor');%�˶������ε���ɫ�����Ρ���С�Ͳ�����ʽ 
   
   fv=stlread(filename);
   
   s=size(fv.vertices(:,1));
    
   
