using QLQUANCF.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QLQUANCF.DAO
{
    public class CustomerDAO
    {
        //TẠO SINGLETON
        private static CustomerDAO instance;

        public static CustomerDAO Instance
        {
            get { if (instance == null) instance = new CustomerDAO(); return instance; }
            private set { CustomerDAO.instance = value; }
        }

        private CustomerDAO() { }

        //
        public List<Customer> GetCustomerByIDBill(int id)
        {
            List<Customer> list = new List<Customer>();

            string query = "select * from Customer where IDBill = " + id;

            DataTable data = DataProvider.Instance.ExecuteQuery(query);

            foreach (DataRow item in data.Rows)
            {
                Customer customer = new Customer(item);
                list.Add(customer);
            }

            return list;
        }


        //HIỂN THỊ DS THỨC ĂN FCUSTOMER

        public List<Customer> GetListCustomer()
        {
            List<Customer> list = new List<Customer>();

            string query = "select * from Customer ";

            DataTable data = DataProvider.Instance.ExecuteQuery(query);

            foreach (DataRow item in data.Rows)
            {
                Customer customer = new Customer(item);
                list.Add(customer);
            }

            return list;
        }


        //THÊM XÓA SỬA KHÁCH
        public bool InsertCustomer(int idbill , string namecustomer , string sdt , string diachi)
        {
          
            string query = string.Format("EXEC INSERT_CUSTOMER  {0},N'{1}','{2}',N'{3}'", idbill, namecustomer , sdt , diachi );//*** string.Format
            int result = DataProvider.Instance.ExecuteNonQuery(query);
            return result > 0;
        }

        public bool UpdateCustomer(int idbillnew, string namecustomernew, string sdt, string diachi , int idbillold, string namecustomerold)
        {
            //string query = string.Format("update ACCOUNT SET DISPLAYNAME = N'{1}' , TYPE ={2} WHERE USERNAME = N'{0}' ", name, displayName, type);

            string query = string.Format("UPDATE CUSTOMER SET IDBILL = {0}, NAMECUSTOMER = N'{1}' , SDT = '{2}' , DIACHI = N'{3}' WHERE NAMECUSTOMER = N'{4}' AND IDBILL = {5} " , idbillnew , namecustomernew, sdt , diachi , namecustomerold, idbillold );

            //string query = string.Format("UPDATE CUSTOMER SET IDBILL = 52, NAMECUSTOMER = N'ĐẠT' , SDT = '0384877304' , DIACHI = N'HCM' WHERE NAMECUSTOMER = N'NHIEN' AND IDBILL = 52");

            int result = DataProvider.Instance.ExecuteNonQuery(query); ;
            return result > 0;
        }

        
        public bool DeleteCustomer(int idbill)
        {


            string query = string.Format("DELETE CUSTOMER WHERE IDBILL = N'{0}'", idbill);
            int result = DataProvider.Instance.ExecuteNonQuery(query);

            return result > 0;
        }


        //tìm tên khách
        public List<Customer> SearchCustomerByName(string name)
        {
            List<Customer> list = new List<Customer>();

            string query = string.Format("SELECT * FROM CUSTOMER WHERE dbo.fuConvertToUnsign1(NAMECUSTOMER) LIKE N'%' + dbo.fuConvertToUnsign1(N'{0}') + '%'", name);

            DataTable data = DataProvider.Instance.ExecuteQuery(query);

            foreach (DataRow item in data.Rows)
            {
                Customer customer = new Customer(item);
                list.Add(customer);
            }

            return list;
        }

        //phân trang
        public DataTable GetListCustomerByPage (int pagenum)
        {
            return DataProvider.Instance.ExecuteQuery ("EXEC USP_GetListCustomerByPage @pagenum" , new object[] { pagenum });
        }

        public int GetNumberIDBill()
        {
            return (int)DataProvider.Instance.ExecuteScalar("EXEC USP_GetNumIDBill");
        }
    }
}
