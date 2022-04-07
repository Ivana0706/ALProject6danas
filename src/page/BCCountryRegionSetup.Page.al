page 50100 "BC Country/Region Setup"
{
    Caption = 'Country/Region Setup';
    PageType = Card;
    SourceTable = "BC Country/Region Setup";
    UsageCategory = Administration;
    ApplicationArea = All;
    InsertAllowed = false;
    DeleteAllowed = false;
    //Editable=false to bi pokrilo sve



    layout
    {
        area(content)
        {
            group(General)
            {
                field(CountryRegion; Rec."Country/Region Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Select Country/Region for you Localization';
                    Visible = false;
                }
                field(Name; Rec."Country/Region Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Country/Region Name';
                    Visible = false;
                }
                field(CountryRegionEnum; Rec."Country/Region Enum")
                {
                    Visible = true;
                    ApplicationArea = All;

                    ToolTip = 'Country/Region Enum';
                }
            }
        }
    }
    trigger OnOpenPage()

    begin
        if not Rec.FindFirst() then begin
            Rec.Init(); //inicijalizacija
            Rec.Insert();
        end;
    end;


}
