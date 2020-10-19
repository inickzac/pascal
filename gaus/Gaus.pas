Program Gaus;
uses crt;
Type
Mas = Array [1..50,1..50] of real;
Vec = Array [1..50] of real;
var
er : integer;

n,K: byte;
A: Mas;
B: Vec;
s : string;
VvodEr : string:=('Введите число:');
Procedure Vvod;
var
i,j: byte;
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
           Write('[',i,':',j,']','=');
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

Procedure SIMQ(Nn:byte; var Aa:Mas; var Bb:Vec; var Ks: byte);
Label M1;
const
Eps = 1e-21;
var
i,j,K1,l: byte;
Max,U,V: real;
begin
  for i:=1 to Nn do
    Aa[i,Nn+1]:=Bb[i];
  for i:=1 to Nn do
    begin
      Max:=abs(Aa[i,i]);
      K1:=i;
        for l:=i+1 to Nn do
          if (abs(A[l,i])>Max) then
            begin
              Max:=abs(Aa[l,i]);
              K1:=l;
            end;
          if (Max<Eps) then
            begin
              Ks:=1;
              writeln('Система не имеет единственного решения.');
              Goto M1;
            end
          else
            Ks:=0;
          if K1 <> i then
        for j:=1 to Nn+1 do
          begin
            U:=Aa[i,j];
            Aa[i,j]:=Aa[K1,j];
            Aa[K1,j]:=U;
          end;
    V:=Aa[i,i];
    for j:=i to Nn+1 do
      Aa[i,j]:=Aa[i,j]/V;
    for l:=i+1 to Nn do
      begin
        V:=Aa[l,i];
          for j:=i+1 to Nn+1 do
            A[l,j]:=Aa[l,j]-Aa[i,j]*V;
      end;
    end;
  Bb[Nn]:=Aa[Nn,Nn+1];
  for i:=Nn-1 downto 1 do
    begin
      Bb[i]:=Aa[i,Nn+1];
        for j:=i+1 to Nn do
          Bb[i]:=Bb[i]-Aa[i,j]*Bb[j];
    end;
    for i:=1 to Nn do
      writeln('x(',i,')=', Bb[i]);
      writeln('Признак правильности решения K=',Ks);
  M1: end;

begin
  K:=0;
  Vvod;
  SIMQ(n, A, B, K);
end.