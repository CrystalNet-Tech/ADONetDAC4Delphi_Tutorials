inherited frmLiveUpdates: TfrmLiveUpdates
  Caption = 'Live Updates'
  ExplicitHeight = 576
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    inherited lblTitle: TLabel
      Width = 364
      Caption = 'Live Updates and OnUpdateRecord'
      ExplicitWidth = 364
    end
  end
  inherited pnlMain: TPanel
    inherited pnl1: TPanel
      inherited pgcMain: TPageControl
        inherited tsData: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 578
          ExplicitHeight = 308
          object dbgrd1: TDBGrid
            Left = 0
            Top = 0
            Width = 578
            Height = 274
            Align = alClient
            DataSource = dsCategories
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
          end
          object pnl2: TPanel
            Left = 0
            Top = 274
            Width = 578
            Height = 34
            Align = alBottom
            BevelOuter = bvNone
            ParentColor = True
            TabOrder = 1
            object dbnvgr1: TDBNavigator
              Left = 0
              Top = 6
              Width = 240
              Height = 25
              DataSource = dsCategories
              TabOrder = 0
            end
          end
        end
        inherited tsOptions: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 578
          ExplicitHeight = 308
          inherited pnlTree: TPanel
            inherited grp2: TGroupBox
              inherited cbUpdateMode: TComboBox
                Enabled = False
              end
            end
          end
        end
        object ts1: TTabSheet
          Caption = 'OnUpdateRecord Log'
          ImageIndex = 2
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object mmoLog: TMemo
            Left = 0
            Top = 0
            Width = 578
            Height = 308
            Align = alClient
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
      end
    end
  end
  object dsCategories: TDataSource
    DataSet = OracleClientQueryCategories
    Left = 288
    Top = 256
  end
  object OracleClientQueryCategories: TOracleClientQuery
    Connection = OracleClientConnection1
    FetchOptions.Unidirectional = False
    Parameters = <>
    SQL.Strings = (
      'Select * from Categories')
    OnUpdateRecord = OracleClientQueryCategoriesUpdateRecord
    Left = 416
    Top = 256
  end
end
