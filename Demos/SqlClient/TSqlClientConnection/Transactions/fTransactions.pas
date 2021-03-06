unit fTransactions;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, ExtCtrls,
  CNClrLib.ADONet.EventArgs, CNClrLib.ADONet.SqlEventArgs, DB, fSQLMainCompBase,
  CNClrLib.ADONet.Client, CNClrLib.ADONet.SqlClient, CNClrLib.ADONet.Enums;

type
  TfrmTransaction = class(TfrmSQLMainCompBase)
    SqlClientQuery1: TSqlClientQuery;
    mmoInfo: TMemo;
    procedure btnConnectClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTransaction: TfrmTransaction;

implementation

{$R *.dfm}

procedure TfrmTransaction.btnConnectClick(Sender: TObject);
begin
  inherited;
  with SqlClientConnection1 do
  begin
    mmoInfo.Lines.Add('Set up trans isolation level...');

    IsolationLevel := TIsolationLevel.ilReadCommitted;
    mmoInfo.Lines.Add('  Isolation Level = ReadCommitted');

    mmoInfo.Lines.Add(' ');
    mmoInfo.Lines.Add('Turn off auto commit mode');

    mmoInfo.Lines.Add(' ');
    mmoInfo.Lines.Add('Start first transaction...');
    BeginTransaction;
    try
      mmoInfo.Lines.Add('  Execute simple command inside transaction');
      SqlClientQuery1.SQL.Text := 'select * from Categories';
      SqlClientQuery1.Open;
      mmoInfo.Lines.Add('  Commit transaction');
      Commit;
    except
      mmoInfo.Lines.Add('  Rollback transaction');
      Rollback;
      raise;
    end;

    mmoInfo.Lines.Add(' ');
    mmoInfo.Lines.Add('Start second transaction...');
    BeginTransaction;
    try
      mmoInfo.Lines.Add('  Execute simple command during transaction, provoke an error');
      // Now we specially provoke an error to Rollback our transaction and insert into
      // integer field a string value
      SqlClientQuery1.SQL.Text := 'insert into Categories(CategoryID) values(''Provocation'')';
      SqlClientQuery1.ExecSQL;
      mmoInfo.Lines.Add('  Commit transaction');
      Commit;
    except
      mmoInfo.Lines.Add('  Rollback transaction');
      // During SqlClientQuery1.ExecSQL it's raised an exception and transaction now rollbacking
      Rollback;
      raise;
    end;
  end;
end;

end.
