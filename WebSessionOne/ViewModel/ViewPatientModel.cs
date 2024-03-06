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
    public class ViewPatientModel
    {
        internal static async Task PostPatientObject(string firstname, string lastname, string patronymic, string passSeries, string passNumber, string workPlace,
        string insuransePolicyNumber, string insuransePolicyExpiration, string insuranseCompany, string medicalCardNumber, string medicalCardCode)
        {
            var patientData = new
            {
                MedicalCard = new { Number = medicalCardNumber, IdentificationCode = medicalCardCode },
                Passport = new {SeriesPassport = passSeries, NumberPassport =  passNumber},
                InsuransePolicy = new {Number = insuransePolicyNumber, DateOfExpiration = DateTime.Parse(insuransePolicyExpiration)},
                InsuranseCompany = new {Title = insuranseCompany},
                Patient = new
                {
                    FirstName = firstname,
                    LastName = lastname,
                    Patronymic = patronymic,
                    WorkPlace = workPlace,
                }
            };

            var json = JsonConvert.SerializeObject(patientData);
            var content = new StringContent(json, Encoding.UTF8, "application/json");

            using(var client =  new HttpClient())
            {
                var response = await client.PostAsync("http://localhost:8080/api/Patient", content);
            }
        }
    }
}