**free

      ctl-opt Copyright('Bancolombia - Wilson David Calderon Marquez');
      ctl-opt nomain;

      /copy COPY

      dcl-Proc PrInsertar Export;
        dcl-pi *n;
          InUsuario likeDs(DsUsuarioT) Const;
          OutSqlState like(wSqlStateT);
        end-pi;

        //- Process 

        Exec SQL
          Insert Into USUARIO Values(:InUsuario);

        OutSqlState = SQLSTATE; 

      end-Proc;   
