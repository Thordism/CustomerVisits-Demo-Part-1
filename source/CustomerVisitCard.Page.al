page 50100 "Customer Visit Card"
{
    PageType = Card;
    SourceTable = "Customer Visit";
    Caption = 'Customer Visit Card';
    ApplicationArea = All;
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            group(Visit)
            {
                Caption = 'Visit';

                field("Visit No."; Rec."Visit No.")
                {
                    Editable = false;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    trigger OnValidate()
                    begin
                        Rec.CalcFields("Customer Name");
                    end;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                }
                field("Visit Date"; Rec."Visit Date")
                {
                }
                field(Subject; Rec.Subject)
                {
                }
            }
            group(Outcome)
            {
                Caption = 'Outcome';

                field(Status; Rec.Status)
                {
                }
                field("Completed At"; Rec."Completed At")
                {
                }
                field("Order Potential (LCY)"; Rec."Order Potential (LCY)")
                {
                }
                field("Follow-up Required"; Rec."Follow-up Required")
                {
                }
            }
        }
    }
}
