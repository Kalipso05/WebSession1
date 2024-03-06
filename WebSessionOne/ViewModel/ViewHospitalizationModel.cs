using DataCenter.Model;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace WebSessionOne.ViewModel
{
    public class ViewHospitalizationModel
    {
        internal static async Task PostHospitalizationObject(int patientID, string dateOfHospitalization, string timeOfHospitalization)
        {
            var hospitalization = new Hospitalization()
            {
                IDPatient = patientID,
                DateOfHospitalization = DateTime.Parse(dateOfHospitalization),
                TimeOfHospitalization = TimeSpan.Parse(timeOfHospitalization)

            };

            var json = JsonConvert.SerializeObject(hospitalization);
            var content = new StringContent(json, Encoding.UTF8, "application/json");

            using(var client =  new HttpClient())
            {
                var response = await client.PostAsync("http://localhost:8080/api/Hospitalization", content);
            }
        }
    }
}