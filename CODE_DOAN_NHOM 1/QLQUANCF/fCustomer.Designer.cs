namespace QLQUANCF
{
    partial class fCustomer
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.txbNameCustomer = new System.Windows.Forms.TextBox();
            this.account = new System.Windows.Forms.Label();
            this.panel1 = new System.Windows.Forms.Panel();
            this.txbPageCustomer = new System.Windows.Forms.TextBox();
            this.btnNextCustomerPage = new System.Windows.Forms.Button();
            this.btnPreviousCustomerPage = new System.Windows.Forms.Button();
            this.btnLastCustomerPage = new System.Windows.Forms.Button();
            this.btnFirstCustomerPage = new System.Windows.Forms.Button();
            this.cbIDBillToday = new System.Windows.Forms.ComboBox();
            this.label5 = new System.Windows.Forms.Label();
            this.btnUpdateCus = new System.Windows.Forms.Button();
            this.btnDeleteCustomer = new System.Windows.Forms.Button();
            this.btnAddCus = new System.Windows.Forms.Button();
            this.txbSearchCus = new System.Windows.Forms.TextBox();
            this.btnSearchCus = new System.Windows.Forms.Button();
            this.txbSumBill = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.txbCustomerAddress = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.txbPhoneNumber = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.txbIdBill = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.dtgvCustomer = new System.Windows.Forms.DataGridView();
            this.panel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dtgvCustomer)).BeginInit();
            this.SuspendLayout();
            // 
            // txbNameCustomer
            // 
            this.txbNameCustomer.Location = new System.Drawing.Point(414, 233);
            this.txbNameCustomer.Name = "txbNameCustomer";
            this.txbNameCustomer.Size = new System.Drawing.Size(345, 27);
            this.txbNameCustomer.TabIndex = 0;
            // 
            // account
            // 
            this.account.AutoSize = true;
            this.account.BackColor = System.Drawing.Color.White;
            this.account.Font = new System.Drawing.Font("Arial", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.account.Location = new System.Drawing.Point(414, 196);
            this.account.Name = "account";
            this.account.Size = new System.Drawing.Size(180, 24);
            this.account.TabIndex = 2;
            this.account.Text = "Tên Khách Hàng :";
            this.account.Click += new System.EventHandler(this.account_Click);
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.txbPageCustomer);
            this.panel1.Controls.Add(this.btnNextCustomerPage);
            this.panel1.Controls.Add(this.btnPreviousCustomerPage);
            this.panel1.Controls.Add(this.btnLastCustomerPage);
            this.panel1.Controls.Add(this.btnFirstCustomerPage);
            this.panel1.Controls.Add(this.cbIDBillToday);
            this.panel1.Controls.Add(this.label5);
            this.panel1.Controls.Add(this.btnUpdateCus);
            this.panel1.Controls.Add(this.btnDeleteCustomer);
            this.panel1.Controls.Add(this.btnAddCus);
            this.panel1.Controls.Add(this.txbSearchCus);
            this.panel1.Controls.Add(this.btnSearchCus);
            this.panel1.Controls.Add(this.txbSumBill);
            this.panel1.Controls.Add(this.label4);
            this.panel1.Controls.Add(this.txbCustomerAddress);
            this.panel1.Controls.Add(this.label3);
            this.panel1.Controls.Add(this.txbPhoneNumber);
            this.panel1.Controls.Add(this.label2);
            this.panel1.Controls.Add(this.txbIdBill);
            this.panel1.Controls.Add(this.label1);
            this.panel1.Controls.Add(this.dtgvCustomer);
            this.panel1.Controls.Add(this.account);
            this.panel1.Controls.Add(this.txbNameCustomer);
            this.panel1.Location = new System.Drawing.Point(12, 12);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(776, 426);
            this.panel1.TabIndex = 3;
            // 
            // txbPageCustomer
            // 
            this.txbPageCustomer.Location = new System.Drawing.Point(348, 394);
            this.txbPageCustomer.Name = "txbPageCustomer";
            this.txbPageCustomer.ReadOnly = true;
            this.txbPageCustomer.Size = new System.Drawing.Size(125, 27);
            this.txbPageCustomer.TabIndex = 22;
            this.txbPageCustomer.Text = "1";
            this.txbPageCustomer.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            this.txbPageCustomer.TextChanged += new System.EventHandler(this.txbPageCustomer_TextChanged);
            // 
            // btnNextCustomerPage
            // 
            this.btnNextCustomerPage.Location = new System.Drawing.Point(579, 394);
            this.btnNextCustomerPage.Name = "btnNextCustomerPage";
            this.btnNextCustomerPage.Size = new System.Drawing.Size(94, 29);
            this.btnNextCustomerPage.TabIndex = 21;
            this.btnNextCustomerPage.Text = "Next";
            this.btnNextCustomerPage.UseVisualStyleBackColor = true;
            this.btnNextCustomerPage.Click += new System.EventHandler(this.btnNextCustomerPage_Click);
            // 
            // btnPreviousCustomerPage
            // 
            this.btnPreviousCustomerPage.Location = new System.Drawing.Point(122, 394);
            this.btnPreviousCustomerPage.Name = "btnPreviousCustomerPage";
            this.btnPreviousCustomerPage.Size = new System.Drawing.Size(94, 29);
            this.btnPreviousCustomerPage.TabIndex = 20;
            this.btnPreviousCustomerPage.Text = "Previous";
            this.btnPreviousCustomerPage.UseVisualStyleBackColor = true;
            this.btnPreviousCustomerPage.Click += new System.EventHandler(this.btnPreviousCustomerPage_Click);
            // 
            // btnLastCustomerPage
            // 
            this.btnLastCustomerPage.Location = new System.Drawing.Point(679, 394);
            this.btnLastCustomerPage.Name = "btnLastCustomerPage";
            this.btnLastCustomerPage.Size = new System.Drawing.Size(94, 29);
            this.btnLastCustomerPage.TabIndex = 19;
            this.btnLastCustomerPage.Text = "Last";
            this.btnLastCustomerPage.UseVisualStyleBackColor = true;
            this.btnLastCustomerPage.Click += new System.EventHandler(this.btnLastCustomerPage_Click);
            // 
            // btnFirstCustomerPage
            // 
            this.btnFirstCustomerPage.Location = new System.Drawing.Point(17, 394);
            this.btnFirstCustomerPage.Name = "btnFirstCustomerPage";
            this.btnFirstCustomerPage.Size = new System.Drawing.Size(94, 29);
            this.btnFirstCustomerPage.TabIndex = 18;
            this.btnFirstCustomerPage.Text = "First";
            this.btnFirstCustomerPage.UseVisualStyleBackColor = true;
            this.btnFirstCustomerPage.Click += new System.EventHandler(this.btnFirstBillPage_Click);
            // 
            // cbIDBillToday
            // 
            this.cbIDBillToday.FormattingEnabled = true;
            this.cbIDBillToday.Location = new System.Drawing.Point(598, 85);
            this.cbIDBillToday.Name = "cbIDBillToday";
            this.cbIDBillToday.Size = new System.Drawing.Size(140, 28);
            this.cbIDBillToday.TabIndex = 17;
            this.cbIDBillToday.SelectedIndexChanged += new System.EventHandler(this.cbIDBillToday_SelectedIndexChanged);
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.BackColor = System.Drawing.Color.White;
            this.label5.Font = new System.Drawing.Font("Arial", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.label5.Location = new System.Drawing.Point(414, 89);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(130, 24);
            this.label5.TabIndex = 16;
            this.label5.Text = "Bill Hôm Nay";
            this.label5.Click += new System.EventHandler(this.label5_Click);
            // 
            // btnUpdateCus
            // 
            this.btnUpdateCus.Font = new System.Drawing.Font("Arial", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.btnUpdateCus.Location = new System.Drawing.Point(222, -1);
            this.btnUpdateCus.Name = "btnUpdateCus";
            this.btnUpdateCus.Size = new System.Drawing.Size(96, 38);
            this.btnUpdateCus.TabIndex = 15;
            this.btnUpdateCus.Text = "Sửa";
            this.btnUpdateCus.UseVisualStyleBackColor = true;
            this.btnUpdateCus.Click += new System.EventHandler(this.btnUpdateCus_Click);
            // 
            // btnDeleteCustomer
            // 
            this.btnDeleteCustomer.Font = new System.Drawing.Font("Arial", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.btnDeleteCustomer.Location = new System.Drawing.Point(120, -1);
            this.btnDeleteCustomer.Name = "btnDeleteCustomer";
            this.btnDeleteCustomer.Size = new System.Drawing.Size(96, 38);
            this.btnDeleteCustomer.TabIndex = 14;
            this.btnDeleteCustomer.Text = "Xóa";
            this.btnDeleteCustomer.UseVisualStyleBackColor = true;
            this.btnDeleteCustomer.Click += new System.EventHandler(this.btnDeleteCustomer_Click);
            // 
            // btnAddCus
            // 
            this.btnAddCus.Font = new System.Drawing.Font("Arial", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.btnAddCus.Location = new System.Drawing.Point(18, -1);
            this.btnAddCus.Name = "btnAddCus";
            this.btnAddCus.Size = new System.Drawing.Size(96, 38);
            this.btnAddCus.TabIndex = 13;
            this.btnAddCus.Text = "Thêm";
            this.btnAddCus.UseVisualStyleBackColor = true;
            this.btnAddCus.Click += new System.EventHandler(this.btnAddCus_Click);
            // 
            // txbSearchCus
            // 
            this.txbSearchCus.Location = new System.Drawing.Point(430, 43);
            this.txbSearchCus.Name = "txbSearchCus";
            this.txbSearchCus.Size = new System.Drawing.Size(329, 27);
            this.txbSearchCus.TabIndex = 12;
            // 
            // btnSearchCus
            // 
            this.btnSearchCus.Font = new System.Drawing.Font("Arial", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.btnSearchCus.Location = new System.Drawing.Point(430, -1);
            this.btnSearchCus.Name = "btnSearchCus";
            this.btnSearchCus.Size = new System.Drawing.Size(124, 38);
            this.btnSearchCus.TabIndex = 4;
            this.btnSearchCus.Text = "Tìm Khách :";
            this.btnSearchCus.UseVisualStyleBackColor = true;
            this.btnSearchCus.Click += new System.EventHandler(this.btnViewCus_Click);
            // 
            // txbSumBill
            // 
            this.txbSumBill.Location = new System.Drawing.Point(598, 166);
            this.txbSumBill.Name = "txbSumBill";
            this.txbSumBill.Size = new System.Drawing.Size(140, 27);
            this.txbSumBill.TabIndex = 11;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.BackColor = System.Drawing.Color.White;
            this.label4.Font = new System.Drawing.Font("Arial", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.label4.Location = new System.Drawing.Point(598, 139);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(161, 24);
            this.label4.TabIndex = 10;
            this.label4.Text = "Tổng Hóa Đơn :";
            // 
            // txbCustomerAddress
            // 
            this.txbCustomerAddress.Location = new System.Drawing.Point(414, 347);
            this.txbCustomerAddress.Name = "txbCustomerAddress";
            this.txbCustomerAddress.Size = new System.Drawing.Size(345, 27);
            this.txbCustomerAddress.TabIndex = 9;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.BackColor = System.Drawing.Color.White;
            this.label3.Font = new System.Drawing.Font("Arial", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.label3.Location = new System.Drawing.Point(414, 320);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(90, 24);
            this.label3.TabIndex = 8;
            this.label3.Text = "Địa Chỉ :";
            this.label3.Click += new System.EventHandler(this.label3_Click);
            // 
            // txbPhoneNumber
            // 
            this.txbPhoneNumber.Location = new System.Drawing.Point(414, 290);
            this.txbPhoneNumber.Name = "txbPhoneNumber";
            this.txbPhoneNumber.Size = new System.Drawing.Size(345, 27);
            this.txbPhoneNumber.TabIndex = 7;
            this.txbPhoneNumber.TextChanged += new System.EventHandler(this.textBox3_TextChanged);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.BackColor = System.Drawing.Color.White;
            this.label2.Font = new System.Drawing.Font("Arial", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.label2.Location = new System.Drawing.Point(414, 263);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(221, 24);
            this.label2.TabIndex = 6;
            this.label2.Text = "Số Điện Thoại Khách :";
            this.label2.Click += new System.EventHandler(this.label2_Click);
            // 
            // txbIdBill
            // 
            this.txbIdBill.Location = new System.Drawing.Point(414, 166);
            this.txbIdBill.Name = "txbIdBill";
            this.txbIdBill.Size = new System.Drawing.Size(140, 27);
            this.txbIdBill.TabIndex = 5;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.BackColor = System.Drawing.Color.White;
            this.label1.Font = new System.Drawing.Font("Arial", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.label1.Location = new System.Drawing.Point(410, 139);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(140, 24);
            this.label1.TabIndex = 4;
            this.label1.Text = "Mã Hóa Đơn :";
            this.label1.Click += new System.EventHandler(this.label1_Click_1);
            // 
            // dtgvCustomer
            // 
            this.dtgvCustomer.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dtgvCustomer.Location = new System.Drawing.Point(17, 43);
            this.dtgvCustomer.Name = "dtgvCustomer";
            this.dtgvCustomer.RowHeadersWidth = 51;
            this.dtgvCustomer.RowTemplate.Height = 29;
            this.dtgvCustomer.Size = new System.Drawing.Size(390, 350);
            this.dtgvCustomer.TabIndex = 3;
            this.dtgvCustomer.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dtgvCustomer_CellClick);
            this.dtgvCustomer.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dtgvCustomer_CellContentClick);
            // 
            // fCustomer
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.panel1);
            this.Name = "fCustomer";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "fCustomer";
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dtgvCustomer)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private TextBox txbNameCustomer;
        private Label account;
        private Panel panel1;
        private Label label1;
        private DataGridView dtgvCustomer;
        private Label label2;
        private TextBox txbIdBill;
        private Label label3;
        private TextBox txbPhoneNumber;
        private TextBox txbSumBill;
        private Label label4;
        private TextBox txbCustomerAddress;
        private Button btnSearchCus;
        private TextBox txbSearchCus;
        private Button btnUpdateCus;
        private Button btnDeleteCustomer;
        private Button btnAddCus;
        private Label label5;
        private ComboBox cbIDBillToday;
        private TextBox txbPageCustomer;
        private Button btnNextCustomerPage;
        private Button btnPreviousCustomerPage;
        private Button btnLastCustomerPage;
        private Button btnFirstCustomerPage;
    }
}