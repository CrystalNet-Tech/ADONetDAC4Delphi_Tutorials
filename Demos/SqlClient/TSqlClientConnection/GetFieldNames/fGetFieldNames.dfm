inherited frmGetFieldNames: TfrmGetFieldNames
  Caption = 'GetFieldName and GetTableNames'
  ClientHeight = 561
  ClientWidth = 533
  ExplicitWidth = 549
  ExplicitHeight = 600
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    Width = 533
    ExplicitWidth = 533
    inherited bvlTitle: TBevel
      Width = 533
      ExplicitWidth = 533
    end
    inherited lblTitle: TLabel
      Width = 364
      Caption = 'GetFieldName and GetTableNames'
      ExplicitWidth = 364
    end
  end
  inherited pnlMain: TPanel
    Width = 533
    Height = 471
    ExplicitWidth = 533
    ExplicitHeight = 471
    inherited pnlConnDef: TPanel
      Width = 533
      ExplicitWidth = 533
    end
    inherited pnl1: TPanel
      Width = 533
      Height = 384
      ExplicitWidth = 533
      ExplicitHeight = 384
      object pnl2: TPanel
        Left = 0
        Top = 0
        Width = 533
        Height = 384
        Align = alClient
        BevelOuter = bvNone
        BorderWidth = 1
        TabOrder = 0
        DesignSize = (
          533
          384)
        object lbl3: TLabel
          Left = 5
          Top = 3
          Width = 31
          Height = 13
          Alignment = taCenter
          Caption = 'Tables'
        end
        object lbl4: TLabel
          Left = 270
          Top = 3
          Width = 27
          Height = 13
          Alignment = taRightJustify
          Caption = 'Fields'
        end
        object lbl5: TLabel
          Left = 7
          Top = 238
          Width = 48
          Height = 13
          Alignment = taRightJustify
          Anchors = [akLeft, akBottom]
          Caption = 'Key Fields'
          ExplicitTop = 288
        end
        object lstTables: TListBox
          Left = 7
          Top = 19
          Width = 257
          Height = 211
          Anchors = [akLeft, akTop, akBottom]
          ItemHeight = 13
          Items.Strings = (
            '')
          Sorted = True
          TabOrder = 1
          OnClick = lstTablesClick
        end
        object lstFields: TListBox
          Left = 269
          Top = 19
          Width = 256
          Height = 211
          Anchors = [akLeft, akTop, akRight, akBottom]
          ItemHeight = 13
          Items.Strings = (
            '')
          TabOrder = 2
        end
        object lstKeyFields: TListBox
          Left = 7
          Top = 257
          Width = 517
          Height = 118
          Anchors = [akLeft, akRight, akBottom]
          ItemHeight = 13
          TabOrder = 0
        end
      end
    end
  end
  inherited pnlButtons: TPanel
    Top = 524
    Width = 533
    ExplicitTop = 524
    ExplicitWidth = 533
    inherited bvlButtons: TBevel
      Width = 533
      ExplicitWidth = 533
    end
    inherited btnClose: TButton
      Left = 455
      ExplicitLeft = 455
    end
  end
end
