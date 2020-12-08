using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace jmcAPI.Model.Application
{
    public class Department
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public Boolean IsActive { get; set; }

    }

    public class Qualification
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public Boolean IsActive { get; set; }
    }

    public class Specialization
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public Boolean IsActive { get; set; }
    }

    public class Doctor
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public DateTime DOB { get; set; }
        public string Gender { get; set; }
        public string Photo { get; set; }
        public string Address { get; set; }
        public Int32 ContactNo { get; set; }
        public Int32 EmergencyNo { get; set; }
        public string Email { get; set; }
        public DateTime DateOfJoining { get; set; }
        public int DepartmentID { get; set; }
        public string RegistrationNo { get; set; }
        public string FacebookID { get; set; }
        public string InstagramID { get; set; }
        public string LinkedinID { get; set; }
        public string TwitterID { get; set; }
        public Boolean IsActive { get; set; }
    }

    public class DoctorSpecialization
    {
        public int Id { get; set; }
        public int SpecializationID { get; set; }
        public int DoctorID { get; set; }
        public Boolean IsActive { get; set; }
    }

    public class DoctorQualification
    {
        public int Id { get; set; }
        public int QualificationID { get; set; }
        public int DoctorID { get; set; }
        public Boolean IsActive { get; set; }
    }

    public class DoctorAchievements
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Thumbnail { get; set; }
        public string Photo { get; set; }
        public int DoctorID { get; set; }
    }

    public class Staff
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public DateTime DOB { get; set; }
        public string Gender { get; set; }
        public string Address { get; set; }
        public string City { get; set; }
        public Int32 ContactNo { get; set; }
        public Int32 AlternateNo { get; set; }
        public string Email { get; set; }
        public DateTime DateOfJoining { get; set; }
        public int StaffID { get; set; }
        public string Password { get; set; }
        public Boolean IsActive { get; set; }
    }

    public class Disease
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public Boolean IsActive { get; set; }
    }

    public class Patient
    {
        public int Id { get; set; }
        public string UHID { get; set; }
        public string Name { get; set; }
        public DateTime DOB { get; set; }
        public string Gender { get; set; }
        public string Address { get; set; }
        public string City { get; set; }
        public Int32 MobileNo { get; set; }
        public Int32 AlternateMobileNo { get; set; }
        public string Remarks { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public Int32 CareTakerMobileNo { get; set; }
        public string CareTakerName { get; set; }
        public DateTime FirstOPDdate { get; set; }
        public Boolean IsActive { get; set; }
    }

    public class PatientDisease
    {
        public int Id { get; set; }
        public int DiseaseID { get; set; }
        public int PatientID { get; set; }
        public Boolean IsActive { get; set; }
    }

    public class OpdPlans
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public Boolean IsActive { get; set; }
    }

    public class TimeSlot
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public DateTime StartTime { get; set; }
        public DateTime EndTime { get; set; }
        public Boolean IsActive { get; set; }
    }

    public class OPD
    {
        public int Id { get; set; }
        public int OpdNo { get; set; }
        public DateTime Date { get; set; }
        public int PatientID { get; set; }
        public int OPDplanID { get; set; }
        public int StaffID { get; set; }
        public int TimeSlotID { get; set; }
        public int DoctorID { get; set; }
        public int PatientDiseaseID { get; set; }
        public DateTime OPDdate { get; set; }
        public Boolean IsActive { get; set; }
    }

    public class Coupons
    {
        public int Id { get; set; }
        public string CouponCode { get; set; }
        public Int32 MobileNo { get; set; }
        public int DoctorID { get; set; }
        public Boolean Status { get; set; }
    }

    public class OpdPayment
    {
        public int Id { get; set; }
        public Int32 Amount { get; set; }
        public string PaymentMode { get; set; }
        public int StaffID { get; set; }
        public int OpdID { get; set; }
        public int CouponID { get; set; }
        public Int32 DiscountAmount { get; set; }
        public Int32 PaymentAmount { get; set; }
        public DateTime PaymentDate { get; set; }

    }
}
