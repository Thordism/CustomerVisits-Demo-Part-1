page 50101 "Customer Visits"
{
    PageType = List;
    SourceTable = "Customer Visit";
    Caption = 'Customer Visits';
    ApplicationArea = All;
    UsageCategory = Lists;
    CardPageId = "Customer Visit Card";
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(Visits)
            {
                field("Visit No."; Rec."Visit No.")
                {
                }
                field("Customer No."; Rec."Customer No.")
                {
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
                field(Status; Rec.Status)
                {
                    style = Favorable;
                    StyleExpr = IsCompleted;
                }
            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        IsCompleted := Rec.Status = Rec.Status::Completed;
    end;

    var
        IsCompleted: Boolean;
}
