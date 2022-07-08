

program lab;
uses crt, math;
var
	sec: text; 
	v: char; 
	
	sally: text;
	
	//Variable que contiene el mes ingresado por el usuario
	mes_usuario: string;
	
	//Variable que contiene el mes ingresado por el usuario
	dni_usuario: string;
	
	//Variable que controla los cíclos de los mensajes de error en el ingreso de datos
	error_count: integer;
	
	acuml_mes: string;
	acuml_convert: integer;
	acuml_km_viajes: integer;
	acuml_dni: string;
	
	cont_pas_xdni: integer;
	cont_pastot: integer;
	
	mes_convert: string;
	
	i: integer;
	option: char;

	procedure present;
	begin
			{
			Arte en ASCII generado en el sitio web " https://es.rakko.tools/tools/68/ ", utilizando la imagen que se encuentra a continuación...
			https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.tztemuRaDOj-_ZH1Ho8ZCAHaHa%26pid%3DApi&f=1
			}
			clrscr;
			delay(30); textcolor(magenta); 		writeln('	   -----:     :-----     :----- 	');          
			delay(30); textcolor(blue); 		writeln('	   #####+     *####*     +#####         ');  
			delay(30); textcolor(white); 		writeln('	   +#####.    *####*    .#####*         ');  
			delay(30); textcolor(lightblue);	writeln('	   :#####*    *####*    +#####-         ');  
			delay(30); textcolor(green);		writeln('	    +#####*.  *####*  .*#####*          ');  
			delay(30); textcolor(cyan);		writeln('	    .*######+:*####*:+######*.          ');  
			delay(30); textcolor(red);		writeln('	     .*####################*.           ');  
			delay(30); textcolor(lightcyan);	writeln('	       -##################=             ');  
			delay(30); textcolor(lightgray); 	writeln('		       .=*############*=.              ');  
			delay(30); textcolor(lightgreen);	writeln('	   ::::::::-+*######*+-::::::::         ');  
			delay(30); textcolor(brown);		writeln('	  .############################.        ');  
			delay(30); textcolor(white);		writeln('	   ############################.        ');  
			delay(30); textcolor(yellow);		writeln('	   ############################.        ');  
			delay(30); textcolor(magenta);		writeln('	   =========+*######*+=========         ');  
			delay(30); textcolor(red); 		writeln('		        :=*###########=:               ');  
			delay(30); textcolor(cyan); 		writeln('	       .+################+:             ');
			delay(30); textcolor(green); 		writeln('	      =####################=            ');  
			delay(30); textcolor(lightmagenta);	writeln('	     +#######=*####*=#######+           ');  
			delay(30); textcolor(blue);		writeln('	    =######-  *####*  -######=          ');  
			delay(30); textcolor(red);		writeln('	   .######.   *####*   .*#####:         ');  
			delay(30); textcolor(lightblue);	writeln('	   +#####:    *####*    :#####+         ');  
			delay(30); textcolor(lightgreen);	writeln('	   #####*     *####*     +#####         ');  
			delay(30); textcolor(magenta);		writeln('	   +++++-     =++++=     -+++++         ');                                                    
			delay(800); clrscr;
			textcolor(lightgray);
	end;


	procedure iniciar_secuencias;
	begin
		//Se abre la secuencia de entrada y se posiciona en el primer elemento
		assign(sec, 'entrada.txt');
		{$I-}
		reset(sec);
		{$I+}
		
		if (IOresult <> 0) then
		begin
			write('No se pudo abrir el archivo...');
			textcolor(red);
			writeln(' Posiblemente no está creado.', #13#10); //#13#10 proporciona un salto de línea adicional
			halt;
		end;
	
		read(sec, v);
		
	
		//Se crea la secuencia de salida//
		assign(sally, 'salida.txt');
		{$I-}
		rewrite(sally);
		{$I+}
		
		if (IOresult <> 0) then
		begin
			write('No se pudo crear el archivo...');
			textcolor(red);
			writeln(' ERROR.');
			halt;
		end;
				
	end;
	
	//Con este procedimiento se corrige si el usuario ingresa una variable menor a los dos dígitos
	procedure corregir_mes;
	begin
		case (mes_usuario) of
			'1': mes_usuario:= '01';
			'2': mes_usuario:= '02';
			'3': mes_usuario:= '03';
			'4': mes_usuario:= '04';
			'5': mes_usuario:= '05';
			'6': mes_usuario:= '06';
			'7': mes_usuario:= '07';
			'8': mes_usuario:= '08';
			'9': mes_usuario:= '09';
		end;
	end;
	
	procedure ingresar_mes;
	begin
		//Este ciclo sirve para verificar que se ingrese un dato que no sobrepase los dos dígitos
		error_count:= 0;
		repeat
			if (error_count = 0) then
			begin
				writeln('Por favor, ingrese el mes que desee evaluar. ');
				write(' >> ');
				readln(mes_usuario);
				corregir_mes;
			end
			else
				begin
					//Si ingresa a esta parte, es porque se suministró un dato erróneo la primera vez
					textcolor(lightred);
					write('Ingresó un dato erróneo. Por favor, no ingrese más de ');
					textcolor(lightcyan);
					write('2');
					textcolor(lightred);
					writeln(' dígitos.');
					textcolor(lightgray);
					write(' >> ');
					readln(mes_usuario);
					corregir_mes;
				end;
			
			error_count:= error_count + 1;
		
		//'length' es una función de Pascal que devuelve la longitud de un string
		//con la segunda parte de la condición, se verifica que no se ingrese 0 como mes
		//con la tercera se corrige si como mes algo mayor a 12
		until ((length(mes_usuario) <= 2) and (mes_usuario <> '0') and (mes_usuario <= '12')); 	
	end;

	procedure ingresar_dni;
	begin
		error_count:= 0;
		repeat
			if (error_count = 0) then
			begin
				writeln('Por favor, ingrese el número de DNI que desee evaluar. ');
				write(' >> ');
				readln(dni_usuario);
			end
			else
				begin
					//Ídem a lo anterior
					textcolor(lightred);
					write('Ha ingresado un número incorrecto. Por favor, ingrese un número de ');
					textcolor(lightcyan);
					write('8');
					textcolor(lightred);
					writeln(' dígitos sin puntos entre sí.');
					textcolor(lightgray);
					write(' >> ');
					readln(dni_usuario);
				end;
			
			error_count:= error_count + 1;
		
		//Ídem al procedimiento anterior, pero se controla que se ingrese siempre un dato de 8 dígitos
		until (length(dni_usuario) = 8);
	end;

	procedure mensajes_finales;
	begin
		write(#13#10, 'La secuencia de salida se generó correctamente según el mes ');
		textcolor(lightcyan);
		
		case (mes_usuario) of 
			'01': mes_convert:= 'Enero';
			'02': mes_convert:= 'Febrero';
			'03': mes_convert:= 'Marzo';
			'04': mes_convert:= 'Abril';
			'05': mes_convert:= 'Mayo';
			'06': mes_convert:= 'Junio';
			'07': mes_convert:= 'Julio';
			'08': mes_convert:= 'Agosto';
			'09': mes_convert:= 'Septiembre';
			'10': mes_convert:= 'Octubre';
			'11': mes_convert:= 'Noviembre';
			'12': mes_convert:= 'Diciembre';
		end;
		
		write(mes_usuario, ' (', mes_convert,')');
		textcolor(lightgray);
		write('. La puede visualizar en la carpeta donde está alojado el programa, bajo el nombre ');
		textcolor(lightmagenta);
		writeln(' "salida.txt"');
		textcolor(lightgray);
		
		write('El promedio de distancia recorrida de los pasajes que se han comercializado es de ');
		textcolor(lightgreen);
		writeln((acuml_km_viajes/cont_pastot):0:2, 'km');
		
		textcolor(lightgray);
		write('La cantidad de pasajes que coinciden con el DNI ');
		textcolor(lightcyan);
		write(dni_usuario);
		textcolor(lightgray);
		write(' son ');
		textcolor(lightgreen);
		writeln(cont_pas_xdni, #13#10); 
		
		textcolor(lightgray);
		write('Presione cualquier tecla para salir o ');
		textcolor(yellow);
		write('ENTER');
		textcolor(lightgray);
		writeln(' para evaluar más datos.', #13#10);
		
		textcolor(lightred);
		writeln('ATENCIÓN! Si se evalúan más datos, la salida generada anteriormente se borrará.');
		textcolor(lightgray);
		
		option:= readkey; 
	end;
		
Begin
	present;
	repeat
		iniciar_secuencias;
		ingresar_mes;
		ingresar_dni;
		
		acuml_km_viajes:= 0;
		cont_pas_xdni:= 0;
		cont_pastot:= 0;
		
		while (v <> '*') do 
		begin
			while (v <> '+') do 
			begin
				//Todo lo anterior al primer "/" no lo necesito. Lo avanzo
				while (v <> '/') do 
				begin
					read(sec, v);
				end;
				read(sec, v);
				
				//Acumulo el mes para realizar luego la comparación con lo ingresado por el usuario.
				acuml_mes:= v;
				read(sec, v);
				acuml_mes:= acuml_mes + v;
				
				//Avanzo hasta la distancia recorrida
				for i:= 1 to 6 do 
				begin
					read(sec, v);
				end;
				
				//Convertimos a un número entero los km viajados, para poder operar y hallar el promedio
				acuml_convert:= 0;
				for i:= 3 downto 0 do
				begin
					case (v) of
						'0': acuml_convert:= acuml_convert + 0 * 10**i; 
						'1': acuml_convert:= acuml_convert + 1 * 10**i;
						'2': acuml_convert:= acuml_convert + 2 * 10**i;
						'3': acuml_convert:= acuml_convert + 3 * 10**i;
						'4': acuml_convert:= acuml_convert + 4 * 10**i;
						'5': acuml_convert:= acuml_convert + 5 * 10**i;
						'6': acuml_convert:= acuml_convert + 6 * 10**i;
						'7': acuml_convert:= acuml_convert + 7 * 10**i;
						'8': acuml_convert:= acuml_convert + 8 * 10**i;
						'9': acuml_convert:= acuml_convert + 9 * 10**i;
					end;
					read(sec, v);
				end;
				read(sec, v);
				//Acumulamos el total de kilómetros realizados
				acuml_km_viajes:= acuml_km_viajes + acuml_convert;
				
				//Avanzamos el origen
				while (v <> '-') do 
				begin
					read(sec, v); 
				end;
				read(sec, v);
				
				//Escribimos en la salida, si cumple la condición. Si no, avanza.
				if (mes_usuario = acuml_mes) then
				begin
					while (v <> '-') do 
					begin
						write(sally, v);
						read(sec, v);
					end;
					write(sally, ' # ');
				end
				else
					begin
						while (v <> '-') do 
						begin
							read(sec, v);
						end;
					end;
				//Nos paramos en el primer dígito del DNI, y los acumulamos para comparar.
				read(sec, v);
				
				//En Pascal se tienen que inicializar estas variables del tipo string, para usarlas como un acumulador
				acuml_dni:= '';
				for i:= 1 to 8 do 
				begin
					acuml_dni:= acuml_dni + v;
					read(sec, v); 
				end;
				
				if (dni_usuario = acuml_dni) then
				begin
					cont_pas_xdni:= cont_pas_xdni + 1;
				end;
				
			end;
			
			cont_pastot:= cont_pastot + 1;
			read(sec, v);
			
		end;
		
		mensajes_finales;
		
	until (option <> #13);
	
	close(sec);
	close(sally);
End.

{
	1- Generar una secuencia de salida con todos los destinos (separados por un #) de los pasajes vendidos en un mes que el usuario solicite.
	
	2- Calcular el promedio de distancia recorrida sobre la cantidad de pasajes vendidos.
	
	3- Contar la cantidad de pasajes comprados por un DNI ingresado por el usuario.
}











