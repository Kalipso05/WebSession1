using DataCenter.Model;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace DekstopClient.ViewModel
{
    internal class ViewTherapeuticModel
    {
        internal static async Task PostTherapeuticObject(int medicalCardId, int doctorId, string anamnesis, string symptoms, string diagnos, string recomendation, string medicine, string dosage, string administartion)
        {
            var therapeuticData = new TherapeuticData()
            {
                Referrals = new Referrals { IDMedicalCard = medicalCardId, IDDoctor = doctorId, CreationDate = DateTime.Now, Anamnesis = anamnesis, Symptoms = symptoms, Diagnosis = diagnos, Recommendations = recomendation },
                Prescription = new Prescription { IDMedicalCard = medicalCardId, Medicine = medicine, Dosage = dosage, Administration = administartion}
            };
            var content = new StringContent(JsonConvert.SerializeObject(therapeuticData), Encoding.UTF8, "application/json");

            using (var client = new HttpClient())
            {
                var response = await client.PostAsync("http://localhost:8080/api/Therapeutic", content);
                if(response.IsSuccessStatusCode)
                {
                    MessageBox.Show("Данные мед.карты обновлены");
                }
                else
                {
                    MessageBox.Show(response.Content.ToString());
                }
            }
        }
    }
}
