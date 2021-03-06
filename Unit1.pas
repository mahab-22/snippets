unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Grids, DBGrids, Menus, DB, ADODB, ComCtrls,
  ExtCtrls;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    GroupBox2: TGroupBox;
    DBGrid2: TDBGrid;
    MainMenu1: TMainMenu;
    ADOConnection1: TADOConnection;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    ADOTable2: TADOTable;
    N1: TMenuItem;
    N2: TMenuItem;
    Button3: TButton;
    Button4: TButton;
    DBRichEdit1: TDBRichEdit;
    ColorBox1: TColorBox;
    Button1: TButton;
    procedure N2Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure ADOTable2BeforePost(DataSet: TDataSet);
    procedure Button1Click(Sender: TObject);
    procedure DBRichEdit1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.N2Click(Sender: TObject);
begin
close;
end;

procedure TForm1.DBGrid1CellClick(Column: TColumn);
begin
if not ADOTable2.Filtered then ADOTable2.Filtered:=true;
ADOTable2.Filter:='index='+inttostr(ADOTable1.RecNo);

end;

procedure TForm1.Button2Click(Sender: TObject);
begin

ADOTable2.Filtered:=false;

end;

procedure TForm1.Button4Click(Sender: TObject);
begin
if ADOTable2.RecordCount=0 then exit;
ADOTable2.Delete;
end;
procedure TForm1.ADOTable2BeforePost(DataSet: TDataSet);
begin
ADOTable2.FieldValues['index']:=ADOTABle1.RecNo;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin



dbRichEdit1.SelAttributes.Color:=ColorBox1.Selected;


end;

procedure TForm1.DBRichEdit1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
ADOTable2.Edit;
end;

end.
