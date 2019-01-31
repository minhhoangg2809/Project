﻿using System;
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
    /// Interaction logic for manhinhchinh_tab3.xaml
    /// </summary>
    public partial class manhinhchinh_tab3 : Page
    {
        public manhinhchinh_tab3()
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
                return ((Model.Docgia)item).sothe.IndexOf(tb_filter.Text, StringComparison.OrdinalIgnoreCase) >= 0 ||
                 ((Model.Docgia)item).ma_docgia.ToString().IndexOf(tb_filter.Text, StringComparison.OrdinalIgnoreCase) >= 0 ||
                 ((Model.Docgia)item).ten_docgia.IndexOf(tb_filter.Text, StringComparison.OrdinalIgnoreCase) >= 0 ||
                  ((Model.Docgia)item).diachi.ToString().IndexOf(tb_filter.Text, StringComparison.OrdinalIgnoreCase) >= 0;

            }
        }
        private void tb_filter_TextChanged(object sender, TextChangedEventArgs e)
        {
            CollectionView viewfilter = (CollectionView)CollectionViewSource.GetDefaultView(lv_hienthi.ItemsSource);
            viewfilter.Filter = FilterUser;
            CollectionViewSource.GetDefaultView(lv_hienthi.ItemsSource).Refresh();
        }
        #endregion
    }
}
