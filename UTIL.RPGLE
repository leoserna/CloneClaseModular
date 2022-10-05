**free

      ctl-opt Copyright('Bancolombia - Wilson David Calderon Marquez');
      ctl-opt nomain;

      /copy COPY

      //- Prototypes

      dcl-pr FnEstado like(wPosicionT);
        InSqlState like(wSqlStateT) Const;
      end-pr;

      //- Procedures

      dcl-Proc FnFormatoFecha Export;
        dcl-pi *n like(wFechaT);
          InDate Date(*ISO) Const;
        end-pi;

        //- Variables 

        dcl-s wFecha like(wFechaT);

        //- Process 

        wFecha = %Char(InDate:*Iso0);

        Return wFecha;
 
      end-Proc; 

      dcl-Proc FnFormatoTiempo Export;
        dcl-pi *n like(wTiempoT);
          InTime Time(*ISO) Const;
        end-pi;

        //- Variables 

        dcl-s wTiempo like(wTiempoT);

        //- Process 

        wTiempo = %Char(InTime:*hms);

        Return wTiempo;

      end-Proc; 
      
      dcl-Proc FnIdMensaje Export;
        dcl-pi *n like(wMsgIdT);
          InSqlState like(wSqlStateT) Const;
        end-pi;

        //- Structures

        dcl-Ds DsMensajes Qualified;
          Exitoso like(wMsgIdT) Inz(' ');
          RegistroNoExiste like(wMsgIdT) Inz('WDC0100');
          SinFiltros like(wMsgIdT) Inz('WDC0200');
          ObjetoNoExiste like(wMsgIdT) Inz('WDC0300');
          ErrorGenerico like(wMsgIdT) Inz('WDC0000');
          Id Like(wMsgIdT) Dim(5) Pos(1);
        end-Ds;

        //- Process

        Return DsMensajes.Id(FnEstado(InSqlState));
 
      end-Proc;

      dcl-Proc FnEstado;
        dcl-pi *n like(wPosicionT);
          InSqlState like(wSqlStateT) Const;
        end-pi;

        dcl-Ds DsStates Qualified;
          NoError Like(wSqlStateT) Inz('00000');
          NoRowsFound Like(wSqlStateT) Inz('02000');
          NoWhereClause Like(wSqlStateT) Inz('01504');
          ObjectNoExist Like(wSqlStateT) Inz('42704');
          EstadoSql Like(wSqlStateT) Dim(4) Pos(1);
        end-Ds;

        //- Variables

        dcl-s wPosicion like(wPosicionT);

        //- Constants

        dcl-c NO_DEFINIDA *Zeros;

        //- Process

        wPosicion = %LookUp(InSqlState:DsStates.EstadoSql);
        
        if wPosicion = NO_DEFINIDA;
          wPosicion = %Elem(DsStates.EstadoSql) + 1;
        endif;

        Return wPosicion; 

      end-Proc;        