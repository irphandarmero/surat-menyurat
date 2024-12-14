unit Override.Standard;

interface

uses
  Vcl.StdCtrls, System.Classes,FireDAC.Comp.Client,Vcl.Dialogs, Data.DB,
  vcl.Grids, System.SysUtils, System.Types, vcl.Comctrls, Vcl.Controls, Vcl.Graphics;


type

  TJSON = class
    private
      FObject: TTreeView;
      function  GetString(ATree: String): String;
      procedure SetString(ATree, AStr: String);
      function  GetInteger(ATree: String): Integer;
      procedure SetInteger(ATree: String; AInt: Integer);
      function  Find(TTv: TTreeNode; AText: String): TTreeNode;
    public
      constructor Create;
      destructor Destroy; override;
      function Text: String;
      property AsString[ATree: String]: String read GetString write SetString;
      property AsInteger[ATree: String]: Integer read GetInteger write SetInteger;
  end;

  TColEditor = (ceText, ceTime);

  TCombobox = class(Vcl.StdCtrls.TComboBox)
  private
    FSQLText : string;
    function GetID: integer;
    procedure SetID(AID : integer);
  public
    constructor Create(AOwner : TComponent);override;
    property SQLText: string read FSQLText write FSQLText;
    property ID : integer read GetID write SetID;
    procedure Open;

  end;

  TStringGrid = class(vcl.Grids.TStringGrid)
    private
      FFormat: TFormatSettings;
      FTimeZero: boolean;
      FTime: TDateTimePicker;
      FJSON: TJSON;
      function  GetTimes(ACol, ARow: Integer): TTime;
      procedure SetTimes(ACol, ARow: Integer; ATime: TTime);
      function  GetTimeText(ACol, ARow: Integer): String;
      function  GetColEditor(ACol: Integer): TColEditor;
      procedure SetColEditor(ACol: Integer; AEditor: TColEditor);
      procedure InvisibleEditor;
      procedure TimeChange(Sender: TObject);

    protected
      procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
      procedure Click; override;
    public
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      function  ConfigText: String;
      property Times[ACol, ARow: Integer]: TTime read GetTimes write SetTimes;
      property FormatSettings: TFormatSettings read FFormat;
      property TimeText[ACol, ARow: Integer]: String read GetTimeText;
      property TimeZero: Boolean read FTimeZero write FTimeZero;
      property ColEditor[ACol: Integer]: TColEditor read GetColEditor
               write SetColEditor;
    end;

  TEdit = class(Vcl.StdCtrls.TEdit)
    private
      FDecimalCount : Integer;
      function GetAsInteger : Integer;
      procedure SetAsInteger(AInt:Integer);
      function GetAsFloat : Real;
      procedure SetAsFloat (AFloat:Real);
      function GetAsDecimal : Real;
      procedure SetAsDecimal(ADec: Real);
    public
      constructor Create(AOwner:TComponent); override;
      property AsInteger: Integer read GetAsInteger write SetAsInteger;
      property AsFloat: Real read GetAsFloat write SetAsFloat;
      property DecimalCount : integer read FDecimalCount write FDecimalCount;
      property AsDecimal:Real read GetAsDecimal write SetAsDecimal;

  end;
var
  OSQuery : TFDQuery;
implementation

uses Vcl.Forms, System.Variants;

{TJSON}
constructor TJSON.Create;
begin
  inherited Create;
  FObject := TTreeview.Create(nil);
  FObject.Parent := TForm.Create(nil);
  FObject.Items.AddChild(nil, 'root');
end;

destructor TJSON.Destroy;
begin
  TForm(FObject.Parent).Free;
  inherited Destroy;
end;

function  TJSON.GetInteger(ATree: String): Integer;
begin
  result := StrToIntDef(GetString(ATree), 0);
end;

procedure TJSON.SetInteger(ATree: String; AInt: Integer);
begin
  SetString(ATree, IntToStr(AInt));
end;

function  TJSON.Find(TTv: TTreeNode; AText: String): TTreeNode;
var
  iii: Integer;
begin
  result := nil;

  for iii := 0 to TTv.Count - 1 do
  begin
    if TTv.Item[iii].Text = AText then
    begin
      result := TTv.Item[iii];
      exit;
    end;
  end;
end;

function  TJSON.GetString(ATree: String): String;
var
  lst: TStrings;
  iii: Integer;
  tv1: TTreeNode;
  tv2: TTreeNode;
begin
  lst := TStringList.Create;
  tv1 := FObject.Items[0];
  lst.Text := StringReplace(ATree, '/', #13#10, [rfReplaceAll]);

  for iii := 0 to lst.Count - 1 do
  begin
    tv2 := Find(tv1, lst[iii]);
    if tv2 = nil then
    begin
      result := '';
      exit;
    end;

    tv1 := tv2;
  end;

  if tv1.Count = 0 then
  result := '' else
  result := tv1.Item[0].Text;
end;

function TJSON.Text: String;
begin
  result := '';
end;

procedure TJSON.SetString(ATree, AStr: String);
var
  lst: TStrings;
  iii: Integer;
  tv1: TTreeNode;
  tv2: TTreeNode;
begin
  lst := TStringList.Create;
  tv1 := FObject.Items[0];
  lst.Text := StringReplace(ATree, '/', #13#10, [rfReplaceAll]);

  for iii := 0 to lst.Count - 1 do
  begin
    tv2 := Find(tv1, lst[iii]);
    if tv2 = nil then
    tv1 := FObject.Items.AddChild(tv1, lst[iii]) else
    tv1 := tv2;
  end;

  if tv1.Count = 0 then
  FObject.Items.AddChild(tv1, AStr) else
  tv1.Item[0].Text := AStr;
end;

{TComboBox}

constructor TCombobox.Create;
begin
  inherited Create(AOwner);
  Style := csDropDown;

end;
procedure TCombobox.Open;
var idx : integer;
    sss : string;
begin
  OSQuery.SQL.Text := FSQLText;
  try
    OSQuery.Open;
  except
    on E:EDatabaseError do
    begin
      MessageDlg('Error dab'#13#10#13#10 + E.Message, mtError, [mbOK], 0);
      Exit;
    end;
  end;
  Clear;
  while not OSQuery.Eof do
  begin
    idx := OSQuery.Fields[0].AsInteger;
    sss := OSQuery.Fields[1].AsString;

    AddItem(sss, TObject(idx));
    OSQuery.Next;
  end;

end;

function TComboBox.GetID: Integer;
var xxx : integer;
begin
  xxx := ItemIndex;
  if xxx < 0 then
  begin
    xxx := 0;
  end else
  begin
    xxx := integer(Items.Objects[xxx]);
  end;

  Result := xxx;  
end;
procedure TComboBox.SetID(AID: Integer);
var idx, iii, xxx : integer;
begin
  xxx := -1;
  for iii := 0 to Items.Count-1 do
  begin
    idx := Integer(Items.Objects[iii]);

    if idx = AID then
    begin
      xxx := iii;
      Break;
    end;    
  end;
  ItemIndex := xxx; 
end;

{TStringGrid}
procedure TStringGrid.TimeChange(Sender: TObject);
begin
  SetTimes(Col, Row, FTime.Time);
end;

procedure TStringGrid.Click;
var
  Rec: TRect;
  Tim: TTime;
begin
  if GetColEditor(Col) = ceTime then
  begin
    if (Col < FixedCols) or (Row < FixedRows) then exit;

    Rec := CellRect(Col, Row);
    Tim := StrToTimeDef(Cells[Col, Row], 0, FFormat);

    FTime.Time    := Tim;
    FTime.Left    := Rec.Left + 2;
    FTime.Top     := Rec.Top  + 2;
    FTime.Visible := true;
    FTime.Kind    := dtkTime;
    FTime.Format  := FFormat.LongTimeFormat;
    FTime.Width   := ColWidths[Col] - 4;
  end;
end;

function  TStringGrid.ConfigText: String;
begin
  result := FJSON.Text;
end;

procedure TStringGrid.InvisibleEditor;
begin
  FTime.Visible := false;
end;

function  TStringGrid.GetColEditor(ACol: Integer): TColEditor;
var
  sss: String;
begin
  sss := format('editor/col/%d', [ACol]);
  result := TColEditor(FJSON.GetInteger(sss));
end;

procedure TStringGrid.SetColEditor(ACol: Integer; AEditor: TColEditor);
var
  sss: String;
begin
  sss := format('editor/col/%d', [ACol]);

  FJSON.SetString(sss, VarToStr(AEditor));
end;

destructor TStringGrid.Destroy;
begin
  FTime.Free;
  FJSON.Free;

  inherited Destroy;
end;

procedure TStringGrid.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseMove(Shift, X, Y);
  InvisibleEditor;

  if Assigned(OnMouseMove) then
  OnMouseMove(Self, Shift, X, Y);
end;

function  TStringGrid.GetTimeText(ACol, ARow: Integer): String;
begin
  result := TimeToStr(GetTimes(ACol, ARow), FFormat);
end;

constructor TStringGrid.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FTime          := TDateTimePicker.Create(Self);
  FTime.Parent   := Self;
  FTime.Visible  := false;
  FTime.OnChange := TimeChange;
  FJSON          := TJSON.Create;

  FFormat.LongTimeFormat  := 'HH:mm:ss';
  FFormat.ShortTimeFormat := 'HH:mm:ss';
  FFormat.TimeSeparator   := ':';
end;

function  TStringGrid.GetTimes(ACol, ARow: Integer): TTime;
begin
  result := StrToTimeDef(Cells[ACol, ARow], 0, FFormat);
end;

procedure TStringGrid.SetTimes(ACol, ARow: Integer; ATime: TTime);
begin
  if (ATime = 0) and (not FTimeZero) then
  Cells[ACol, ARow] := '' else
  Cells[ACol, ARow] := TimeToStr(ATime, FFormat);
end;


{TEdit}
constructor TEdit.Create(AOwner : TComponent);
begin
  inherited Create(AOwner);
  FDecimalCount := 2;
end;
function TEdit.GetAsInteger : Integer;
begin
  Result := StrToIntDef(Text,0);
end;
procedure TEdit.SetAsInteger(AInt: Integer);
begin
  Text := IntToStr(AInt);
end;
function TEdit.GetAsFloat : Real;
begin
  Result := StrToFloatDef(Text,0);
end;
procedure TEdit.SetAsFloat(AFloat: Real);
begin
  Text := FloatToStr(AFloat);
end;
function TEdit.GetAsDecimal : Real;
var sss : string;
begin
  //menghapus pemisah ribuan
  sss := StringReplace(Text,Formatsettings.ThousandSeparator,'',[rfReplaceAll]);
  Result := StrToFloatDef(sss, 0);
end;
procedure TEdit.SetAsDecimal(ADec: Real);
begin
  Text := Format('%.*n',[DecimalCount,ADec]);
end;




end.
