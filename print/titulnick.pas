program titulnick;

var LST:File of Byte;
i:integer;

procedure WriteString(S:String);
var I:Word;
    B:Byte;
    C:Char;
begin
  for i:=1 to Length(S) do
    begin
      B := Ord(S[i]);
      Write(LST,B);
    end;
end;

procedure WriteByte(B:Byte);
begin
  Write(LST,B);
end;

procedure WriteChar(C:Char);
var B:Byte;
begin
  B := Ord(C);
  Write(LST,B);
end;

begin
  Assign(LST,'D:\output.bin');
  Rewrite(LST);
  WriteChar(#27); WriteChar('@'); {инициирование печатающего устройства}
  WriteChar(#27); WriteChar('W'); WriteChar(#1); {двойна€ ширина - вкл}
  WriteChar(#27); WriteChar(#108); WriteChar(#10); {”становка левого пол€}
  WriteString('MINISTERSTVO OBRAZOVANYA RESPUBLIKI BELARUS');
  WriteChar(#27); WriteChar('W'); WriteChar(#0); {двойна€ ширина - выкл}
  WriteChar(#13); WriteChar(#10); {перевод строки возврат корретки}
  WriteChar(#13); WriteChar(#10); {перевод строки возврат корретки}

  WriteChar(#27); WriteChar(#108); WriteChar(#35); {”становка левого пол€}
  {Ѕ√”»– - двойна€ высота}
  WriteChar(#27); WriteChar('X'); WriteChar(#1); {режим качественный - вкл}
  WriteString('BGUIR');
  WriteChar(#27); WriteChar('X'); WriteChar(#0); {режим качественный - выкл}

  {ќтступ h2 = 1,5 cm}
  WriteChar(#27); WriteChar(#51); WriteChar(#127);

  {определение знака пользовател€}
  WriteChar(#27); WriteChar(#38); WriteChar(#1); WriteChar('A');WriteChar('A');
  {ќпределение контура знака}
  WriteChar(#24);  WriteChar(#24); WriteChar(#24);
  WriteChar(#24); WriteChar(#24);  WriteChar(#24);
  WriteChar(#153);  WriteChar(#219); WriteChar(#126);
  WriteChar(#60); WriteChar(#24); WriteChar(#0);
  WriteChar(#13); WriteChar(#10);
  WriteChar(#13); WriteChar(#10);
  WriteChar(#13); WriteChar(#10);
  {печать пользовательского знака}
  for i:=1 to 85 do begin
                      WriteChar(#27); WriteChar(#37); WriteChar(#1); WriteChar('A');
                    end;
  WriteChar(#13); WriteChar(#10);
  WriteChar(#13); WriteChar(#10);
  WriteChar(#13); WriteChar(#10);
  WriteChar(#13); WriteChar(#10);
  WriteChar(#27); WriteChar('X'); WriteChar(#1); {режим качественный - вкл}
  WriteChar(#27); WriteChar(#108); WriteChar(#35); {ќтступ слева}
  WriteString('OTCHET');
 WriteChar(#27); WriteChar('X'); WriteChar(#0); {режим качественный - выкл}
 
 {ќтступ h3 = 2 cm}
  WriteChar(#27); WriteChar(#51); WriteChar(#56); {2/2.54*72}

  WriteChar(#13); WriteChar(#10);
  WriteChar(#27); WriteChar('p'); WriteChar(#1);{режим пропорциональный вкл}
  WriteChar(#27); WriteChar(#108); WriteChar(#24); {ќтступ слева}
  WriteString('PO LABORATORNOI RABOTE є1');
  WriteChar(#27); WriteChar('p'); WriteChar(#0);{режим пропорциональный выкл}

  WriteChar(#13); WriteChar(#10);
  WriteChar(#27); WriteChar(#108); WriteChar(#28); {ќтступ слева}
  WriteChar(#27); WriteChar('P'); {шрифт пайк}
  WriteString('kyrs - AOKT');
  WriteChar(#13); WriteChar(#10);
  
  WriteChar(#27); WriteChar(#51); WriteChar(#28); {h4 = 1 cm}
  WriteChar(#27); WriteChar('P'); {шрифт пайк}
  WriteString('Student');

  WriteChar(#27); WriteChar(#36); WriteChar(#113); WriteChar(#0); {h5 = 4 cm}
  WriteChar(#27); WriteChar('E'); {режим акцентированный вкл}
  WriteString('Proveril');
  WriteChar(#27); WriteChar('F'); {режим акцентированный выкл}

  WriteChar(#27); WriteChar(#51); WriteChar(#127);
  WriteChar(#13); WriteChar(#10);
  WriteChar(#27); WriteChar(#119); WriteChar(#1); {двойна€ высота Ц вкл}
  WriteChar(#27); WriteChar(#45); WriteChar(#1); {подчеркивание вкл}
  WriteString('Zasimuk N.S');
  WriteChar(#27); WriteChar(#119); WriteChar(#0); {двойна€ высота - выкл}
  WriteChar(#27); WriteChar(#45); WriteChar(#1); {подчеркивание выкл}
  WriteChar(#27); WriteChar(#36); WriteChar(#113); WriteChar(#0); {h5 = 4 cm}
  WriteChar(#27); WriteChar('X'); WriteChar(#1); {режим качественный - вкл}
  WriteString('Levantsevich V.A.');
  WriteChar(#27); WriteChar('X'); WriteChar(#0); {режим качественный - выкл}
  WriteChar(#13); WriteChar(#10);
  
  WriteChar(#27); WriteChar('K'); WriteChar(#60); WriteChar(#0);
  for i:=1 to 5 do begin
                     WriteChar(#129); WriteChar(#129); WriteChar(#195);
                     WriteChar(#102); WriteChar(#52); WriteChar(#24);
                     WriteChar(#52); WriteChar(#102); WriteChar(#195);
                     WriteChar(#129); WriteChar(#129); WriteChar(#0);
                   end;

  WriteChar(#27); WriteChar(#51); WriteChar(#85); {h6 = 3 cm}
  WriteChar(#13); WriteChar(#10);
  WriteChar(#27); WriteChar('W'); WriteChar(#1); {двойна€ ширина Ц вкл}
  WriteChar(#27); WriteChar(#108); WriteChar(#39);
  WriteString('MINSK');
  WriteChar(#27); WriteChar('W'); WriteChar(#0); {двойна€ ширина - выкл}

  WriteChar(#27); WriteChar(#51); WriteChar(#36);
  WriteChar(#13); WriteChar(#10);
  WriteChar(#27); WriteChar(#119); WriteChar(#1); {двойна€ высота Ц вкл}
  WriteChar(#27); WriteChar(#108); WriteChar(#35);
  WriteString('2015');

  Close(LST);
readln;

end.
