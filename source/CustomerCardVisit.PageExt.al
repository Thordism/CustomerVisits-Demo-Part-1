pageextension 50100 "Customer Card Visit Ext." extends "Customer Card"
{
    layout
    {
        addafter(General)
        {
            group(Visits)
            {
                Caption = 'Visits';

                field("Visit Interval (Days)"; Rec."Visit Interval (Days)")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}