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
    /// Interaction logic for manhinhchinh_tab2.xaml
    /// </summary>
    public partial class manhinhchinh_tab2 : Page
    {
        public manhinhchinh_tab2()
        {
            InitializeComponent();
            this.DataContext = new ViewModel.Themuon_ViewModel();
        }

        #region Tim kiem
        private bool FilterUser(object item)
        {
            if (String.IsNullOrEmpty(tb_filter.Text))
            {
                return true;
            }
            else
            {
                return ((Model.Thethuvien)item).sothe.IndexOf(tb_filter.Text, StringComparison.OrdinalIgnoreCase) >= 0 ||
                  ((Model.Thethuvien)item).ngaybd_hienthi.IndexOf(tb_filter.Text, StringComparison.OrdinalIgnoreCase) >= 0 ||
                 ((Model.Thethuvien)item).ngaykt_hienthi.IndexOf(tb_filter.Text, StringComparison.OrdinalIgnoreCase) >= 0;


            }
        }
        private void tb_filter_TextChanged(object sender, TextChangedEventArgs e)
        {
            CollectionView viewfilter = (CollectionView)CollectionViewSource.GetDefaultView(lv_hienthi.ItemsSource);
            viewfilter.Filter = FilterUser;
            CollectionViewSource.GetDefaultView(lv_hienthi.ItemsSource).Refresh();
        }
        private void Reset_Textfilter(object sender, MouseButtonEventArgs e)
        {
            tb_filter.Text = "";
        }
        #endregion
    }
}
