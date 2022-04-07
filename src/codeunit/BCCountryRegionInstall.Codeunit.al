codeunit 50101 "BC Country/Region-Install"
{
    Subtype = Install;

    trigger OnInstallAppPerCompany();
    var
        UpgradeTag: Codeunit "Upgrade Tag";
        myAppInfo: ModuleInfo;
    begin
        NavApp.GetCurrentModuleInfo(myAppInfo);

        if myAppInfo.DataVersion = Version.Create(0, 0, 0, 0) then
            HandleFreshInstall()
        else
            HandleReinstall();

        UpgradeTag.SetAllUpgradeTags();
    end;

    procedure HandleFreshInstall();
    var
        CountryRegionSetup: Record "BC Country/Region Setup";
    begin
        CountryRegionSetup.Init();//inicijalizacija
        CountryRegionSetup."Country/Region Code" := 'RS';//da ovo bude default nas
        CountryRegionSetup."Country/Region Enum" := CountryRegionSetup."Country/Region Enum"::RS;
        if not CountryRegionSetup.Insert() then; //moze ovako da ostane,jer ne zelimo da pregazimo vrednost!

    end;

    local procedure HandleReinstall();
    var
        CountryRegionSetup: Record "BC Country/Region Setup";
    begin
        CountryRegionSetup.Init();//inicijalizacija
        CountryRegionSetup."Country/Region Code" := 'ES';//da ovo bude default nas
        CountryRegionSetup."Country/Region Enum" := CountryRegionSetup."Country/Region Enum"::RS;
        if not CountryRegionSetup.Insert() then; //moze ovako da ostane,jer ne zelimo da pregazimo vrednost!

    end;
}