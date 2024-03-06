using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebSessionOne.ViewModel;

namespace WebSessionOne
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonGenerateCode_Click(object sender, EventArgs e)
        {
            var viewModel = new ViewMedicalCardModel();

            var code = viewModel.GenerateCode();
            //var image = viewModel.GenerateQRCode(code);
            
            txbMedicalCardCode.Text = code;

            //viewModel.SaveQRCodeToFile(image, code);
        }

        protected async void ButtonAddPatient_Click(object sender, EventArgs e)
        {
            if (txbFirstName.Text == "" && txbLastName.Text == "" && txbPatronymic.Text == ""
                && txbPassSeries.Text == "" && txbPassNumber.Text == "" && txbWorkPlace.Text == ""
                && txbInsuranseNumber.Text == "" && txbInsuranseExpiration.Text == "" && txbInsuranseCompany.Text == ""
                && txbMedicalCardCode.Text == "" && txbMedicalCardNumber.Text == "")
            {
                return;
            }

            await ViewPatientModel.PostPatientObject(txbFirstName.Text, txbLastName.Text, txbPatronymic.Text, txbPassSeries.Text, txbPassNumber.Text, txbWorkPlace.Text,
                txbInsuranseNumber.Text, txbInsuranseExpiration.Text, txbInsuranseCompany.Text, txbMedicalCardNumber.Text, txbMedicalCardCode.Text);

            Response.Redirect(Request.RawUrl);
        }
    }
}