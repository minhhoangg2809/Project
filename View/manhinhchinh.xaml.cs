using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace Quanlythuvien.View
{
    /// <summary>
    /// Interaction logic for manhinhchinh.xaml
    /// </summary>
    public partial class manhinhchinh : Window
    {
        public manhinhchinh()
        {
            InitializeComponent();
            Main.Content = new UC.manhinhchinh_tab1();
        }

        #region xu ly tabcontrol
        private void showunderline(Button btn, Rectangle rec)
        {
            if (btn.Uid == rec.Uid)
            {
                rec.Visibility = Visibility.Visible;
            }
            else
            {
                rec.Visibility = Visibility.Hidden;
            }
        }
        private void selecttab(Button btn, Frame fr)
        {
            string uid = btn.Uid.ToString();
            switch (uid)
            {
                case ("t1"):
                    {
                        fr.Content = new UC.manhinhchinh_tab1(); break;
                    };
                case ("t2"):
                    {
                        fr.Content = new UC.manhinhchinh_tab2(); break;
                    };
                case ("t3"):
                    {
                        fr.Content = new UC.manhinhchinh_tab3(); break;
                    };
                case ("t4"):
                    {
                        fr.Content = new UC.manhinhchinh_tab4(); break;
                    };
                default: break;
            }
        }
        #endregion
       
        private void btn_tab_Click(object sender, RoutedEventArgs e)
        {
            Button btn = (Button)sender;
            showunderline(btn, rec1);
            showunderline(btn, rec2);
            showunderline(btn, rec3);
            showunderline(btn, rec4);

            selecttab(btn, Main);
        }
    }
}
