**free
      
      dcl-pr PrEntrada;
        parNombre char(10) Const;
        parId int(5) Const;
        parMsgId char(7);
      end-pr;      

      dcl-s wNombre char(10);
      dcl-s wId int(5);
      dcl-s wMsgId char(7);

      //- Main

      Clear wMsgId;

      wNombre = 'Wilson';
      wId = 12345;

      PrEntrada(wNombre:wId:wMsgId);

      DSPLY wMsgId;

      Return;