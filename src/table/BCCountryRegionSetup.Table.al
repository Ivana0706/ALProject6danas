table 50101 "BC Country/Region Setup"
{
    Caption = 'Country/Region Setup';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
            DataClassification = SystemMetadata;//ovo ne vrsi protekcijuu podataka
        }
        field(2; "Country/Region Code"; Code[10])
        {
            Caption = 'Country/Region Code';
            DataClassification = SystemMetadata;
            TableRelation = "Country/Region";
            ObsoleteState = Pending;//ovo
            ObsoleteReason = 'In version 2.0 this field will be removed';//i ovo
            //ObsoleteTag='';
            trigger OnValidate()
            begin
                CalcFields("Country/Region Name");
            end;
        }
        field(3; "Country/Region Name"; Text[50])
        {

            Caption = 'Country/Region name';
            FieldClass = FlowField;
            CalcFormula = lookup("Country/Region".Name where(Code = field("Country/Region Code")));//moze i filter i const
            Editable = false;
        }
        field(4; "Country/Region Enum"; Enum "BC Country/Region Enum")
        {
            DataClassification = SystemMetadata;
        }
    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}
