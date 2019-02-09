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
    /// Interaction logic for sach.xaml
    /// </summary>
    public partial class sach : Window
    {
        public sach()
        {
            InitializeComponent();
            this.DataContext = new ViewModel.Sach_ViewModel();
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
                return ((Model.Sach)item).ma_sach.IndexOf(tb_filter.Text, StringComparison.OrdinalIgnoreCase) >= 0 ||
                  ((Model.Sach)item).ten_sach.IndexOf(tb_filter.Text, StringComparison.OrdinalIgnoreCase) >= 0 ||
                    ((Model.Sach)item).Theloai.ten_theloai.IndexOf(tb_filter.Text, StringComparison.OrdinalIgnoreCase) >= 0 ||
                 ((Model.Sach)item).Nhaxuatban.ten_nhaxuatban.IndexOf(tb_filter.Text, StringComparison.OrdinalIgnoreCase) >= 0;


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
