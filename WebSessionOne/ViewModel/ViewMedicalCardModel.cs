using DataCenter.Model;
using Microsoft.Win32;
using Newtonsoft.Json;
using QRCoder;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Windows.Media.Imaging;

namespace WebSessionOne.ViewModel
{
    public class ViewMedicalCardModel
    {
        public string FilePath { get; set; }
        public BitmapImage image {  get; set; }

        public string code { get; set; }

        //public async Task<HttpResponseMessage> SendDataToServer(MedicalCard medicalCard)
        //{
        //    using (var client = new HttpClient())
        //    {
        //        var json = JsonConvert.SerializeObject(medicalCard);
        //        var content = new StringContent(json, Encoding.UTF8, "application/json");
        //        var response = await client.PostAsync("http://localhost:8080/api/MedicalCard", content);
        //        return response;

        //    }
        //}

        //public async Task<bool> TryAddUniqueMedicalCardAsync(string number)
        //{
        //    bool isUnique = false;
        //    HttpResponseMessage response;

        //    do
        //    {
        //        code = GenerateCode();
        //        image = GenerateQRCode(code);
        //        string fileName = $"{code}.png";
        //        var medicalCard = new MedicalCard()
        //        {
        //            Number = number,
        //            IdentificationCode = code,
        //            PathQRCode = fileName
        //        };
        //        response = await SendDataToServer(medicalCard);

        //        if (response.IsSuccessStatusCode)
        //        {
        //            isUnique = true;
        //        }
        //        else if (response.StatusCode == System.Net.HttpStatusCode.Conflict)
        //        {
        //            File.Delete(FilePath);
        //        }
        //    } while (!isUnique);

        //    return isUnique;
        //}

        public string GenerateCode()
        {
            var random = new Random();
            return random.Next(100000, 999999).ToString();
        }
        public BitmapImage GenerateQRCode(string code)
        {
            using(var qrGenerator = new QRCodeGenerator())
            using(var qrCodeData = qrGenerator.CreateQrCode(code, QRCodeGenerator.ECCLevel.Q))
            using(var qrCode = new QRCode(qrCodeData))
            using(var qrCodeImage = qrCode.GetGraphic(20))
            using (var ms = new MemoryStream())
            {
                qrCodeImage.Save(ms, System.Drawing.Imaging.ImageFormat.Png);
                ms.Position = 0;

                BitmapImage bitmapImage = new BitmapImage();
                bitmapImage.BeginInit();
                bitmapImage.CacheOption = BitmapCacheOption.OnLoad;
                bitmapImage.StreamSource = ms;
                bitmapImage.EndInit();
                bitmapImage.Freeze();
                return bitmapImage;
            }

        }
        public void SaveQRCodeToFile(BitmapImage qrImage, string fileName)
        {
            SaveFileDialog saveFileDialog = new SaveFileDialog()
            {
                Filter = "PNG Files (*png)|*.png",
                DefaultExt = "png",
                AddExtension = true,
                FileName = fileName
            };
            if (saveFileDialog.ShowDialog() == true)
            {
                FilePath = saveFileDialog.FileName;
                using (var fileStream = new FileStream(FilePath, FileMode.Create))
                {
                    BitmapEncoder encoder = new PngBitmapEncoder();
                    encoder.Frames.Add(BitmapFrame.Create(qrImage));
                    encoder.Save(fileStream);
                }
            }
        }
    }
}