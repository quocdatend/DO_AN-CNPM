using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QLQUANCF
{
    public partial class fTimekeeping : Form
    {
        public fTimekeeping()
        {
            InitializeComponent();
        }

        string constr = "Data Source=.\\MSSQLSERVER2012;Initial Catalog=QuanLyQuanCafe;Integrated Security=True";

        private void showAttendance()
        {
            SqlConnection conn = new SqlConnection(constr);
            SqlDataAdapter da = new SqlDataAdapter();
            DataTable dt = new DataTable();
            try
            {
                string userName = Properties.Settings.Default.username;
                conn.Open();
                SqlCommand cmd = new SqlCommand();
                da.SelectCommand = cmd;
                da.SelectCommand.CommandText = "SP_ViewAttendanceForStaff";
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                SqlParameter param1 = new SqlParameter
                {
                    ParameterName = "@USERNAME",
                    SqlDbType = SqlDbType.NVarChar,
                    Value = userName,
                    Direction = ParameterDirection.Input,

                };
                cmd.Parameters.Add(param1);
                da.SelectCommand.Connection = conn;
                da.Fill(dt);
                dataGridView1.DataSource = dt;
                conn.Close();
                dataGridView1.Columns[0].Width = 150;
                dataGridView1.Columns[0].HeaderText = "Tên Người Dùng";
                dataGridView1.Columns[1].Width = 120;
                dataGridView1.Columns[1].HeaderText = "Ngày Tính Lương";
                dataGridView1.Columns[2].Width = 120;
                dataGridView1.Columns[2].HeaderText = "Vắng";
                dataGridView1.Columns[3].Width = 120;
                dataGridView1.Columns[3].HeaderText = "Có mặc";
                dataGridView1.Columns[4].Width = 120;
                dataGridView1.Columns[4].HeaderText = "Ngày Điểm Danh";
                dataGridView1.RowHeadersVisible = false;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void showSalary()
        {
            SqlConnection conn = new SqlConnection(constr);
            SqlDataAdapter da = new SqlDataAdapter();
            DataTable dt = new DataTable();
            try
            {
                string userName = Properties.Settings.Default.username;
                conn.Open();
                SqlCommand cmd = new SqlCommand();
                da.SelectCommand = cmd;
                da.SelectCommand.CommandText = "SP_viewSalary";
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                SqlParameter param1 = new SqlParameter
                {
                    ParameterName = "@USERNAME",
                    SqlDbType = SqlDbType.NVarChar,
                    Value = userName,
                    Direction = ParameterDirection.Input,

                };
                cmd.Parameters.Add(param1);
                da.SelectCommand.Connection = conn;
                da.Fill(dt);
                dataGridView1.DataSource = dt;
                conn.Close();
                dataGridView1.RowHeadersVisible = false;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void btnInfoTimekeeping_Click(object sender, EventArgs e)
        {
            showAttendance();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void btnInfoSalary_Click(object sender, EventArgs e)
        {
            showSalary();
        }

        //private void cbTimekeeping_FocusEnter(object sender, EventArgs e)
        private void cbTimekeeping_FocusEnter(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(constr);
            SqlDataAdapter da = new SqlDataAdapter();
            DataTable dt = new DataTable();
            try
            {
                string userName = Properties.Settings.Default.username;
                conn.Open();
                SqlCommand cmd = new SqlCommand();
                da.SelectCommand = cmd;
                da.SelectCommand.CommandText = "SP_addAttendanceByStaff";
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                SqlParameter param1 = new SqlParameter
                {
                    ParameterName = "@USERNAME",
                    SqlDbType = SqlDbType.NVarChar,
                    Value = userName,
                    Direction = ParameterDirection.Input,

                };
                cmd.Parameters.Add(param1);
                da.SelectCommand.Connection = conn;
                da.Fill(dt);
                dataGridView1.DataSource = dt;
                conn.Close();
                dataGridView1.RowHeadersVisible = false;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Bạn đã điểm danh cho ngày hôm nay", "Thông báo");
                //MessageBox.Show(ex.Message);
            }
        }
        void showInfoMsgSql(object sender, SqlInfoMessageEventArgs e)
        {
            MessageBox.Show(e.Message);
        }
    }
}
