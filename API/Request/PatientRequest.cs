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
    internal class PatientRequest
    {
        internal static async Task HandleGetPatient(HttpListenerResponse response, HttpListenerRequest request)
        {
            try
            {
                using (var db = new dbModel())
                {
                    var patient = db.Patient.ToList();
                    var settings = new JsonSerializerSettings()
                    {
                        ReferenceLoopHandling = ReferenceLoopHandling.Ignore,
                    };
                    await Response.SendResponse(response, JsonConvert.SerializeObject(patient, settings));
                    Logger.Log("GET запрос на получение пациентов выполнен");
                }
            }
            catch (Exception e)
            {
                Logger.Log($"Ошибка: {e.Message}", HttpStatusCode.BadRequest, ConsoleColor.DarkRed);
            }
        }

        internal static async Task HandlePostPatient(HttpListenerResponse response, HttpListenerRequest request)
        {
            try
            {
                string contentType;
                using (var reader = new StreamReader(request.InputStream, request.ContentEncoding))
                {
                    contentType = await reader.ReadToEndAsync();
                }
                var patientData = JsonConvert.DeserializeObject<PatientData>(contentType);

                if(patientData == null )
                {
                    await Response.SendResponse(response, "Были переданы неверные данные", code: HttpStatusCode.BadRequest);
                    Logger.Log("При POST запросе были переданы неверные данные", HttpStatusCode.BadRequest, ConsoleColor.DarkRed);
                    return;
                }

                using (var db = new dbModel())
                {
                    using(var transaction = db.Database.BeginTransaction())
                    {
                        try
                        {
                            if (patientData.Passport != null)
                            {
                                db.Passport.Add(patientData.Passport);
                                await db.SaveChangesAsync();
                            }
                            if(patientData.MedicalCard != null)
                            {
                                db.MedicalCard.Add(patientData.MedicalCard);
                                await db.SaveChangesAsync();
                            }
                            if (patientData.InsuransePolicy != null)
                            {
                                db.InsuransePolicy.Add(patientData.InsuransePolicy);
                                await db.SaveChangesAsync();
                            }
                            if (patientData.InsuranseCompany != null)
                            {
                                db.InsuranseCompany.Add(patientData.InsuranseCompany);
                                await db.SaveChangesAsync();
                            }
                            if (patientData.Patient != null)
                            {
                                patientData.Patient.IDPassport = patientData.Passport.ID;
                                patientData.Patient.IDMedicalCard = patientData.MedicalCard.ID;
                                patientData.Patient.IDInsuransePolicy = patientData.InsuransePolicy.ID;
                                patientData.Patient.IDInsuranseCompany = patientData.InsuranseCompany.ID;

                                db.Patient.Add(patientData.Patient);
                                await db.SaveChangesAsync();
                            }
                            transaction.Commit();
                            await Response.SendResponse(response, "Данные пациента были добавлены", code: HttpStatusCode.OK);
                            Logger.Log("POST запрос на добавление данных пациента выполнен");
                        }
                        catch (Exception ex)
                        {
                            transaction.Rollback();
                            await Response.SendResponse(response, "Произошла внутренняя ошибка сервера", code: HttpStatusCode.InternalServerError);
                            Logger.Log($"Ошибка: {ex.Message}", HttpStatusCode.InternalServerError, ConsoleColor.DarkRed);
                        }
                    }
                }
            }
            catch(Exception e)
            {
                Logger.Log($"Ошибка: {e.Message}", HttpStatusCode.BadRequest, ConsoleColor.DarkRed);
            }
        }
    }
}
