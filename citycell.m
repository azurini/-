function varargout = citycell(file,x,y,z,v)


%ÿ��cell��x��y�ߵĳ���Ϊ1024��z�ĸ߶Ȳ��ޡ�
%ÿ����������Ա��Ž�һ������cell�У�����x��y��ϴ�ıߵ���1024�ı����������߰������仯��
%v����ռcell�ĸ��������������ռ��v��ƽ���������ͬ���߶Ȳ��ޡ�

%������Ľ������ļ���ʽ����Ϊstl�ļ���

fv1=stlread(file);

x=x*1024;
y=y*1024;
s=size(fv1.vertices(:,1));
%%
%��һ��

int(1)=max(fv1.vertices(:,1));
int(2)=min(fv1.vertices(:,1));
int(3)=max(fv1.vertices(:,2));
int(4)=min(fv1.vertices(:,2));
int(5)=max(fv1.vertices(:,3));
int(6)=min(fv1.vertices(:,3));

if int(1)-int(2)>int(3)-int(4)
    ym=1024.*(int(3)-int(4))./(int(1)-int(2));
    zm=1024.*(int(5)-int(6))./(int(1)-int(2));
    fv1.vertices(1:s,1)=(fv1.vertices(1:s,1)-int(2)).*1024./(int(1)-int(2));
    fv1.vertices(1:s,2)=(fv1.vertices(1:s,2)-int(4)).*ym./(int(3)-int(4));
    fv1.vertices(1:s,3)=(fv1.vertices(1:s,3)-int(6)).*zm./(int(5)-int(6));
else
    xm=1024.*(int(1)-int(2))./(int(3)-int(4));
    zm=1024.*(int(5)-int(6))./(int(3)-int(4));
    fv1.vertices(1:s,1)=(fv1.vertices(1:s,1)-int(2)).*xm./(int(1)-int(2));
    fv1.vertices(1:s,2)=(fv1.vertices(1:s,2)-int(4)).*1024./(int(3)-int(4));
    fv1.vertices(1:s,3)=(fv1.vertices(1:s,3)-int(6)).*zm./(int(5)-int(6));
end

%%
%λ��
%x
fv1.vertices(1:s,1)=fv1.vertices(1:s,1).*v+x;

%y
fv1.vertices(1:s,2)=fv1.vertices(1:s,2).*v+y;

%z
fv1.vertices(1:s,3)=fv1.vertices(1:s,3).*v+z;


%%
%��ͼ

patch(fv1,'FaceColor',[0.8 0.8 1.0], 'EdgeColor','none','FaceLighting','gouraud','AmbientStrength', 0.15);

