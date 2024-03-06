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
    /// Логика взаимодействия для PatientListPage.xaml
    /// </summary>
    public partial class PatientListPage : Page
    {
        private Patient _selectedPatient {  get; set; }
        public PatientListPage()
        {
            InitializeComponent();
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            using (var db = new dbModel())
            {
                var patient = db.Patient.ToList();

                listView.ItemsSource = patient;
            }
        }

        private void ButtonEditMedicalCard_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new View.MedicalCardEditPage(_selectedPatient.IDMedicalCard));
        }

        private void listView_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            _selectedPatient = listView.SelectedItem as Patient;
        }
    }
}
