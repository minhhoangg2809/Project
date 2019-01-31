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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Quanlythuvien.UC
{
    /// <summary>
    /// Interaction logic for Menu.xaml
    /// </summary>
    public partial class Menu : UserControl
    {
        public Menu()
        {
            InitializeComponent();
            btn_Menuclose.Click += btn_Menuclose_Click;
            btn_Menuopen.Click += btn_Menuopen_Click;
            this.DataContext =new UC.Menu_ViewModel();
        }

        void btn_Menuopen_Click(object sender, RoutedEventArgs e)
        {
            btn_Menuopen.Visibility = Visibility.Hidden;
            btn_Menuclose.Visibility = Visibility.Visible;
        }

        void btn_Menuclose_Click(object sender, RoutedEventArgs e)
        {
            btn_Menuopen.Visibility = Visibility.Visible;
            btn_Menuclose.Visibility = Visibility.Hidden;
        }
    }
}
