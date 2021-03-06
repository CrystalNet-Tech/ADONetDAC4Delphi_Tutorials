unit fBlobs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, fMainQueryBase, CNClrLib.ADONet.Enums,
  CNClrLib.ADONet.Error, CNClrLib.ADONet.EventArgs,
  CNClrLib.ADONet.OracleEventArgs, DB, CNClrLib.ADONet.Client,
  CNClrLib.ADONet.OracleClient, StdCtrls, DBCtrls, Grids,
  DBGrids, ExtCtrls, Buttons, ComCtrls;

type
  TfrmBlobs = class(TfrmMainQueryBase)
    pnl2: TPanel;
    btnClrPic: TButton;
    btnSavePic: TButton;
    btnLoadPic: TButton;
    dbnvgr1: TDBNavigator;
    dlgSave1: TSaveDialog;
    dsCategories: TDataSource;
    dlgOpen1: TOpenDialog;
    dbgrd1: TDBGrid;
    spl1: TSplitter;
    dbmmoDescription: TDBMemo;
    spl2: TSplitter;
    img1: TImage;
    OracleClientQueryCategories: TOracleClientQuery;
    procedure btnClrPicClick(Sender: TObject);
    procedure btnSavePicClick(Sender: TObject);
    procedure btnLoadPicClick(Sender: TObject);
    procedure btnConnectClick(Sender: TObject);
    procedure dsCategoriesDataChange(Sender: TObject; Field: TField);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBlobs: TfrmBlobs;

implementation

{$R *.dfm}

procedure TfrmBlobs.btnClrPicClick(Sender: TObject);
begin
  if not (OracleClientQueryCategories.State in dsEditModes) then
    OracleClientQueryCategories.Edit;
  OracleClientQueryCategories.FieldByName('Picture').Clear;
end;

procedure TfrmBlobs.btnConnectClick(Sender: TObject);
begin
  inherited;
  OracleClientQueryCategories.Open;
end;

procedure TfrmBlobs.btnLoadPicClick(Sender: TObject);
var
  oFld: TBlobField;
begin
  oFld := TBlobField(OracleClientQueryCategories.FieldByName('Picture'));
  if dlgOpen1.Execute then begin
    if not (OracleClientQueryCategories.State in dsEditModes) then
      OracleClientQueryCategories.Edit;
    oFld.LoadFromFile(dlgOpen1.FileName);
  end;
end;

procedure TfrmBlobs.btnSavePicClick(Sender: TObject);
var
  oFld: TBlobField;
  oStr, oFile: TStream;
  s: AnsiString;
  i: Integer;
begin
  oFld := TBlobField(OracleClientQueryCategories.FieldByName('Picture'));
  if not oFld.IsNull and dlgSave1.Execute then begin
    oStr := OracleClientQueryCategories.CreateBlobStream(oFld, bmRead);
    try
      SetLength(s, oStr.Size);
      oStr.Read(PAnsiChar(s)^, oStr.Size);
      i := AnsiPos('BM', s);
      if i <> -1 then
        oStr.Position := i - 1;
      oFile := TFileStream.Create(dlgSave1.FileName, fmCreate);
      try
        oFile.CopyFrom(oStr, oStr.Size - oStr.Position);
      finally
        oFile.Free;
      end;
    finally
      oStr.Free;
    end;
  end;
end;

procedure TfrmBlobs.dsCategoriesDataChange(Sender: TObject; Field: TField);
var
  oStr: TStream;
  oBmp: TBitmap;
  s: AnsiString;
  i: Integer;
begin
  oStr := OracleClientQueryCategories.CreateBlobStream(OracleClientQueryCategories.FieldByName('Picture'), bmRead);
  try
    if oStr.Size = 0 then
      img1.Visible := False
    else begin
      SetLength(s, oStr.Size);
      oStr.Read(PAnsiChar(s)^, oStr.Size);
      i := AnsiPos('BM', s);
      if i <> -1 then
        oStr.Position := i - 1;
      oBmp := TBitmap.Create;
      try
        oBmp.LoadFromStream(oStr);
        img1.Picture.Bitmap := oBmp;
        img1.Visible := True;
      finally
        oBmp.Free;
      end;
    end;
  finally
    oStr.Free;
  end;
end;

procedure TfrmBlobs.FormCreate(Sender: TObject);
begin
  inherited;
  RegisterDS(OracleClientQueryCategories);
end;

end.
