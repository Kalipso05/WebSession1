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
    /// Логика взаимодействия для SchedulePage.xaml
    /// </summary>
    public partial class SchedulePage : Page
    {
        public SchedulePage()
        {
            InitializeComponent();
        }

        private void cmbSelectFilter_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (cmbSelectFilter.SelectedIndex == 0)
            {
                gridFindLastName.Visibility = Visibility.Visible;

                gridFindDate.Visibility = Visibility.Collapsed;
                gridFindSpeciality.Visibility = Visibility.Collapsed;
            }
            else if (cmbSelectFilter.SelectedIndex == 1)
            {
                gridFindLastName.Visibility = Visibility.Collapsed;

                gridFindDate.Visibility = Visibility.Visible;
                gridFindSpeciality.Visibility = Visibility.Collapsed;
            }
            else if (cmbSelectFilter.SelectedIndex == 2)
            {
                gridFindLastName.Visibility = Visibility.Collapsed;

                gridFindDate.Visibility = Visibility.Collapsed;
                gridFindSpeciality.Visibility = Visibility.Visible;
            }
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            cmbSelectFilter.ItemsSource = new List<string>()
            {
                "По фамилия врача",
                "По периодам дат",
                "По специальностям"
            };
        }
    }
}
