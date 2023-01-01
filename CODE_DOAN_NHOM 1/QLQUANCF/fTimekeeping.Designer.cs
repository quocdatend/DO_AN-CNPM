namespace QLQUANCF
{
    partial class fTimekeeping
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
            this.panel1 = new System.Windows.Forms.Panel();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.panel2 = new System.Windows.Forms.Panel();
            this.label2 = new System.Windows.Forms.Label();
            this.dateTimePicker1 = new System.Windows.Forms.DateTimePicker();
            this.cbTimekeeping = new System.Windows.Forms.CheckBox();
            this.panel3 = new System.Windows.Forms.Panel();
            this.btnInfoSalary = new System.Windows.Forms.Button();
            this.btnInfoTimekeeping = new System.Windows.Forms.Button();
            this.panel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.panel2.SuspendLayout();
            this.panel3.SuspendLayout();
            this.SuspendLayout();
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.dataGridView1);
            this.panel1.Location = new System.Drawing.Point(12, 93);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(670, 345);
            this.panel1.TabIndex = 0;
            // 
            // dataGridView1
            // 
            this.dataGridView1.BackgroundColor = System.Drawing.Color.White;
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Location = new System.Drawing.Point(3, 3);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.ReadOnly = true;
            this.dataGridView1.RowTemplate.Height = 25;
            this.dataGridView1.Size = new System.Drawing.Size(664, 339);
            this.dataGridView1.TabIndex = 0;
            this.dataGridView1.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView1_CellContentClick);
            // 
            // panel2
            // 
            this.panel2.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.panel2.Controls.Add(this.label2);
            this.panel2.Controls.Add(this.dateTimePicker1);
            this.panel2.Controls.Add(this.cbTimekeeping);
            this.panel2.Location = new System.Drawing.Point(12, 12);
            this.panel2.Name = "panel2";
            this.panel2.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.panel2.Size = new System.Drawing.Size(238, 75);
            this.panel2.TabIndex = 1;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Segoe UI", 14.25F, System.Drawing.FontStyle.Underline, System.Drawing.GraphicsUnit.Point);
            this.label2.Location = new System.Drawing.Point(23, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(104, 25);
            this.label2.TabIndex = 3;
            this.label2.Text = "Điểm danh";
            // 
            // dateTimePicker1
            // 
            this.dateTimePicker1.Enabled = false;
            this.dateTimePicker1.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.dateTimePicker1.Location = new System.Drawing.Point(23, 43);
            this.dateTimePicker1.Name = "dateTimePicker1";
            this.dateTimePicker1.Size = new System.Drawing.Size(107, 23);
            this.dateTimePicker1.TabIndex = 2;
            // 
            // cbTimekeeping
            // 
            this.cbTimekeeping.AutoSize = true;
            this.cbTimekeeping.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.cbTimekeeping.Location = new System.Drawing.Point(145, 43);
            this.cbTimekeeping.Name = "cbTimekeeping";
            this.cbTimekeeping.Size = new System.Drawing.Size(76, 25);
            this.cbTimekeeping.TabIndex = 1;
            this.cbTimekeeping.Text = "có mặt";
            this.cbTimekeeping.UseVisualStyleBackColor = true;
            this.cbTimekeeping.Enter += new System.EventHandler(this.cbTimekeeping_FocusEnter);
            // 
            // panel3
            // 
            this.panel3.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.panel3.Controls.Add(this.btnInfoSalary);
            this.panel3.Controls.Add(this.btnInfoTimekeeping);
            this.panel3.Location = new System.Drawing.Point(256, 12);
            this.panel3.Name = "panel3";
            this.panel3.Size = new System.Drawing.Size(426, 75);
            this.panel3.TabIndex = 2;
            // 
            // btnInfoSalary
            // 
            this.btnInfoSalary.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.btnInfoSalary.Location = new System.Drawing.Point(257, 16);
            this.btnInfoSalary.Name = "btnInfoSalary";
            this.btnInfoSalary.Size = new System.Drawing.Size(141, 43);
            this.btnInfoSalary.TabIndex = 1;
            this.btnInfoSalary.Text = "Thông tin lương";
            this.btnInfoSalary.UseVisualStyleBackColor = true;
            this.btnInfoSalary.Click += new System.EventHandler(this.btnInfoSalary_Click);
            // 
            // btnInfoTimekeeping
            // 
            this.btnInfoTimekeeping.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.btnInfoTimekeeping.Location = new System.Drawing.Point(28, 16);
            this.btnInfoTimekeeping.Name = "btnInfoTimekeeping";
            this.btnInfoTimekeeping.Size = new System.Drawing.Size(175, 43);
            this.btnInfoTimekeeping.TabIndex = 0;
            this.btnInfoTimekeeping.Text = "Thông tin điểm danh";
            this.btnInfoTimekeeping.UseVisualStyleBackColor = true;
            this.btnInfoTimekeeping.Click += new System.EventHandler(this.btnInfoTimekeeping_Click);
            // 
            // fTimekeeping
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 15F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(698, 450);
            this.Controls.Add(this.panel3);
            this.Controls.Add(this.panel2);
            this.Controls.Add(this.panel1);
            this.Name = "fTimekeeping";
            this.Text = "fTimekeeping";
            this.panel1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.panel2.ResumeLayout(false);
            this.panel2.PerformLayout();
            this.panel3.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private Panel panel1;
        private DataGridView dataGridView1;
        private Panel panel2;
        private Panel panel3;
        private CheckBox cbTimekeeping;
        private Button btnInfoSalary;
        private Button btnInfoTimekeeping;
        private DateTimePicker dateTimePicker1;
        private Label label2;
    }
}