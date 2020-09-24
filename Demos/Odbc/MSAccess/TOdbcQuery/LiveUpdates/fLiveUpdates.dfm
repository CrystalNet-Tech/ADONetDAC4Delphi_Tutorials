inherited frmLiveUpdates: TfrmLiveUpdates
  Caption = 'Live Updates and OnUpdateRecord'
  ExplicitHeight = 240
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
        ActivePage = tsData
        inherited tsData: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 578
          ExplicitHeight = 324
          object dbgrd1: TDBGrid
            Left = 0
            Top = 0
            Width = 578
            Height = 290
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
            Top = 290
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
          ExplicitHeight = 324
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
            Height = 324
            Align = alClient
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
      end
    end
  end
  object dsCategories: TDataSource
    DataSet = OdbcQueryEmployees
    Left = 304
    Top = 176
  end
  object OdbcQueryEmployees: TOdbcQuery
    Connection = OdbcConnection1
    FetchOptions.Unidirectional = False
    Parameters = <>
    SQL.Strings = (
      'Select * from Employee'
      ''
      '')
    OnUpdateRecord = OdbcQueryEmployeesUpdateRecord
    Left = 400
    Top = 184
  end
end
