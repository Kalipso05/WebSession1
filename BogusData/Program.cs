using Bogus;
using DataCenter.Model;
using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BogusData
{
    internal class Program
    {
        static void Main(string[] args)
        {
            using (var db = new dbModel())
            {
                var genderOptions = new[] { "Мужской", "Женский" };
                var passportSeries = new[] { "4506", "4604", "4703", "4802" };
                var workPlaces = new[] { "ИП Иванов", "ОАО СтройГаз", "ЗАО НаноТех" };

                var diagnoses = new[] { "ОРВИ", "Ангина", "Аллергия", "COVID19" };

                var genders = new Faker<Gender>()
                    .RuleFor(g => g.Title, i => i.PickRandom(genderOptions))
                    .Generate(2);
                db.Gender.AddRange(genders);
                db.SaveChanges();

                var passports = new Faker<Passport>()
                    .RuleFor(p => p.SeriesPassport, f => f.PickRandom(passportSeries))
                    .RuleFor(p => p.NumberPassport, f => f.Random.Number(100000, 999999).ToString())
                    .Generate(100);
                db.Passport.AddRange(passports);
                db.SaveChanges();

                var medicalCards = new Faker<MedicalCard>()
                    .RuleFor(m => m.Number, f => $"MC-{f.Random.Hexadecimal(8)}")
                    .RuleFor(m => m.DateOfIssue, f => f.Date.Past(10))
                    .RuleFor(m => m.DateOfLastApeal, f => f.Date.Past(2))
                    .RuleFor(m => m.DateOfNextApeal, f => f.Date.Past(30))
                    .RuleFor(m => m.IdentificationCode, f => f.Random.Number(100000, 999999).ToString())
                    .Generate(100);
                db.MedicalCard.AddRange(medicalCards);
                db.SaveChanges();

                var insuransePolicies = new Faker<InsuransePolicy>()
                    .RuleFor(i => i.Number, f => $"IP-{f.Random.Hexadecimal(8)}")
                    .RuleFor(i => i.DateOfExpiration, f => f.Date.Future(1))
                    .Generate(100);
                db.InsuransePolicy.AddRange(insuransePolicies);
                db.SaveChanges();

                var insuranseCompanyFaker = new Faker<InsuranseCompany>()
                    .RuleFor(i => i.Title, f => f.Company.CompanyName());
                var insuranseCompanies = insuranseCompanyFaker.Generate(10);
                db.InsuranseCompany.AddRange(insuranseCompanies);
                db.SaveChanges();
                var insuranseCompaniesIds = db.InsuranseCompany.Select(ic => ic.ID).ToList();

                var patientGenerator = new Faker<Patient>("ru")
                    .RuleFor(u => u.Phone, f => f.Image.LoremFlickrUrl())
                    .RuleFor(u => u.FirstName, f => f.Name.FirstName())
                    .RuleFor(u => u.LastName, f => f.Name.LastName())
                    .RuleFor(u => u.Gender, f => f.PickRandom(genders))
                    .RuleFor(u => u.Patronymic, (f, u) =>
                    {
                        var maleMiddleNames = new[] { "Александрович", "Дмитриевич", "Максимович", "Петрович" };
                        var femaleMiddleNames = new[] { "Александрова", "Дмитриевна", "Максимовна", "Петровна" };
                        return u.Gender.Title == "Мужской" ? f.PickRandom(maleMiddleNames) : f.PickRandom(femaleMiddleNames);

                    })

                    .RuleFor(u => u.DateOfBirth, f => f.Date.Past(80, DateTime.Today.AddYears(-18)))
                    .RuleFor(u => u.Adress, f => f.Address.FullAddress())
                    .RuleFor(u => u.Phone, f => f.Phone.PhoneNumber())
                    .RuleFor(u => u.Email, f => f.Internet.Email())
                    .RuleFor(u => u.WorkPlace, f => f.PickRandom(workPlaces))
                    .RuleFor(u => u.Diagnos, f => f.PickRandom(diagnoses))
                    .RuleFor(u => u.IDGender, f => f.PickRandom(genders).ID)
                    .RuleFor(u => u.IDPassport, (f, u) => passports[f.IndexFaker % passports.Count].ID)
                    .RuleFor(u => u.IDMedicalCard, (f, u) => medicalCards[f.IndexFaker % medicalCards.Count].ID)
                    .RuleFor(u => u.IDInsuransePolicy, (f, u) => insuransePolicies[f.IndexFaker % insuransePolicies.Count].ID)
                    .RuleFor(u => u.IDInsuranseCompany, f => f.PickRandom(insuranseCompaniesIds));

                var patients = patientGenerator.Generate(100);
                db.Patient.AddRange(patients);
                db.SaveChanges();

                Console.WriteLine("Генерация завершена");
            }
        }
    }
}
