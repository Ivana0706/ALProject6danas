codeunit 50100 "BC Country/Region Upgrade"
{
    //Subtype = Upgrade;


    // trigger OnUpgradePerCompany()//sam se pokrene u nekom trenutku ovaj triger
    // var
    //     UpgradeTag: Codeunit "Upgrade Tag";
    // begin
    //     if UpgradeTag.HasUpgradeTag(ReasonLbl) then exit;

    //     PerformUpgrade();

    //     UpgradeTag.SetUpgradeTag(ReasonLbl);//ovo je kao neka tablica upgrade
    // end;

    local procedure PerformUpgrade()
    var
        CountyRegionSetup: Record "BC Country/Region Setup";
        CountyRegionInstall: Codeunit "BC Country/Region-Install";
    begin
        //ovde pravimo nas kod 
        if not CountyRegionSetup.FindFirst() then
            CountyRegionInstall.HandleFreshInstall()
        else begin
            case CountyRegionSetup."Country/Region Code" of
                'SI':
                    CountyRegionSetup."Country/Region Enum" := CountyRegionSetup."Country/Region Enum"::SI;
                'RS':
                    CountyRegionSetup."Country/Region Enum" := CountyRegionSetup."Country/Region Enum"::RS;
                'CR':
                    CountyRegionSetup."Country/Region Enum" := CountyRegionSetup."Country/Region Enum"::CR;
                else
                    CountyRegionSetup."Country/Region Enum" := CountyRegionSetup."Country/Region Enum"::SI;
            end;
            CountyRegionSetup.Modify();

        end;

    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Upgrade Tag", 'OnGetPerCompanyUpgradeTags', '', false, false)]
    local procedure OnGetPerCompanyUpgradeTags(var PerCompanyUpgradeTags: List of [Code[250]]);
    begin
        PerCompanyUpgradeTags.Add(ReasonLbl);
    end;


    var
        ReasonLbl: Label 'BE-terna-SetupEnum-20220406', Locked = true;//ovde menjamo labelu
}