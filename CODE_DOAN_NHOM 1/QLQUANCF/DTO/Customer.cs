//using DevExpress.XtraReports.UI.CrossTab;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QLQUANCF.DTO
{
    public class Customer
    {
        public Customer(int id , int total , string name , string phonenumber , string address ) 
        { 
            this.id = id;
            this.Total = total;
            this.name = name;
            this.phonenumber = phonenumber;
            this.address = address;
        }

        public Customer(DataRow row)
        {
            this.id = (int)row["IDBILL"];
            this.Total = (int)row["TOTALBILL"];
            this.name = row["NAMECUSTOMER"].ToString();
            this.phonenumber = row["SDT"].ToString();
            this.address = row["DIACHI"].ToString();
        }


        private int id;
        private int total;
        private string name;
        private string phonenumber;
        private string address;
        

        public int Id { get => id; set => id = value; }
        public string Name { get => name; set => name = value; }
        public string Phonenumber { get => phonenumber; set => phonenumber = value; }
        public string Address { get => address; set => address = value; }
        public int Total { get => total; set => total = value; }
    }
}
