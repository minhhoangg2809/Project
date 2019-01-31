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
    /* Xu ly hoat dong cua controlbar*/
    class ControlBar_ViewModel : BaseViewModel
    {
        public ICommand Close_Command { get; set; }
        public ICommand Maxi_Command { get; set; }
        public ICommand Mini_Command { get; set; }
        public ICommand Drag_Command { get; set; }

        public ControlBar_ViewModel()
        {
            // LogOut
            Close_Command = new RelayCommand<UserControl>(p =>
            {
                if (p == null)
                    return false;

                return true;
            }, p =>
            {
                if (MessageBox.Show("Đóng ứng dụng ???", "THÔNG BÁO", MessageBoxButton.OKCancel, MessageBoxImage.Question) == MessageBoxResult.OK)
                {
                    Model.DataProvider.Ins.QLTV.SaveChanges();
                    Application.Current.Shutdown();
                }
            });
            //
            // Maximize
            Maxi_Command = new RelayCommand<UserControl>(p =>
            {
                if (p == null)
                    return false;

                return true;
            }, p =>
            {
                FrameworkElement window = GetWindowParent(p);
                Window w = window as Window;
                if (w != null)
                {
                    w.WindowState = w.WindowState == WindowState.Maximized ? WindowState.Normal : WindowState.Maximized;
                }
            });
            //
            // Minimize
            Mini_Command = new RelayCommand<UserControl>(p =>
            {
                if (p == null)
                    return false;

                return true;
            }, p =>
            {
                FrameworkElement window = GetWindowParent(p);
                Window w = window as Window;
                if (w != null)
                {
                    w.WindowState = WindowState.Minimized;
                }
            });
            //
            // Drag
            Drag_Command = new RelayCommand<UserControl>(p =>
            {
                return true;
            }, p =>
            {
                try
                {
                    FrameworkElement window = GetWindowParent(p);
                    Window w = window as Window;
                    if (w != null)
                    {
                        w.DragMove();
                    }
                }
                catch (Exception) { };
            });
            //
        }

        FrameworkElement GetWindowParent(UserControl p)
        {
            return ResourceCS.StaticClass.GetWindowParent(p);
        }
    }
}
