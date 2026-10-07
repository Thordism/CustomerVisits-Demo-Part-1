table 50100 "Customer Visit"
{
    Caption = 'Customer Visit';

    fields
    {
        // The most common type for counters and primary keys.
        // AutoIncrement = true makes the database assign the next number on Insert,
        // so you never set the value yourself.
        field(1; "Visit No."; Integer)
        {
            Caption = 'Visit No.';
            ToolTip = 'Specifies the number of the visit. It is assigned automatically when the visit is saved.';
            AutoIncrement = true;
        }

        // DATE: a date from January 1, 1753 to December 31, 9999.
        // An empty date is 0D. Today's date: Today(). The work date: WorkDate().
        // In Business Central we usually compare with WorkDate() in business logic
        // (see the Overdue column on the list page).
        // No default value: the user decides when the visit takes place.
        field(2; "Visit Date"; Date)
        {
            Caption = 'Visit Date';
            ToolTip = 'Specifies the date when the visit is planned or took place.';
        }

        // Text[n] datatype: a normal string of up to n characters (max 2048 for a field).
        // Keeps upper/lower case and spaces exactly as the user typed them.
        // Used for names, descriptions, addresses and so on.
        field(3; Subject; Text[100])
        {
            Caption = 'Subject';
            ToolTip = 'Specifies what the visit is about, for example a product presentation or a contract renewal.';
        }

        // DECIMAL: numbers with decimals. Used for amounts, prices and quantities.
        // Tip: never use Integer for money - always Decimal.
        // AutoFormatType = 1 formats the value as an amount (decimals and thousands
        // separators according to the general ledger setup).
        // MinValue = 0: a negative order potential has no meaning.
        field(4; "Order Potential (LCY)"; Decimal)
        {
            Caption = 'Order Potential (LCY)';
            ToolTip = 'Specifies the estimated value, in local currency, of the orders this visit may lead to.';
            AutoFormatType = 1;
            MinValue = 0;
        }

        // BOOLEAN: true or false. Shown as a checkbox or toggle on a page.
        // The default value is false.
        // This is a HISTORICAL OUTCOME of the visit: "did this visit show that a
        // follow-up was needed?". Planning the follow-up visit does NOT clear it.
        field(5; "Follow-up Required"; Boolean)
        {
            Caption = 'Follow-up Required';
            ToolTip = 'Specifies whether the visit showed that a follow-up visit is needed. The value is kept as part of the visit history, also after a follow-up visit has been planned.';
        }

        // DATETIME: a date AND a time in one value.
        // Stored in UTC in the database but shown in the user's time zone.
        // An empty DateTime is 0DT. Current value: CurrentDateTime().
        // Set by the OnValidate trigger on "Status", so the user cannot edit it.
        // It records a business event, so it keeps the table default CustomerContent.
        field(6; "Completed At"; DateTime)
        {
            Caption = 'Completed At';
            ToolTip = 'Specifies when the visit was marked as completed. It is set automatically when the status changes to Completed.';
            Editable = false;
        }

        // =============================================================================
        //  ENUM
        // =============================================================================
        // Why not a Text field for the status? With free text, users would type
        // 'Done', 'done', 'Finished', 'Complete' ... and no filter or FlowField could
        // rely on the value. An enum gives a FIXED list of values (see
        // CustomerVisitStatus.Enum.al).
        // Planned is ordinal 0, so it is the default - no InitValue is needed.
        // In code: Rec.Status := Rec.Status::Completed;
        field(7; Status; Enum "Customer Visit Status")
        {
            Caption = 'Status';
            ToolTip = 'Specifies whether the visit is planned, completed or cancelled.';
        }
        field(8; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            ToolTip = 'Specifies the customer number associated with the visit.';
            TableRelation = Customer."No.";
        }
        field(10; "Customer Name"; Text[100])
        {
            Caption = 'Customer Name';
            ToolTip = 'Specifies the name of the customer. The value is looked up from the Customer table.';
            FieldClass = FlowField;
            CalcFormula = lookup(Customer.Name where("No." = field("Customer No.")));
            Editable = false;
        }
    }

    // =================================================================================
    //  KEYS
    // =================================================================================
    keys
    {
        // PRIMARY KEY: the FIRST key in the list is always the primary key.
        // Its value must be unique for every record, and it decides the default sort
        // order. Clustered = true means the rows are physically stored in this order.
        key(PK; "Visit No.")
        {
            Clustered = true;
        }
    }
}
