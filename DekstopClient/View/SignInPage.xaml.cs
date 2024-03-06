using DataCenter.Model;
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
    /// Логика взаимодействия для SignInPage.xaml
    /// </summary>
    public partial class SignInPage : Page
    {
        public SignInPage()
        {
            InitializeComponent();
        }

        private void ButtonSignIn_Click(object sender, RoutedEventArgs e)
        {
            using (var db = new dbModel())
            {
                var doctor = db.Doctor.Where(item => item.Login == txbLogin.Text).FirstOrDefault();

                if (doctor == null)
                {
                    MessageBox.Show("Аккаунт с таким логином отсуствует в БД");
                    txbLogin.Text = string.Empty;
                    txbPasssword.Text = string.Empty;
                    return;
                }
                if (txbPasssword.Text == doctor.Password)
                {
                    MessageBox.Show("Вход успешен");
                    NavigationService.Navigate(new View.NavigationPage());
                }
                else
                {
                    MessageBox.Show("Пароль введен неверно!");
                    txbPasssword.Text = string.Empty;
                }
            }
        }
    }
}
