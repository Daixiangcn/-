using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Exam001
{
    public partial class main : Form
    {
        SupermarketEntities2 db = new SupermarketEntities2();
        public main()
        {
            InitializeComponent();
        }

        private void main_Load(object sender, EventArgs e)
        {
            var query = from t in db.types select new { t.gid, t.name };
            comboBox1.ValueMember = "gid";
            comboBox1.DisplayMember = "name";
            comboBox1.DataSource = query.ToList();

            var query2 = from g in db.goods select new { g.货物代码, g.货物名称, g.单位, g.库存量, 类型 = g.types.name, 供应商 = g.supplier.name, g.入库单号, g.入库日期, g.售价 };
            dataGridView1.DataSource = query2.ToList();

        }
        // 查询信息-模糊查询
        private void button1_Click(object sender, EventArgs e)
        {
            string code = textBox1.Text.Trim();
            string name = textBox2.Text.Trim();
            int type = Convert.ToInt32(comboBox1.SelectedValue.ToString());
            SupermarketEntities2 db = new SupermarketEntities2();
            var query = from g in db.goods where g.货物代码.Contains(code) && g.货物名称.Contains(name) && g.类型 == type select new { g.货物代码, g.货物名称, g.单位, g.库存量, 类型 = g.types.name, 供应商 = g.supplier.name, g.入库单号, g.入库日期, g.售价 };
            dataGridView1.DataSource = query.ToList();

        }
        // 查询全部信息
        private void button5_Click(object sender, EventArgs e)
        {
            var query2 = from g in db.goods select new { g.货物代码, g.货物名称, g.单位, g.库存量, 类型 = g.types.name, 供应商 = g.supplier.name, g.入库单号, g.入库日期, g.售价 };
            dataGridView1.DataSource = query2.ToList();
        }
        // 增加信息
        private void button2_Click(object sender, EventArgs e)
        {
            add a = new add();
            a.ShowDialog();
            this.button5.PerformClick();
        }
        // 删除按钮-删除
        private void button3_Click(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count > 0)
            {
                string key = this.dataGridView1.SelectedRows[0].Cells["货物代码"].Value.ToString();
                DialogResult jo = MessageBox.Show("要删除货物代码为" + key + "的那一行吗？", "确认删除", MessageBoxButtons.OKCancel);
                if (jo == DialogResult.OK)
                {
                    // goods删除
                    var query = (from g in db.goods where g.货物代码 == key select g).FirstOrDefault();
                    if (query != null)
                    {
                        // 删除信息
                        db.goods.Remove(query);
                        db.SaveChanges();
                        // 刷新信息
                        this.button5.PerformClick();
                    }
                }
            }
            else
            {
                MessageBox.Show("请选择行！", "提示信息");
            }
        }
        // 释放鼠标触发
        private int index = 0;
        private void dataGridView1_CellMouseUp(object sender, DataGridViewCellMouseEventArgs e)
        {
            if (e.Button == System.Windows.Forms.MouseButtons.Right)
            {
                this.dataGridView1.Rows[e.RowIndex].Selected = true;
                index = e.RowIndex;
                this.dataGridView1.CurrentCell = this.dataGridView1.Rows[e.RowIndex].Cells[0];
                this.contextMenuStrip1.Show(Cursor.Position);
            }
        }

        private void contextMenuStrip1_Opening(object sender, CancelEventArgs e)
        {

        }
        // 右键快捷菜单-删除
        private void 删除ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (!this.dataGridView1.Rows[index].IsNewRow)
            {
                string key = "";
                if (index >= 0)
                {
                    key = this.dataGridView1.Rows[index].Cells["货物代码"].Value.ToString();
                    DialogResult jo = MessageBox.Show("要删除货物代码为" + key + "的那一行吗？", "确认删除", MessageBoxButtons.OKCancel);
                    if (jo == DialogResult.OK)
                    {
                        // goods删除
                        var query = (from g in db.goods where g.货物代码 == key select g).FirstOrDefault();
                        if (query != null)
                        {
                            // 删除信息
                            db.goods.Remove(query);
                            db.SaveChanges();
                            // 刷新信息
                            this.button5.PerformClick();
                        }
                    }
                    this.Refresh();
                }
            }
        }
        // 修改信息
        private void button4_Click(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count > 0)
            {
                string key = this.dataGridView1.SelectedRows[0].Cells["货物代码"].Value.ToString();
                // 将数据传递给upload窗口
                update up = new update();
                up.setValue(key);
                // 如果模态框关闭，则更新数据
                if (up.ShowDialog() == DialogResult.OK)
                {
                    this.button5.PerformClick();
                }
            }
            else
            {
                MessageBox.Show("请选择行！", "提示信息");
            }
        }
    }
}
