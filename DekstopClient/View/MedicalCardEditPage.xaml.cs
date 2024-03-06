using DataCenter.Model;
using DekstopClient.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace DekstopClient.View
{
    /// <summary>
    /// Логика взаимодействия для MedicalCardEditPage.xaml
    /// </summary>
    public partial class MedicalCardEditPage : Page
    {
        private int _medicalCardId;
        private Doctor _selectedDoctor { get; set; }
        public MedicalCardEditPage(int medicalCardId)
        {
            InitializeComponent();
            _medicalCardId = medicalCardId;
        }
        public MedicalCardEditPage()
        {
            InitializeComponent();
        }

        private async void ButtonAddMedicalCard_Click(object sender, RoutedEventArgs e)
        {
            await ViewTherapeuticModel.PostTherapeuticObject(_medicalCardId, _selectedDoctor.ID, txbAnamnesis.Text, txbSymptoms.Text, txbDiagnos.Text, txbRecomendation.Text, txbReceptionName.Text, txbReceptionDosage.Text, txbReceptionFormat.Text);

            txbAnamnesis.Text = string.Empty;
            txbSymptoms.Text = string.Empty;
            txbDiagnos.Text = string.Empty;
            txbRecomendation.Text = string.Empty;
            txbReceptionName.Text = string.Empty;
            txbReceptionDosage.Text = string.Empty;
            txbReceptionFormat.Text = string.Empty;
        }
        private void ButtonBack_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }

        private async void Page_Loaded(object sender, RoutedEventArgs e)
        {
            await ViewDoctorModel.GetDoctorObject(cmbSelectedDoctor);
        }

        private void cmbSelectedDoctor_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            _selectedDoctor = cmbSelectedDoctor.SelectedItem as Doctor;
        }
    }
}
