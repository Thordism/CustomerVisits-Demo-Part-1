tableextension 50100 "Customer Visit Ext." extends Customer
{
    fields
    {
        field(50100; "Visit Interval (Days)"; Integer)
        {
            Caption = 'Visit Interval (Days)';
            ToolTip = 'Specifies how many days there should normally be between visits to the customer. It is used to suggest the date of a follow-up visit.';
            MinValue = 0;
            DataClassification = CustomerContent;
        }
    }

}