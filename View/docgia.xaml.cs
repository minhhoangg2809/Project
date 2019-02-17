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
    /// Interaction logic for docgia.xaml
    /// </summary>
    public partial class docgia : Window
    {
        public docgia()
        {
            InitializeComponent();
            this.DataContext = new ViewModel.Docgia_ViewModel();
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
                try
                {
                    return ((Model.Docgia)item).sothe.IndexOf(tb_filter.Text, StringComparison.OrdinalIgnoreCase) >= 0 ||
                    ((Model.Docgia)item).ma_docgia.ToString().IndexOf(tb_filter.Text, StringComparison.OrdinalIgnoreCase) >= 0 ||
                  ((Model.Docgia)item).ten_docgia.IndexOf(tb_filter.Text, StringComparison.OrdinalIgnoreCase) >= 0 ||
                 ((Model.Docgia)item).diachi.IndexOf(tb_filter.Text, StringComparison.OrdinalIgnoreCase) >= 0;
                }
                catch (Exception)
                {
                    return true;
                }

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
