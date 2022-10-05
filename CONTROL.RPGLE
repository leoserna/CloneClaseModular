**free

      ctl-opt Copyright('Bancolombia - Wilson David Calderon Marquez');
      ctl-opt nomain;

      /copy COPY

      dcl-Proc PrEntrada Export;
        dcl-pi *n;
          InNombre like(wNombreT) Const;
          InId like(wIdT) Const;
          OutMsgId like(wMsgIdT);
        end-pi;

        //- Structures 

        dcl-Ds DsUsuario likeDs(DsUsuarioT); 

        //- Variables

        dcl-s wSqlState like(wSqlStateT);

        //- Process

        DsUsuario.Nombre = InNombre;
        DsUsuario.Id = InId; 
        DsUsuario.Fecha = FnFormato(%Date());
        DsUsuario.Tiempo = FnFormato(%Time());

        PrInsertar(DsUsuario:wSqlState);

        OutMsgId = FnFormato(wSqlState);

      end-Proc;
