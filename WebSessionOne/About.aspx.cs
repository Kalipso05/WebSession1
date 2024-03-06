using DataCenter.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebSessionOne.ViewModel;

namespace WebSessionOne
{
    public partial class About : Page
    {
        private static Patient _selectedPatient {  get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected async void ButtonAddHospitalization_Click(object sender, EventArgs e)
        {
            if (txbFirstName.Text == "" && txbLastName.Text == "" && txbPatronymic.Text == ""
                && txbPassSeries.Text == "" && txbPassNumber.Text == "" && txbWorkPlace.Text == ""
                && txbInsuranseNumber.Text == "" && txbInsuranseExpiration.Text == "" && txbInsuranseCompany.Text == ""
                && txbDateOfHospitalization.Text == "" && txbTimeOfHospitalization.Text == "")
            {
                return;
            }
            await ViewHospitalizationModel.PostHospitalizationObject(_selectedPatient.ID, txbDateOfHospitalization.Text, txbTimeOfHospitalization.Text);
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (var db = new dbModel())
            {
                var patientId = Convert.ToInt32(DropDownList1.SelectedValue);

                var patient = db.Patient.Where(item => item.ID == patientId).FirstOrDefault();
                _selectedPatient = patient;

                txbFirstName.Text = patient.FirstName;
                txbLastName.Text = patient.LastName;
                txbPatronymic.Text = patient.Patronymic;
                txbWorkPlace.Text = patient.WorkPlace;

                txbPassSeries.Text = patient.Passport.SeriesPassport;
                txbPassNumber.Text = patient.Passport.NumberPassport;

                txbInsuranseNumber.Text = patient.InsuransePolicy.Number;
                txbInsuranseExpiration.TextMode = TextBoxMode.SingleLine;
                txbInsuranseExpiration.Text = patient.InsuransePolicy.DateOfExpiration.ToString();

                txbInsuranseCompany.Text = patient.InsuranseCompany.Title;
            }
        }
    }
}