with Ada.Text_IO;use Ada.Text_IO;
with d_conjunto;
procedure Main is
   subtype alfabet is Character range ' '..'z';
   package d_taula_frequencies is new d_conjunto(key => alfabet, item=>Integer);
   use d_taula_frequencies;

   c:conjunto;
   f_entrada : File_Type;
   Char: Character; --Temporal
begin
   Open(f_entrada, Mode => In_File, Name => "entrada.txt"); --abrimos el fichero que contiene los texto
   while not End_Of_File(f_entrada) loop

      Get_Immediate(f_entrada,Char);
      Put_Line("elemento: " & Char);



   end loop;
   Close(f_entrada);--cerramos el fichero de los texto
end Main;
