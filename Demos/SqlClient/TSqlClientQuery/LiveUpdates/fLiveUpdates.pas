unit fLiveUpdates;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, fMainQueryBase,
  CNClrLib.ADONet.EventArgs, CNClrLib.ADONet.SqlEventArgs, DBCtrls,
  Grids, DBGrids, DB, CNClrLib.ADONet.Client,
  CNClrLib.ADONet.SqlClient, Buttons, StdCtrls, ComCtrls,
  ExtCtrls, CNClrLib.ADONet.Enums, CNClrLib.ADONet.Error;

type
  TfrmLiveUpdates = class(TfrmMainQueryBase)
    dbgrd1: TDBGrid;
    pnl2: TPanel;
    dbnvgr1: TDBNavigator;
    dsCategories: TDataSource;
    ts1: TTabSheet;
    mmoLog: TMemo;
    SqlClientQueryCategories: TSqlClientQuery;
    procedure btnConnectClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SqlClientQueryCategoriesUpdateRecord(Sender: TObject;
      EventArgs: TRowUpdatedEventArgs);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLiveUpdates: TfrmLiveUpdates;

implementation

{$R *.dfm}
uses
  TypInfo;

procedure TfrmLiveUpdates.btnConnectClick(Sender: TObject);
begin
  inherited;
  SqlClientQueryCategories.Open;
  mmoLog.Lines.Clear;
end;

procedure TfrmLiveUpdates.FormCreate(Sender: TObject);
begin
  inherited;
  RegisterDS(SqlClientQueryCategories);
end;

procedure TfrmLiveUpdates.SqlClientQueryCategoriesUpdateRecord(Sender: TObject;
  EventArgs: TRowUpdatedEventArgs);
var
  oMsg: string;
begin
  oMsg := 'Records Affected: '+ IntToStr(EventArgs.RecordsAffected) + #13#10 +
          'RowCount: '+ IntToStr(EventArgs.RowCount) + #13#10 +
          'Status: '+ TypInfo.GetEnumName(TypeInfo(TUpdateStatus_), Ord(EventArgs.Status)) + #13#10 +
          'StatementType: '+ TypInfo.GetEnumName(TypeInfo(TStatementType), Ord(EventArgs.StatementType)) + #13#10;

  if EventArgs.Errors <> nil then
    oMsg := oMsg + 'ErrorMessage: '+ EventArgs.Errors.Message;

  mmoLog.Lines.Add(oMsg);
  mmoLog.Lines.Add('**************************************************');
  mmoLog.Lines.Add('');
end;

end.
