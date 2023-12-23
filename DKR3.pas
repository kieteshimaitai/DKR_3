uses Crt;

function funkciya(x:real):real;
begin
  funkciya:= 2*(x**3) + 3*x + 18;
end;

function integral_ot_funkcii(x:real):real;
begin
  integral_ot_funkcii:= 0.5*(x**4) + 1.5*(x**2) + 18*x;
end;

function Tochnaya_ploschadb(a, b:real):real;
begin
  Tochnaya_ploschadb:=integral_ot_funkcii(b) - integral_ot_funkcii(a);
end;

procedure Vyvod_tochnoy_ploschadi(var a, b, p:real); 
begin
  p:=Tochnaya_ploschadb(a, b);
  writeln('Точная площадь = ',p); 
  readkey;
end;

procedure Formulirovka();
begin
  writeln('Реализовать программу вычисления площади фигуры,ограниченной кривой'); 
  readkey;
end;

procedure Vvod_dannyh(var a,b:real;n:integer); 
begin
  a:=ReadReal('Введите нижнюю границу');
  b:=ReadReal('Введите верхнюю границу');
  n:=ReadInteger('Введите количество разбиений');
  readkey;
end;

function Simps(a, b:real; n: integer): real;
var 
  h, x, sum: real;
  i: integer;
begin
  h := (b - a) / n;
  sum := funkciya(a) + funkciya(b);
  
  for i := 1 to n-1 do
  begin
    x := a + i*h;
    if i mod 2 = 0 then
      sum := sum + 2*funkciya(x)
    else
      sum := sum + 4*funkciya(x);
  end;
  
  Simps := round(h/3 * sum, 2);
  print(Simps);
end;

procedure Vyvod_Priblizhennogo_znacheniya(a,b:real; n:integer; var S:real); 
begin
  S:=Simps(a,b,n);
  writeln('Приближенная площадь = ',S); 
  readkey;
end;

procedure Pogreshnostb(s,p:real);
begin
  var Pogr:=abs(s-p);
  writeln('Погрешность = ',Pogr); 
  readkey;
end;

begin
    
  var a:=0.0;
  var b:=0.0;
  var n:=0;
  var m:=0;
  var S:=0.0;
  var p:=0.0;
repeat

    ClrScr;
    writeln('Формулировка - 1'); 
    writeln('Ввод значений - 2'); 
    writeln('Вывод приблизительного значения - 3'); 
    writeln('Вывод точного значения - 4'); 
    writeln('Вывод погрешности - 5'); 
 
    m:=ReadInteger('select program:');
    case m of
      1: Formulirovka;
      2: Vvod_dannyh(a,b,n);
      3: Vyvod_Priblizhennogo_znacheniya(a,b,n,s);
      4: Vyvod_tochnoy_ploschadi(a,b,p);
      5: Pogreshnostb(S,p); 
    end;
  until m = 0;
end.