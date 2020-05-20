using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Exam001
{
    public partial class add : Form
    {
        SupermarketEntities2 db = new SupermarketEntities2();
        public add()
        {
            InitializeComponent();
        }
        // 重置按钮
        private void button2_Click(object sender, EventArgs e)
        {
            foreach (Control ctr in this.Controls)
            {
                if (ctr is TextBox)
                {
                    ctr.Text = "";
                }
            }
        }
        private void add_Load(object sender, EventArgs e)
        {
            //  绑定类型数据
            var query = from t in db.types select new { t.gid, t.name };
            comboBox1.ValueMember = "gid";
            comboBox1.DisplayMember = "name";
            comboBox1.DataSource = query.ToList();
            //  绑定供应商数据
            var query2 = from s in db.supplier select new { s.id, s.name };
            comboBox2.ValueMember = "id";
            comboBox2.DisplayMember = "name";
            comboBox2.DataSource = query2.ToList();
        }
        // 限制TextBox只能输入数字
        private void Number_KeyPress(object sender, KeyPressEventArgs e)
        {
            if ((Convert.ToInt32(e.KeyChar) == 8))
            {
                e.Handled = false;
            }
            else
            {
                Regex numRegex = new Regex(@"^(-?[0-9]*[.]*[0-9]*)$");
                Match Result = numRegex.Match(Convert.ToString(e.KeyChar));
                if (Result.Success)
                {
                    e.Handled = false;
                }
                else
                {
                    e.Handled = true;
                }
            }
        }
        // 提交信息
        private void button1_Click(object sender, EventArgs e)
        {
            if (textBox1.Text == "" || textBox2.Text == "" || textBox3.Text == "" || textBox4.Text == "" || textBox5.Text == "" || textBox6.Text == "")
            {
                MessageBox.Show("不能为空！", "提示消息");
            }
            else
            {
                string gid = textBox1.Text.Trim();
                string name = textBox2.Text.Trim();
                string number = textBox3.Text.Trim();
                DateTime date = DateTime.Parse(dateTimePicker1.Text);
                string unit = textBox4.Text.Trim();
                string stock = textBox5.Text.Trim();
                decimal price = Convert.ToDecimal(textBox6.Text.Trim());
                int type = Convert.ToInt16(comboBox1.SelectedValue.ToString());
                int supplier = Convert.ToInt16(comboBox2.SelectedValue.ToString());
                goods g = new goods();

                g.货物代码 = gid;
                g.货物名称 = name;
                g.库存量 = stock;
                g.类型 = type;
                g.单位 = unit;
                g.入库日期 = date;
                g.售价 = price;
                g.入库单号 = number;
                g.供应商 = supplier;
                db.goods.Add(g);
                db.SaveChanges();
                MessageBox.Show("商品添加成功！", "提示信息");
                this.DialogResult = DialogResult.OK;
                this.Close();
            }
        }
    }
}
