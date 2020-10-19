unit splain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    first_dev_t: TEdit;
    sec_dev_t: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    result_bat: TButton;
    Text_a: TEdit;
    text_b: TEdit;
    point_edit: TEdit;
    Label6: TLabel;
    Count_point: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    procedure result_batClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.result_batClick(Sender: TObject);
var
  a,b,x:real;
  n:integer;
  y_1,y_2:real;
  h,a_new,h2:real;
  i:integer;
  y:array[0..1000] of real;
begin
  a:=StrToFloat(Text_a.Text); {Ввод  данных}
  b:=StrToFloat(text_b.Text);
  if StrToInt(Count_point.Text)<=1000
   then
  n:=StrToInt(Count_point.Text);
  x:=(a+b)/2;
  h:=(b-a)/n;
  a_new:=a;
  for i:=0 to n-2 do {Дифференцирование}
  begin
    y[i]:=a_new/sqrt(1+a_new*a_new);
    a_new:=a_new+h;
  end;
  i:=trunc((x-a)/h+h/2);
  a_new:=2*h;
  h2:=h*h;
  if i=0 then
  begin
    y_1:=(-3*y[0]+4*y[1]-y[2])/a_new;
    y_2:=(2*y[0]-5*y[1]+4*y[2]-y[3])/h2;
  end;
  if ((i>0)and(i<n)) then
  begin
    y_1:=(-y[i-1]+y[i+1])/a_new;
    y_2:=(y[i-1]-2*y[i]+y[i+1])/h2;
  end;
  if i=n then
  begin
    y_1:=(y[n-2]-4*y[n-1]+3*y[n])/a_new;
    y_2:=(-y[n-3]+4*y[n-2]-5*y[n-1]+2*y[n])/h2;
  end;
  point_edit.Enabled:=True; {Вывод}
  first_dev_t.Enabled:=True;
  sec_dev_t.Enabled:=True;
  point_edit.Text:=FloatToStrF(x,ffFixed,7,4);
  first_dev_t.Text:=FloatToStrF(y_1,ffFixed,7,4);
  sec_dev_t.Text:=FloatToStrF(y_2,ffFixed,7,4);
end;

end.
