using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Windows;
using System.Threading.Tasks;
using System.Windows.Input;
using System.Windows.Controls;

namespace Quanlythuvien.ViewModel
{
    public class Nhaxuatban_ViewModel : BaseViewModel
    {
        private ObservableCollection<Model.Nhaxuatban> _List;

        public ObservableCollection<Model.Nhaxuatban> List
        {
            get { return _List; }
            set { _List = value; OnPropertyChanged(); }
        }

        private Model.Nhaxuatban _SelectedItem;

        public Model.Nhaxuatban SelectedItem
        {
            get { return _SelectedItem; }
            set
            {
                _SelectedItem = value;
                if (_SelectedItem != null)
                {
                    MaNXB = _SelectedItem.ma_nhaxuatban;
                    TenNXB = _SelectedItem.ten_nhaxuatban;
                    Email = _SelectedItem.email;
                    Diachi = _SelectedItem.diachi;
                    Nguoidaidien = _SelectedItem.nguoidaidien;
                }
                OnPropertyChanged();
            }
        }

        #region SelectedItem.Property
        private string _MaNXB;
        private string _TenNXB;
        private string _Diachi;
        private string _Email;
        private string _Nguoidaidien;

        public string Diachi
        {
            get { return _Diachi; }
            set { _Diachi = value; OnPropertyChanged(); }
        }
        public string Nguoidaidien
        {
            get { return _Nguoidaidien; }
            set { _Nguoidaidien = value; OnPropertyChanged(); }
        }

        public string Email
        {
            get { return _Email; }
            set { _Email = value; OnPropertyChanged(); }
        }

        public string TenNXB
        {
            get { return _TenNXB; }
            set { _TenNXB = value; OnPropertyChanged(); }
        }

        public string MaNXB
        {
            get { return _MaNXB; }
            set { _MaNXB = value; OnPropertyChanged(); }
        }
        #endregion

        #region Command
        public ICommand Add_Command { get; set; }
        public ICommand Save_Command { get; set; }
        public ICommand Edit_Command { get; set; }
        public ICommand Delete_Command { get; set; }
        #endregion
        public Nhaxuatban_ViewModel()
        {
            List = new ObservableCollection<Model.Nhaxuatban>(Model.DataProvider.Ins.QLTV.Nhaxuatbans);

            Add_Command = new RelayCommand<object>(p =>
            {
                return true;
            }, p =>
            {
                SelectedItem = null;
                MaNXB = "";
                TenNXB = "";
                Email = "";
                Diachi = "";
                Nguoidaidien = "";
            });
            //
            Save_Command = new RelayCommand<object>(p =>
            {
                if (string.IsNullOrEmpty(TenNXB) || string.IsNullOrEmpty(Email)
                    || string.IsNullOrEmpty(Diachi) || string.IsNullOrEmpty(Nguoidaidien))
                    return false;

                if ((Model.DataProvider.Ins.QLTV.Nhaxuatbans.Where(x => x.ten_nhaxuatban == TenNXB).ToList()).Count() != 0)
                    return false;

                return true;
            }, p =>
            {
                Model.Nhaxuatban nxb = new Model.Nhaxuatban()
                {
                    ma_nhaxuatban = Taoma(List.Count()),
                    ten_nhaxuatban = TenNXB,
                    diachi = Diachi,
                    email = Email,
                    nguoidaidien = Nguoidaidien
                };

                try
                {
                    Model.DataProvider.Ins.QLTV.Nhaxuatbans.Add(nxb);
                    Model.DataProvider.Ins.QLTV.SaveChanges();

                    List.Insert(0, nxb);

                    SelectedItem = null;
                    MaNXB = "";
                    TenNXB = "";
                    Email = "";
                    Diachi = "";
                    Nguoidaidien = "";

                    MessageBox.Show("Thêm mới thành công", "THÔNG BÁO");
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Đã xảy ra lỗi", "THÔNG BÁO");
                    MessageBox.Show(ex.Message);
                }
            });
            //
            Edit_Command = new RelayCommand<object>(p =>
            {
                if (SelectedItem == null)
                    return false;

                if (string.IsNullOrEmpty(TenNXB) || string.IsNullOrEmpty(Email)
                    || string.IsNullOrEmpty(Diachi) || string.IsNullOrEmpty(Nguoidaidien))
                    return false;

                return true;
            }, p =>
            {
                var item = Model.DataProvider.Ins.QLTV.Nhaxuatbans.Where(x => x.ma_nhaxuatban == SelectedItem.ma_nhaxuatban).SingleOrDefault();
                item.ten_nhaxuatban = Kiemtraten(TenNXB);
                item.diachi = Diachi;
                item.nguoidaidien = Nguoidaidien;
                item.email = Email;


                try
                {
                    Model.DataProvider.Ins.QLTV.SaveChanges();

                    for (int i = 0; i < List.Count(); i++)
                    {
                        if (List[i] == SelectedItem)
                        {
                            List[i] = new Model.Nhaxuatban()
                            {
                                ma_nhaxuatban = MaNXB,
                                ten_nhaxuatban = Kiemtraten(TenNXB),
                                diachi = Diachi,
                                email = Email,
                                nguoidaidien = Nguoidaidien
                            };
                            break;
                        }
                    }
                    MessageBox.Show("Chỉnh sửa thành công", "THÔNG BÁO");

                }
                catch (Exception ex)
                {
                    MessageBox.Show("Đã xảy ra lỗi", "THÔNG BÁO");
                    MessageBox.Show(ex.Message);
                }
            });
            Delete_Command = new RelayCommand<Button>(p =>
            {
                return true;
            }, p =>
            {
                if (MessageBox.Show("Xóa bản ghi này?", "THÔNG BÁO", MessageBoxButton.OKCancel, MessageBoxImage.Question) == MessageBoxResult.OK)
                {
                    try
                    {
                        string ma = p.ToolTip.ToString();
                        var item = Model.DataProvider.Ins.QLTV.Nhaxuatbans.Where(x => x.ma_nhaxuatban == ma).SingleOrDefault();
                        Model.DataProvider.Ins.QLTV.Nhaxuatbans.Remove(item);
                        Model.DataProvider.Ins.QLTV.SaveChanges();

                        List.Remove(item);
                        MessageBox.Show("Xóa thành công", "THÔNG BÁO");
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show("Đã xảy ra lỗi", "THÔNG BÁO");
                        MessageBox.Show(ex.Message);
                    }
                }
            });
        }

        private string Taoma(int i)
        {
            string ma = "NXB" + ((i + 1).ToString());
            return ma;
        }

        private string Kiemtraten(string ten) 
        {
            int i = List.Where(x => x.ten_nhaxuatban.Contains(ten)).Count();
            if (i!=0)
            {
                ten = ten + "(" + (i.ToString()) + ")";
            }
            return ten;
        }
    }
}
