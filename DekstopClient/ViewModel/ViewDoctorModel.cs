using DataCenter.Model;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;

namespace DekstopClient.ViewModel
{
    internal class ViewDoctorModel
    {
        private static HttpClient _httpClient = new HttpClient();
        private static ObservableCollection<Doctor> doctorsList = new ObservableCollection<Doctor>();
        internal static async Task GetDoctorObject(ComboBox comboBox)
        {
            try
            {
                var response = await _httpClient.GetAsync("http://localhost:8080/api/Doctors");
                var contentBody = await response.Content.ReadAsStringAsync();
                var doctors = JsonConvert.DeserializeObject<List<Doctor>>(contentBody);

                doctorsList.Clear();
                comboBox.Items.Clear();
                foreach (var doctor in doctors)
                {
                    doctorsList.Add(doctor);
                }
                comboBox.ItemsSource = doctorsList;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }
}
