using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.Entity.Core.Objects;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Exam001
{
    public partial class login : Form
    {
        public login()
        {
            InitializeComponent();
        }
        public static int select(string name, string password)
        {
            using (SupermarketEntities2 db = new SupermarketEntities2())
            {
                //定义一个输出参数
                ObjectParameter paral = new ObjectParameter("result", typeof(int));
                //调用一下存储过程
                var result = db.prcValiddateUser(name, password, paral);
                //返回结果
                return (int)paral.Value;
            }
        }
        private void button1_Click(object sender, EventArgs e)
        {
            string name = textBox1.Text;
            string password = textBox2.Text;
            var tea = select(name, password);
            if (tea == 1)
            {
                // 返回OK，关闭对话框
                DialogResult = DialogResult.OK;
            }
            else if (tea == 0)
            {
                MessageBox.Show("用户名或密码错误！", "提示信息");
            }
        }
        // 重置按钮
        private void button2_Click(object sender, EventArgs e)
        {
            textBox1.Text = "";
            textBox2.Text = "";
        }

        private void login_Load(object sender, EventArgs e)
        {

        }

    }
}
