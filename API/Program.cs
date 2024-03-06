using API.Request;
using API.Settings;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace API
{
    internal class Program
    {
        internal static async Task RouteRequest(HttpListenerResponse response, HttpListenerRequest request)
        {
            var path = request.Url.AbsolutePath;
            var method = request.HttpMethod;

            if(path.StartsWith("/api/Patient"))
            {
                switch (method)
                {
                    case "POST":
                        await PatientRequest.HandlePostPatient(response, request);
                        break;
                    case "GET":
                        await PatientRequest.HandleGetPatient(response, request);
                        break;
                }
            }
            else if(path.StartsWith("/api/Hospitalization"))
            {
                switch (method)
                {
                    case "POST":
                        await HospitalizationRequest.HandlePostHospitalization(response, request);
                        break;
                }
            }
            else if(path.StartsWith("/api/Doctors"))
            {
                switch(method)
                {
                    case "GET":
                        await DoctorRequest.HandleGetDoctor(response, request);
                        break;
                }
            }
            else if (path.StartsWith("/api/Therapeutic"))
            {
                switch (method)
                {
                    case "POST":
                        await TheraeuticRequest.HandlePostTherapeutic(response, request);
                        break;
                }
            }

            response.Close();
        }

        private static async Task StartServer()
        {
            HttpListener listener = new HttpListener();
            listener.Prefixes.Add("http://localhost:8080/api/");
            listener.Start();
            Logger.Log("Сервер успешно запушен");

            while (true)
            {
                var context = await listener.GetContextAsync();
                await RouteRequest(context.Response, context.Request);
            }
        }

        static void Main(string[] args)
        {
            Task.Run(()=> StartServer()).GetAwaiter().GetResult();
        }
    }
}
