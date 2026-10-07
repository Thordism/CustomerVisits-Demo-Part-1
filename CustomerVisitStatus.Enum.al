enum 50101 "Customer Visit Status"
{
    Extensible = true; // Other extensions may add values with an enumextension
    Caption = 'Customer Visit Status';

    value(0; Planned)
    {
        Caption = 'Planned';
    }
    value(1; Completed)
    {
        Caption = 'Completed';
    }
    value(2; Cancelled)
    {
        Caption = 'Cancelled';
    }
}
