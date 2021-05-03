with Ada.Text_IO;use Ada.Text_IO;
with Ada.Integer_Text_IO;use Ada.Integer_Text_IO;
with d_conjunto;
procedure Main is
   subtype alfabet is Character range ' '..'z';
   package d_taula_frequencies is new d_conjunto(key => alfabet, item=>Integer);
   use d_taula_frequencies;

   c:conjunto;
   f_entrada : File_Type;
   Char: Character; --Temporal
   int:Integer;
   encontrado: boolean;
   it : iterador;
   alfa : alfabet;
begin
   Open(f_entrada, Mode => In_File, Name => "entrada.txt"); --abrimos el fichero que contiene los texto
   cvacio(c);
   Get_Immediate(f_entrada,Char);
   poner(c,alfabet(Char),1);
   while not End_Of_File(f_entrada) loop

      Get_Immediate(f_entrada,Char);
      alfa:=alfabet(Char);
      --Put_Line("elemento: " & Character(alfa));
      --consultar(c,alfabet(Char),int);
     -- if not es_valido(alfabet(Char)) then poner(c,alfabet(Char),1);
      --else actualiza(c,alfabet(Char),x => 1); -- +1 no 1
     -- end if;
      primero(c, it); encontrado := false; --pruebas
      while es_valido(it) and not encontrado loop
         obtener(c, it, alfa, int);
         if consultar(c,alfa,int) then encontrado:= true;
         else  siguiente(c, it);
         end if;
      end loop;
      if not encontrado then poner(c,alfa,1);
      else actualiza(c,alfa,x => int+1);
      end if;


   end loop;
   Close(f_entrada);--cerramos el fichero de los texto
   primero(c, it);
   while es_valido(it) loop
      obtener(c, it, alfabet(Char), int);
      --Put_Line("elemento: " & Char & "veces: " & int);
      Put("elemento: ");
      Put(alfabet(Char));
      Put(" veces: ");
      Put(int);
      siguiente(c, it);
   end loop;


end Main;
