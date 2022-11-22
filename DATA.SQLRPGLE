**free

      ctl-opt Copyright('Bancolombia - Leonardo Serna Torres');
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
