Program Xoleckiy;
uses crt;
Type
  MA=Array [1..100,1..100] of Real;
  VB=Array [1..100] of Real;
var
A: MA;
B: VB;
n,z,p: byte;
s : string;
er : integer;

Procedure Vvod;
var
i,j: byte;
VvodEr : string:=('Введите число:');
begin
  write('Введите колличество уравнений: ');
   repeat
          readln(s);
           Val(s,n,er);
          if  er<>0 
          then Writeln(VvodEr)
          until er=0;            
  writeln('Введите матрицу: [',n,':',n,']');
    for i:=1 to n do
      for j:=1 to n do
        begin
           Write('[',J,':',I,']','=');
          repeat
          readln(s);
           Val(s,A[j,i],er);
          if  er<>0 
          then Writeln(VvodEr)
          until er=0;                 
        end;
  writeln('Введите вектор: x',n);
    for i:=1 to n do     
      begin
      Write('[',i,']','=');
      repeat
      readln(s);
           Val(s,B[i],er);
          if  er<>0 
          then Writeln(VvodEr)
          until er=0;            
      
end;
end;

Procedure Prov();
var
at, asim: MA;
i,j,k: byte;
begin
  for i:=1 to n-1 do
    begin
      for j:=i+1 to n do
        if a[i,j]<>a[j,i] then
          begin
            writeln('Матрица А - несимметричная.');
            break;
          end
        else
          begin
          writeln('Матрица А - симметричная.');
          exit
          end;
      break;
    end;
  for i:=1 to n do
    a[i,n+1]:=b[i];
  for i:=1 to n do
    for j:=1 to n+1 do
      at[j,i]:=a[i,j];
  for i:=1 to n+1 do
    for j:=1 to n+1 do
      asim[i,j]:=0;
  for i:=1 to n+1 do
    for j:=1 to n+1 do
      for k:=1 to n do
        asim[i,j]:=asim[i,j]+at[i,k]*a[k,j];
  for i:=1 to n do
    begin
      for j:=1 to n do
        a[i,j]:=asim[i,j];
      b[i]:=asim[i,n+1];
    end;
end;

Procedure Holet(var a: MA; var b: VB; var ex: byte);
var
L: MA;
y,x: VB;
k,l2,l3: byte;
l1: real;
begin
  for k:=1 to n do
    if a[k,k]=0 then
      begin
        writeln('Главная диагональ содержит ноль.');
        ex:=0;
        exit;
      end;
  for k:=1 to n do
    begin
      l1:=0;
        for l3:=1 to k-1 do
          l1:=l1+sqr(L[k,l3]);
      L[k,k]:=sqrt(a[k,k]-l1);
      l1:=0;
        for l3:=k+1 to n do
          begin
            for l2:=1 to k-1 do
              l1:=l1+L[l3,l2]*L[k,l2];
            L[l3,k]:=(a[l3,k]-l1)/L[k,k];
          end;
    end;
  for k:=1 to n do
    begin
      l1:=0;
        for l3:=1 to k-1 do
          l1:=l1+L[k,l3]*y[l3];
      y[k]:=(b[k]-l1)/L[k,k];
    end;
  for k:=n downto 1 do
    begin
      l1:=0;
        for l3:=n downto k do
          l1:=l1+L[l3,k]*x[l3];
      x[k]:=(y[k]-l1)/L[k,k];
    end;
  for k:=1 to n do
    b[k]:=x[k];
  ex:=2*n*n;
end;

begin
  Vvod;
  Prov;
  Holet(A,B,p);
    for z:=1 to n do
      writeln('x(',z,')=',B[z]);
  writeln('Кличество операций p=',p);
end.