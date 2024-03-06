using API.Settings;
using DataCenter.Model;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mime;
using System.Text;
using System.Threading.Tasks;

namespace API.Request
{
    internal class TheraeuticRequest
    {
        internal static async Task HandlePostTherapeutic(HttpListenerResponse response, HttpListenerRequest request)
        {
            try
            {
                string contentBody;
                using (var reader = new StreamReader(request.InputStream, request.ContentEncoding))
                {
                    contentBody = await reader.ReadToEndAsync();
                }
                var therapeuticData = JsonConvert.DeserializeObject<TherapeuticData>(contentBody);

                if (therapeuticData == null)
                {
                    await Response.SendResponse(response, "Были переданы неверные данные", code: HttpStatusCode.BadRequest);
                    Logger.Log("При POST запросе были переданы неверные данные", HttpStatusCode.BadRequest, ConsoleColor.DarkRed);
                    return;
                }

                using (var db = new dbModel())
                {
                    if (therapeuticData.Referrals != null && therapeuticData.Prescription != null)
                    {
                        db.Referrals.Add(therapeuticData.Referrals);
                        await db.SaveChangesAsync();
                        db.Prescription.Add(therapeuticData.Prescription);
                        await db.SaveChangesAsync();
                        await Response.SendResponse(response, "Данные мед.карты пациента были обновлены", code: HttpStatusCode.OK);
                        Logger.Log("POST запрос на обновление данных мед.карты пациента выполнен");
                    }
                }
            }
            catch (Exception e)
            {
                Logger.Log($"Ошибка: {e.Message}", HttpStatusCode.BadRequest, ConsoleColor.DarkRed);
            }
        }
    }
}
