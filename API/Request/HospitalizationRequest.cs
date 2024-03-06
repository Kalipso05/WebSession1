using API.Settings;
using DataCenter.Model;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace API.Request
{
    internal class HospitalizationRequest
    {
        internal static async Task HandlePostHospitalization(HttpListenerResponse response, HttpListenerRequest request)
        {
            try
            {
                string contentType;
                using (var reader = new StreamReader(request.InputStream, request.ContentEncoding))
                {
                    contentType = await reader.ReadToEndAsync();
                }
                var hospitalizationData = JsonConvert.DeserializeObject<Hospitalization>(contentType);

                if (hospitalizationData == null)
                {
                    await Response.SendResponse(response, "Были переданы неверные данные", code: HttpStatusCode.BadRequest);
                    Logger.Log("При POST запросе были переданы неверные данные", HttpStatusCode.BadRequest, ConsoleColor.DarkRed);
                    return;
                }

                using (var db = new dbModel())
                {
                    db.Hospitalization.Add(hospitalizationData);
                    await db.SaveChangesAsync();
                    await Response.SendResponse(response, "Данные госпитализации были добавлены", code: HttpStatusCode.OK);
                    Logger.Log("POST запрос на добавление данных госпитализации выполнен");
                }
            }
            catch (Exception e)
            {
                Logger.Log($"Ошибка: {e.Message}", HttpStatusCode.BadRequest, ConsoleColor.DarkRed);
            }
        }
    }
}
