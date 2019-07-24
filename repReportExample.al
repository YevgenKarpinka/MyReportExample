report 50100 "Customer List"
{
    CaptionML = ENU = 'Customer List';
    RDLCLayout = 'Customer List Report.rdl';
    dataset
    {
        dataitem(Customer; Customer)
        {
            RequestFilterFields = "No.", "Search Name", "Customer Posting Group";
            column(COMPANYNAME; COMPANYNAME)
            { }
            column(CurrReport_PAGENO; "No.")
            { }
            column(Cust_TABLECAPTION_CustFilter; TABLECAPTION + ': ' + CustFilter)
            { }
            column(CustFilter; CustFilter)
            { }
            column(Cust_No; "No.")
            { }
            column(Cust_Customer_Posting_Group; "Customer Posting Group")
            { }
            column(Cust_Customer_Disc_Group; "Customer Disc. Group")
            { }
            column(Cust_Invoice_Disc_Code; "Invoice Disc. Code")
            { }
            column(Cust_Customer_Price_Group; "Customer Price Group")
            { }
            column(Cust_Fin_Charge_Terms_Code; "Fin. Charge Terms Code")
            { }
            column(Cust_Payment_Terms_Code; "Payment Terms Code")
            { }
            column(Cust_Salesperson_Code; "Salesperson Code")
            { }
            column(Cust_Currency_Code; "Currency Code")
            { }
            column(Cust_Credit_Limit_LCY; "Credit Limit (LCY)")
            {
                DecimalPlaces = 0 : 0;
            }
            column(Cust_Balance_LCY; "Balance (LCY)")
            { }
            column(CustAddr1; CustAddr[1])
            { }
            column(CustAddr2; CustAddr[2])
            { }
            column(CustAddr3; CustAddr[3])
            { }
            column(CustAddr4; CustAddr[4])
            { }
            column(CustAddr5; CustAddr[5])
            { }
            column(Cust_Contact; Contact)
            { }
            column(Cust_Phone_No; "Phone No.")
            { }
            column(CustAddr6; CustAddr[6])
            { }
            column(CustAddr7; CustAddr[7])
            { }
            column(Cust_ListCaption; Customer_ListCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Cust_NoCaption; FIELDCAPTION("No."))
            {
            }
            column(Cust_Customer_Posting_GroupCaption; Customer_Customer_Posting_GroupCaptionLbl)
            {
            }
            column(Cust_Customer_Disc_GroupCaption; Customer_Customer_Disc_GroupCaptionLbl)
            {
            }
            column(Cust_Invoice_Disc_CodeCaption; Customer_Invoice_Disc_CodeCaptionLbl)
            {
            }
            column(Cust_Customer_Price_GroupCaption; Customer_Customer_Price_GroupCaptionLbl)
            {
            }
            column(Cust_Fin_Charge_Terms_CodeCaption; FIELDCAPTION("Fin. Charge Terms Code"))
            {
            }
            column(Cust_Payment_Terms_CodeCaption; Customer_Payment_Terms_CodeCaptionLbl)
            {
            }
            column(Cust_Salesperson_CodeCaption; FIELDCAPTION("Salesperson Code"))
            {
            }
            column(Cust_Currency_CodeCaption; Customer_Currency_CodeCaptionLbl)
            {
            }
            column(Cust_Credit_Limit_LCYCaption; FIELDCAPTION("Credit Limit (LCY)"))
            {
            }
            column(Cust_Balance_LCYCaption; FIELDCAPTION("Balance (LCY)"))
            {
            }
            column(Cust_ContactCaption; FIELDCAPTION(Contact))
            {
            }
            column(Cust_Phone_NoCaption; FIELDCAPTION("Phone No."))
            {
            }
            column(Total_LCY_Caption; Total_LCY_CaptionLbl)
            {
            }
            trigger OnAfterGetRecord();
            begin
                CalcFields("Balance (LCY)");
                FormatAddr.FormatAddr(CustAddr, Name, "Name 2", Contact, Address, "Address 2",
                                        City, "Post Code", County, "Country/Region Code");
            end;
        }
    }

    requestpage
    {
        SaveValues = true;
        ContextSensitiveHelpPage = 'my-feature';

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
        LabelName = 'Label Text', Comment = 'Foo', MaxLength = 999, Locked = true;
    }

    trigger OnPreReport()
    var
        CaptionMgt: Codeunit 50100;
    begin
        CustFilter := CaptionMgt.GetRecordFiltersWithCaptions(Customer);
    end;

    var
        FormatAddr: Codeunit 365;
        CustFilter: Text;
        CustAddr: array[8] of Text[100];
        Customer_ListCaptionLbl: TextConst ENU = 'Customer - List', RUS = 'Клиенты - Список';
        CurrReport_PAGENOCaptionLbl: TextConst ENU = 'Page', RUS = '';
        Customer_Customer_Posting_GroupCaptionLbl: TextConst ENU = 'Customer Posting Group', RUS = '';
        Customer_Customer_Disc_GroupCaptionLbl: TextConst ENU = 'Cust./Item Disc. Gr.', RUS = '';
        Customer_Invoice_Disc_CodeCaptionLbl: TextConst ENU = 'Invoice Disc. Code', RUS = '';
        Customer_Customer_Price_GroupCaptionLbl: TextConst ENU = 'Price Group Code';
        Customer_Payment_Terms_CodeCaptionLbl: TextConst ENU = 'Payment Terms Code';
        Customer_Currency_CodeCaptionLbl: TextConst ENU = 'Currency Code';
        Total_LCY_CaptionLbl: TextConst ENU = 'Total (LCY)';

}

codeunit 50100 "Caption Mgt"
{
    procedure GetRecordFiltersWithCaptions(locCust: Record Customer): Text;
    var
        Result: Text;
    begin
        Result := locCust.GetFilters;
        exit(Result);
    end;
}