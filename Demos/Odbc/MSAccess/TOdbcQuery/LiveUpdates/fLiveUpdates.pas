unit fLiveUpdates;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, fMainQueryBase, CNClrLib.ADONet.Enums,
  CNClrLib.ADONet.Error, CNClrLib.ADONet.EventArgs,
  CNClrLib.ADONet.OdbcEventArgs, DB, CNClrLib.ADONet.Client,
  CNClrLib.ADONet.Odbc, StdCtrls, DBCtrls, Grids, DBGrids,
  ExtCtrls, Buttons, ComCtrls;

type
  TfrmLiveUpdates = class(TfrmMainQueryBase)
    dbgrd1: TDBGrid;
    pnl2: TPanel;
    dbnvgr1: TDBNavigator;
    dsCategories: TDataSource;
    ts1: TTabSheet;
    mmoLog: TMemo;
    OdbcQueryEmployees: TOdbcQuery;
    procedure btnConnectClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure OdbcQueryEmployeesUpdateRecord(Sender: TObject;
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
  OdbcQueryEmployees.Open;
  mmoLog.Lines.Clear;
end;

procedure TfrmLiveUpdates.FormCreate(Sender: TObject);
begin
  inherited;
  RegisterDS(OdbcQueryEmployees);
end;

procedure TfrmLiveUpdates.OdbcQueryEmployeesUpdateRecord(Sender: TObject;
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
