using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Input;
using System.Collections.ObjectModel;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;

namespace Quanlythuvien.ViewModel
{
    public class Sach_ViewModel : BaseViewModel
    {
        private ObservableCollection<Model.Sach> _List;

        public ObservableCollection<Model.Sach> List
        {
            get { return _List; }
            set { _List = value; OnPropertyChanged(); }
        }

        private Model.Sach _SelectedItem;

        public Model.Sach SelectedItem
        {
            get { return _SelectedItem; }
            set
            {
                _SelectedItem = value;
                if (_SelectedItem != null)
                {
                    Masach = _SelectedItem.ma_sach;
                    Tensach = _SelectedItem.ten_sach;
                    STheloai = _SelectedItem.Theloai;
                    SNhaxuatban = _SelectedItem.Nhaxuatban;
                }
                OnPropertyChanged();
            }
        }

        #region SelectedItem.Property
        private string _Masach;
        private string _Tensach;
        private ObservableCollection<Model.Theloai> _ListTheloai;
        private Model.Theloai _STheloai;
        private ObservableCollection<Model.Nhaxuatban> _ListNhaxuatban;
        private Model.Nhaxuatban _SNhaxuatban;

        public Model.Nhaxuatban SNhaxuatban
        {
            get { return _SNhaxuatban; }
            set { _SNhaxuatban = value; OnPropertyChanged(); }
        }

        public Model.Theloai STheloai
        {
            get { return _STheloai; }
            set { _STheloai = value; OnPropertyChanged(); }
        }
        public ObservableCollection<Model.Nhaxuatban> ListNhaxuatban
        {
            get { return _ListNhaxuatban; }
            set { _ListNhaxuatban = value; OnPropertyChanged(); }
        }

        public ObservableCollection<Model.Theloai> ListTheloai
        {
            get { return _ListTheloai; }
            set { _ListTheloai = value; OnPropertyChanged(); }
        }
        public string Tensach
        {
            get { return _Tensach; }
            set { _Tensach = value; OnPropertyChanged(); }
        }

        public string Masach
        {
            get { return _Masach; }
            set { _Masach = value; OnPropertyChanged(); }
        }
        #endregion

        #region Command
        public ICommand Add_Command { get; set; }
        public ICommand Save_Command { get; set; }
        public ICommand Edit_Command { get; set; }
        public ICommand Delete_Command { get; set; }
        #endregion

        public Sach_ViewModel()
        {
            List = new ObservableCollection<Model.Sach>(Model.DataProvider.Ins.QLTV.Saches);
            ListNhaxuatban = new ObservableCollection<Model.Nhaxuatban>(Model.DataProvider.Ins.QLTV.Nhaxuatbans);
            ListTheloai = new ObservableCollection<Model.Theloai>(Model.DataProvider.Ins.QLTV.Theloais);

            Add_Command = new RelayCommand<object>(p =>
            {
                return true;
            }, p =>
            {
                SelectedItem = null;
                Tensach = "";
                Masach = "";
                SNhaxuatban = null;
                STheloai = null;
            });
            //
            Save_Command = new RelayCommand<object>(p =>
            {
                if (string.IsNullOrEmpty(Tensach))
                    return false;

                if (SNhaxuatban == null || STheloai == null)
                    return false;

                return true;
            }, p =>
            {
                Model.Sach sach = new Model.Sach()
                {
                    ma_sach = Taoma(STheloai.ma_theloai, SNhaxuatban.ma_nhaxuatban, List.Count()),
                    ten_sach = Kiemtraten(Tensach),
                    Nhaxuatban = SNhaxuatban,
                    Theloai = STheloai
                };

                try
                {
                    Model.DataProvider.Ins.QLTV.Saches.Add(sach);
                    Model.DataProvider.Ins.QLTV.SaveChanges();

                    List.Insert(0, sach);

                    SelectedItem = null;
                    Tensach = "";
                    Masach = "";
                    SNhaxuatban = null;
                    STheloai = null;

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

                if (string.IsNullOrEmpty(Tensach))
                    return false;

                if (SNhaxuatban == null || STheloai == null)
                    return false;

                return true;
            }, p =>
            {
                var item = Model.DataProvider.Ins.QLTV.Saches.Where(x => x.ma_sach == SelectedItem.ma_sach).SingleOrDefault();
                item.ten_sach = Tensach;
                item.Theloai = STheloai;
                item.Nhaxuatban = SNhaxuatban;

                try
                {
                    Model.DataProvider.Ins.QLTV.SaveChanges();

                    for (int i = 0; i < List.Count(); i++)
                    {
                        if (List[i] == SelectedItem)
                        {
                            List[i] = new Model.Sach()
                            {
                                ma_sach = Masach,
                                ten_sach = Tensach,
                                Theloai = STheloai,
                                Nhaxuatban = SNhaxuatban
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
            //
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
                        var item = Model.DataProvider.Ins.QLTV.Saches.Where(x => x.ma_sach == ma).SingleOrDefault();
                        Model.DataProvider.Ins.QLTV.Saches.Remove(item);
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

        private string Taoma(string c1, string c2, int i)
        {
            string ma = c1 + c2 + ((i + 1).ToString());
            if (List.Where(x=>x.ma_sach==ma).Count()!=0)
            {
                ma += ResourceCS.StaticClass.RandomString(2, false);
            }
            return ma;
        }

        private string Kiemtraten(string ten)
        {
            int i = List.Where(x => x.ten_sach.Contains(ten)).Count();
            if (i != 0)
            {
                ten = ten + "(" + (i.ToString()) + ")";
            }
            return ten;
        }
    }
}
