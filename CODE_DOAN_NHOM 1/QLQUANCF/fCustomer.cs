//using DevExpress.DataProcessing;
using QLQUANCF.DAO;
using QLQUANCF.DTO;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QLQUANCF
{
    public partial class fCustomer : Form
    {

        //TableList
        BindingSource CustomerList = new BindingSource();
        public fCustomer()
        {
            InitializeComponent();
            Load();
            LoadBillID();
        }


        #region method
        void Load()
        {
            dtgvCustomer.DataSource = CustomerList;
            LoadListAccount();
            AddCustomerBinding();

        }

        void AddCustomerBinding()
        {
            txbIdBill.DataBindings.Add(new Binding("Text", dtgvCustomer.DataSource, "id", true, DataSourceUpdateMode.Never));
            txbSumBill.DataBindings.Add(new Binding("Text", dtgvCustomer.DataSource, "total", true, DataSourceUpdateMode.Never));
            txbNameCustomer.DataBindings.Add(new Binding("Text", dtgvCustomer.DataSource, "Name", true, DataSourceUpdateMode.Never));
            txbPhoneNumber.DataBindings.Add(new Binding("Text", dtgvCustomer.DataSource, "Phonenumber", true, DataSourceUpdateMode.Never));
            txbCustomerAddress.DataBindings.Add(new Binding("Text", dtgvCustomer.DataSource, "Address", true, DataSourceUpdateMode.Never));
        }


        void LoadListAccount()
        {
            CustomerList.DataSource = CustomerDAO.Instance.GetListCustomer();
        }


        void AddCustomer(int idbill, string namecustomer, string sdt, string diachi)
        {
            string query = ("select * from bill where idbill = " + idbill);
            DataTable data = DataProvider.Instance.ExecuteQuery(query);
            if(data.Rows.Count==0) 
            { 
                MessageBox.Show("mã hóa đơn SAI vui lòng nhập lại ");
                return;
            }

            string query2 = ("select * from customer where idbill = " + idbill);
            DataTable data2 = DataProvider.Instance.ExecuteQuery(query2);
            if (data2.Rows.Count != 0)
            {
                MessageBox.Show("mã hóa đơn đã nhập rồi vui lòng nhập hóa đơn mới !!! ");
                return;
            }

            if (CustomerDAO.Instance.InsertCustomer( idbill , namecustomer , sdt , diachi ))
            {
                MessageBox.Show("Thêm tài khoản thành công !!!");
            }
            else
            {
                MessageBox.Show("ADD ACOUNT FAILSE !!!");
            }
            LoadListAccount();
        }

        void UpdateCustomer(int idnew ,string  namenew , string sdt , string diachi , int idold , string nameold)
        {
            if (CustomerDAO.Instance.UpdateCustomer(idnew, namenew, sdt, diachi, idold, nameold))
            {
                MessageBox.Show(" Sửa tài khoản thành công !!!");
            }
            else
            {
                MessageBox.Show("EDIT ACCOUNT FAILSE !!!");
            }

            LoadListAccount();
        }


        
        void DeleteCustomer(int idbill)
        {
            if (CustomerDAO.Instance.DeleteCustomer(idbill))
            {
                MessageBox.Show(" Xóa tài khoản thành công !!!");
            }
            else
            {
                MessageBox.Show("DELETE ACCOUNT FAILSE !!!");
            }

            LoadListAccount();
        }
        
        //tìm kiếm tên khách
        // trả ra 1 list thức ăn
        List<Customer> SearchCustomerByName (string name)
        {
            List<Customer> Listcustomers = CustomerDAO.Instance.SearchCustomerByName(name) ;

            return Listcustomers;

        }


        //hiển thị danh sách bill
        void LoadBillID ()
        {
            List<Bill> listBillID = BillDAO.Instance.GetListBillToday();
            cbIDBillToday.DataSource = listBillID;

            //cần chỉ cho nó biết trường nào để lấy tên
            cbIDBillToday.DisplayMember = "idbill";
        }

        #endregion

        #region events
        private void btnUpdateCus_Click(object sender, EventArgs e)
        {

            int index = dtgvCustomer.CurrentCell.RowIndex;

            int idold = (int)(dtgvCustomer.Rows[index].Cells[0].Value);
            string nameold = (dtgvCustomer.Rows[index].Cells[1].Value.ToString());

            int idnew = Convert.ToInt32(txbIdBill.Text);
            string namenew = txbNameCustomer.Text;
            string sdt = txbPhoneNumber.Text;
            string diachi = txbCustomerAddress.Text;

            UpdateCustomer(idnew, namenew , sdt , diachi , idold , nameold);
        }

        private void btnAddCus_Click(object sender, EventArgs e)
        {

            int id = Convert.ToInt32(txbIdBill.Text);
            string name = txbNameCustomer.Text;
            string sdt = txbPhoneNumber.Text;
            string diachi = txbCustomerAddress.Text;

            AddCustomer(id, name, sdt, diachi);
        }

        private void btnDeleteCustomer_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(txbIdBill.Text);
            DeleteCustomer(id);
        }

        //tìm kiếm tên khách 
        private void btnViewCus_Click(object sender, EventArgs e)
        {
            CustomerList.DataSource = SearchCustomerByName(txbSearchCus.Text);
        }
        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void account_Click(object sender, EventArgs e)
        {

        }

        private void label1_Click_1(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {

        }




        #endregion

        private void dtgvCustomer_CellClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void label5_Click(object sender, EventArgs e)
        {

        }

        private void cbIDBillToday_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void dtgvCustomer_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void btnFirstBillPage_Click(object sender, EventArgs e)
        {
            txbPageCustomer.Text = "1";
            int page = Convert.ToInt32(txbPageCustomer.Text);
            dtgvCustomer.DataSource = CustomerDAO.Instance.GetListCustomerByPage(page);
        }

        private void btnLastCustomerPage_Click(object sender, EventArgs e)
        {
            int sumRecord = CustomerDAO.Instance.GetNumberIDBill();
            int lastPage = sumRecord / 5;

            if (sumRecord % 5 != 0)
                lastPage ++;

            txbPageCustomer.Text = lastPage.ToString();
        }

        private void txbPageCustomer_TextChanged(object sender, EventArgs e)
        {
            dtgvCustomer.DataSource =  CustomerDAO.Instance.GetListCustomerByPage(Convert.ToInt32(txbPageCustomer.Text));
        }

        private void btnPreviousCustomerPage_Click(object sender, EventArgs e)
        {
            int page = Convert.ToInt32(txbPageCustomer.Text);

            if (page>1)
                page--;

            txbPageCustomer.Text = page.ToString();
        }

        private void btnNextCustomerPage_Click(object sender, EventArgs e)
        {
            int page = Convert.ToInt32(txbPageCustomer.Text);
            int sumRecord = CustomerDAO.Instance.GetNumberIDBill();

            if (page<sumRecord)
                page++;

            txbPageCustomer.Text = page.ToString();
        }
    }
}
