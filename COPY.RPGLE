**free

      //- Dictionary

      dcl-Ds DsUsuarioT Qualified Template;
        Nombre like(wNombreT);
        Id like(wIdT);
        Fecha like(wFechaT);
        Tiempo like(wTiempoT);
      end-Ds;

      dcl-s wNombreT char(10) Template;
      dcl-s wIdT int(5) Template;
      dcl-s wMsgIdT char(7) Template;
      dcl-s wFechaT varchar(100) Template;
      dcl-s wTiempoT varchar(100) Template;
      dcl-s wSqlStateT char(5) Template;

      //- Prototypes

      dcl-pr PrInsertar;
        parUsuario likeDs(DsUsuarioT) Const;
        parSqlState like(wSqlStateT);
      end-pr;  

      dcl-pr FnFormatoFecha like(wFechaT);
        parDate Date(*ISO) Const;
      end-pr;

      dcl-pr FnFormatoTiempo like(wTiempoT);
        parTime Time(*ISO) Const;
      end-pr;

      dcl-pr PrEntrada;
        parNombre like(wNombreT) Const;
        parId like(wIdT) Const;
        parMsgId like(wMsgIdT);
      end-pr;