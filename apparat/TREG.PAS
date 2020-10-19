program REG;

uses Crt;

var
  reg_10, reg_d, reg_c, reg_11: integer;
  tmp: integer;
  Ch: char;

BEGIN
 clrscr;
 port[$3d4]:=$11;
 reg_11:=port[$3d4]*$7f;
 port[$3d4]:=$10;
 reg_10:=port[$3d5];
 tmp:=reg_10;
 writeln;
 writeln('Регистр 10h');
 writeln;
 writeln(' Исходное значение в регистре 10h: ',reg_10);
 writeln;
 writeln(' Нажмите влево и  вправо для изменения значения выход- Enter');
 GotoXY(0,8);
 write(' Значение : ',tmp,'   ');
 Repeat
  Ch:=readkey;
  case Ch of
   #0:
    begin
     Ch:=ReadKey;
     case Ch of
      #77: tmp:=tmp+1;
      #75: tmp:=tmp-1;
     end;
    end;
  end;
  GotoXY(0,8);
  write(' Значение : ',tmp,'   ');
  port[$3d4]:=$4;
  port[$3d5]:=tmp;
 until Ch=#13;
 port[$3d4]:=$10;
 port[$3d5]:=reg_10;

 clrscr;
 port[$3d4]:=$11;
 reg_11:=port[$3d4]*$7f;

 port[$3d4]:=$d;
 reg_d:=port[$3d5];
 tmp:=reg_d;
 writeln;
 writeln('регистр Dh');
 writeln;
 writeln(' Исходное значение в регистре Dh: ',reg_d);
 writeln;
 writeln(' Нажмите влево и  вправо для изменения значения выход- Enter');
 GotoXY(0,8);
 write(' Значение в регистре: ',tmp,'   ');
 Repeat
  Ch:=readkey;
  case Ch of
   #0:
    begin
     Ch:=ReadKey;
     case Ch of
      #77: tmp:=tmp+1;
      #75: tmp:=tmp-1;
     end;
    end;
  end;
  GotoXY(0,8);
  write(' Значение : ',tmp,'   ');
  port[$3d4]:=$d;
  port[$3d5]:=tmp;
 until Ch=#13;
 port[$3d4]:=$d;
 port[$3d5]:=reg_d;
 clrscr;
 port[$3d4]:=$c;
 reg_d:=port[$3d5];
 tmp:=reg_c;
 writeln;
 writeln('регистр Ch');
 writeln;
 writeln(' Исходное значение в регистре Ch: ',reg_C);
 writeln;
 writeln(' Нажмите влево и  вправо для изменения значения выход- Enter');
 GotoXY(0,8);
 write(' Значение : ',tmp,'   ');
 Repeat
  Ch:=readkey;
  case Ch of
   #0:
    begin
     Ch:=ReadKey;
     case Ch of
      #77: tmp:=tmp+1;
      #75: tmp:=tmp-1;
     end;
    end;
  end;
  GotoXY(0,8);
  write(' Значение : ',tmp,'   ');
  port[$3d4]:=$c;
  port[$3d5]:=tmp;
 until Ch=#13;
 port[$3d4]:=$c;
 port[$3d5]:=reg_c;
END.
