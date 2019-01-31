using Quanlythuvien.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;

namespace Quanlythuvien.UC
{
    /* xu ly hoat dong cua Menu*/
    class Menu_ViewModel : BaseViewModel
    {
        public ICommand Select_Command { get; set; }
        public Menu_ViewModel()
        {
            Select_Command = new RelayCommand<ListView>(p => 
            {
                return true;
            }, p => 
            {
                try
                {
                    ListViewItem item = p.SelectedItem as ListViewItem;
                    dieuhuong_manhinh(Convert.ToInt32(item.Uid));
                    Window w = getParent(p) as Window;
                    w.Close();
                }
                catch (Exception) {/**/};
            });
        }

        private void dieuhuong_manhinh(int i) 
        {
            switch (i)
            {
                case 1: 
                    {
                        View.manhinhchinh view = new View.manhinhchinh();
                        view.Show();
                    }
                    break;
                case 2: 
                    {
                        View.sach view = new View.sach();
                        view.Show();
                    }
                    break;
                case 3:
                    {
                        View.theloai view = new View.theloai();
                        view.Show();
                    }
                    break;
                case 4:
                    {
                        View.nhaxuatban view = new View.nhaxuatban();
                        view.Show();
                    }
                    break;
                case 5:
                    {
                        View.themuon view = new View.themuon();
                        view.Show();
                    }
                    break;
                case 6:
                    {
                        View.docgia view = new View.docgia();
                        view.Show();
                    }
                    break;
                case 7: 
                    {
                        View.muontrasach view = new View.muontrasach();
                        view.Show();
                    }
                    break;
                default:
                    break;
            }
        }

        private FrameworkElement getParent(ListView lv) 
        {
            FrameworkElement p = lv;
            while (p.Parent!=null)
            {
                p = p.Parent as FrameworkElement;
            }
            return p;
        }
   
    }
}
