using API.Settings;
using DataCenter.Model;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace API.Request
{
    internal class DoctorRequest
    {
        internal static async Task HandleGetDoctor(HttpListenerResponse response, HttpListenerRequest request)
        {
            try
            {
                using (var db = new dbModel())
                {
                    var doctor = await db.Doctor.ToListAsync();
                    var settings = new JsonSerializerSettings()
                    {
                        ReferenceLoopHandling = ReferenceLoopHandling.Ignore,
                    };
                    await Response.SendResponse(response, JsonConvert.SerializeObject(doctor, settings));
                    Logger.Log("GET запрос на получение докторов выполнен");
                }
            }
            catch (Exception e)
            {
                Logger.Log($"Ошибка: {e.Message}", HttpStatusCode.BadRequest, ConsoleColor.DarkRed);
            }
        }
    }
}
