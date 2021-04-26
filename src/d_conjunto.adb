package body d_conjunto is

   procedure primero(s: in conjunto; it : out iterador) is
      e: existencia renames s.e;
      k: key renames it.k;
      valid : boolean renames it.valid;
   begin
      k:=key'First;
      while not e(k) and k < key'last loop   k:= key'succ(k); end loop;
      valid:= e(k);
   end primero;

   procedure siguiente(s: in conjunto; it : in out iterador) is
      e     : existencia renames s.e;
      k     : key renames it.k;
      valid : boolean renames it.valid;
   begin
      if not valid then raise mal_uso; end if ;
      if k < key'last then
         k:=key'Succ(k);
         while not e(k) and k < key'last loop  k := key'succ(k);  end loop;
         valid:= e(k);
      else valid:= false;
      end if;
   end siguiente;

   function es_valido(it: in iterador) return boolean is
   begin
      return it.valid;
   end es_valido;

   procedure obtener(s: in conjunto; it :in iterador; k: out key; x: out item) is
      c : contenido renames s.c;
      valid : boolean renames it.valid;
   begin
      if not valid then raise mal_uso; end if ;
      k:= it.k;
      x:= c(k);
   end obtener;

   --procedure busqueda(s : in conjunto; k: in key; x: out item) is
   --   encontrado: boolean;
   --   it : iterador;
   --begin
   --   primero(s, it); encontrado := false;
    --  while es_valido(it) and not encontrado loop
   --      obtener(s, it, k, x);
   --      if p(k, x) then  encontrado:= true;
   --      else  siguiente(s, it);
   --      end if;
   --   end loop;
   --   if not encontrado then poner(s,k,1);
   --   else actualiza(s,k,x => +1);
    --  end if;
   --end busqueda;

   procedure cvacio(s:out conjunto) is --O(n)
      e: existencia renames s.e;
   begin
      for k in key loop e(k):= false;end loop;
   end cvacio;

   procedure poner(s:in out conjunto; k:in key; x:in item)is
      e: existencia renames s.e;
      c: contenido renames s.c;
   begin
      if e(k)then raise ya_existe;end if;
        e(k):= true; c(k):= x;
   end poner;

   procedure actualiza(s:in out conjunto; k:in key; x:in item)
   is
      e: existencia renames s.e;
      c: contenido renames s.c;
   begin
      if not e(k)then raise no_existe;end if ;
      c(k):= x;
   end actualiza;

   function consultar(s:in conjunto; k:in key; x:out item) return boolean
   is
      e: existencia renames s.e;
      c: contenido renames s.c;
   begin
      if not e(k)then return False;end if ;
      x:= c(k);
      return True;
   end consultar;

   procedure borrar(s:in out conjunto; k: in key) is
      e: existencia renames s.e;
   begin
      if not e(k)then raise no_existe;end if ;
      e(k):= false;
      end borrar;

end d_conjunto;
