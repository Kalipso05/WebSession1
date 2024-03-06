using DataCenter.Model;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;

namespace DekstopClient.ViewModel
{
    internal class ViewPatientModel
    {
        public static HttpClient client = new HttpClient();
        public static ObservableCollection<Patient> patientsList = new ObservableCollection<Patient>();
        internal static async Task GetPatientObject(ListView listView)
        {
            var response = await client.GetAsync("http://localhost:8080/api/Patient");

            var contentBody = await response.Content.ReadAsStringAsync();

            var patient = JsonConvert.DeserializeObject<List<Patient>>(contentBody);

            listView.Items.Clear();
            foreach (var items in patient)
            {
                patientsList.Add(items);
            }
            listView.ItemsSource = patientsList;
        }
    }
}
