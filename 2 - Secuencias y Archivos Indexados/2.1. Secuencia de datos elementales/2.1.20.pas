
{
Se dispone de dos secuencias texto formadas por oraciones bimembres (sujeto y predicado, separados por comas ‘,’). Se desea una secuencia texto de salida formada por oraciones bimembres, de la siguiente forma:

El sujeto, de la secuencia 1, y el predicado, de la secuencia 2.

Al finalizar informar cuantas oraciones tiene cada secuencia.


entrada1 ==> Nuestro invitado, llegará tarde.FDS
entrada2 ==> La obra, aún no fue terminada.FDS

salida ==> Nuestro invitado, aún no fue terminada. La obra, llegará tarde.FDS

Acción 2120 ES;
Ambiente
	sec1: secuencia de caracter;
	v1: caracter;
	
	sec2: secuencia de caracter;
	v2: caracter;
	
	sally: secuencia de caracter;
	
	contor1: entero;
	contor2: entero;
	
Proceso
	arr(sec1);
	avz(sec1, v1);
	
	arr(sec2);
	avz(sec2, v2);
	
	crear(sally);
	
	contor1:= 0;
	contor2:= 0;
	
	//acá podría poner un ciclo para adelantar los espacios que haya antes 
	//de empezar la secuencia, pero no lo voy a hacer. xD
	
	Mientras NFDS(sec1) y NFDS(sec2) hacer
		
		mientras (v1 <> ',') hacer
			esc(sally, v1);
			avz(sec1, v1);
		fin_mientras
		
		mientras (v1 <> '.') hacer 
			avz(sec1, v1);
		fin_mientras
		contor1:= contor1 + 1;
		
		mientras (v2 <> ',') hacer
			avz(sec2, v2);
		fin_mientras
		
		mientras (v2 <> '.') hacer
			avz(sec2, v2);
			esc(sally, v2);
		fin_mientras
		contor2:= contor2 + 1;
		
		avz(sec1, v1);
		avz(sec2, v2);
		
	Fin_Mientras
	
	esc('La secuencia 1 tiene ', contor1, ' oraciones.');
	esc('La secuencia 2 tiene ', contor2, ' oraciones.');	
	
	cerrar(sec1);
	cerrar(sec2);
	cerrar(sally);
	
Fin_Acción.
}

Program something;
var
	sec1: text;
	v1: char;
	
	sec2: text;
	v2: char;
	
	sally: text;
	
	contor1: integer;
	contor2: integer;
	
Begin
	assign(sec1, 'entrada120.txt');
	reset(sec1);
	read(sec1, v1);
	
	assign(sec2, 'entrada220.txt');
	reset(sec2);
	read(sec2, v2);
	
	assign(sally, 'salida20.txt');
	rewrite(sally);
	
	contor1:= 0;
	contor2:= 0;
	
	//acá podría poner un ciclo para adelantar los espacios que haya antes 
	//de empezar la secuencia, pero no lo voy a hacer. xD
	
	while not eof(sec1) and not eof(sec2) do 
	begin
		
		while (v1 <> ',') do
		begin
			write(sally, v1);
			read(sec1, v1);
		end;
		
		while (v1 <> '.') do
		begin 
			read(sec1, v1);
		end;
		contor1:= contor1 + 1;
		
		while (v2 <> ',') do
		begin
			read(sec2, v2);
		end;
		
		while (v2 <> '.') do
		begin
			read(sec2, v2);
			write(sally, v2);
		end;
		contor2:= contor2 + 1;
		
		read(sec1, v1);
		read(sec2, v2);
		
	end;
	
	writeln('La secuencia 1 tiene ', contor1, ' oraciones.');
	writeln('La secuencia 2 tiene ', contor2, ' oraciones.');	
	
	close(sec1);
	close(sec2);
	close(sally);
	
End.




