using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Input;
using System.Collections.ObjectModel;
using System.Threading.Tasks;
using System.Windows.Controls;

namespace Quanlythuvien.ViewModel
{
    public class Themuon_ViewModel : BaseViewModel
    {
        private ObservableCollection<Model.Thethuvien> _List;

        public ObservableCollection<Model.Thethuvien> List
        {
            get { return _List; }
            set { _List = value; OnPropertyChanged(); }
        }

        private Model.Thethuvien _SelectedItem;

        public Model.Thethuvien SelectedItem
        {
            get { return _SelectedItem; }
            set
            {
                _SelectedItem = value;
                if (_SelectedItem != null)
                {
                    Sothe = _SelectedItem.sothe;
                    Ngaybatdau = _SelectedItem.ngaybd_hienthi;
                    Ngayketthuc = _SelectedItem.ngaykt_hienthi;
                    Ghichu = _SelectedItem.ghichu;
                }
                OnPropertyChanged();
            }
        }

        #region SelectedItem.Property
        private string _Sothe;
        private string _Ngaybatdau;
        private string _Ngayketthuc;
        private string _Ghichu;

        public string Ngaybatdau
        {
            get { return _Ngaybatdau; }
            set { _Ngaybatdau = value; OnPropertyChanged(); }
        }
        public string Ngayketthuc
        {
            get { return _Ngayketthuc; }
            set { _Ngayketthuc = value; OnPropertyChanged(); }
        }

        public string Ghichu
        {
            get { return _Ghichu; }
            set { _Ghichu = value; OnPropertyChanged(); }
        }

        public string Sothe
        {
            get { return _Sothe; }
            set { _Sothe = value; OnPropertyChanged(); }
        }
        #endregion

        #region Command
        public ICommand Add_Command { get; set; }
        public ICommand Save_Command { get; set; }
        public ICommand Edit_Command { get; set; }
        public ICommand Delete_Command { get; set; }
        #endregion

        public Themuon_ViewModel()
        {
            List = new ObservableCollection<Model.Thethuvien>(Model.DataProvider.Ins.QLTV.Thethuviens);
            DateTime batdau = new DateTime();
            DateTime ketthuc = new DateTime();

            Add_Command = new RelayCommand<object>(p => 
            {
                return true;
            }, p => 
            {
                SelectedItem = null;
                Sothe = "";
                Ngaybatdau = "";
                Ngayketthuc = "";
                Ghichu = "";
            });
            //
            Save_Command = new RelayCommand<object>(p =>
            {
                if (string.IsNullOrEmpty(Ngayketthuc) || string.IsNullOrEmpty(Ngaybatdau))
                    return false;

                if (!DateTime.TryParse(Ngayketthuc, out ketthuc) || !DateTime.TryParse(Ngaybatdau, out batdau))
                    return false;

                if (Convert.ToDateTime(Ngayketthuc) < Convert.ToDateTime(Ngaybatdau))
                    return false;

                return true;
            }, p => 
            {
                Model.Thethuvien thethuvien = new Model.Thethuvien()
                {
                    sothe=Taoma(List.Count()),
                    ngaybd=Convert.ToDateTime(Ngaybatdau),
                    ngaybd_hienthi=Ngaybatdau,
                    ngaykt=Convert.ToDateTime(Ngayketthuc),
                    ngaykt_hienthi=Ngayketthuc,
                    ghichu=Ghichu
                };

                try
                {
                    Model.DataProvider.Ins.QLTV.Thethuviens.Add(thethuvien);
                    Model.DataProvider.Ins.QLTV.SaveChanges();

                    List.Insert(0,thethuvien);

                    SelectedItem = null;
                    Sothe = "";
                    Ngaybatdau = "";
                    Ngayketthuc = "";
                    Ghichu = "";

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

                if (string.IsNullOrEmpty(Ngayketthuc) || string.IsNullOrEmpty(Ngaybatdau))
                    return false;

                if (!DateTime.TryParse(Ngayketthuc, out ketthuc) || !DateTime.TryParse(Ngaybatdau, out batdau))
                    return false;

                if (Convert.ToDateTime(Ngayketthuc) < Convert.ToDateTime(Ngaybatdau))
                    return false;

                return true;
            }, p => 
            {
                var item = Model.DataProvider.Ins.QLTV.Thethuviens.Where(x => x.sothe == SelectedItem.sothe).SingleOrDefault();
                item.ngaybd_hienthi = Ngaybatdau;
                item.ngaybd = Convert.ToDateTime(Ngaybatdau);
                item.ngaykt_hienthi = Ngayketthuc;
                item.ngaykt = Convert.ToDateTime(Ngayketthuc);
                item.ghichu = Ghichu;

                try
                {
                    Model.DataProvider.Ins.QLTV.SaveChanges();

                    for (int i = 0; i < List.Count(); i++)
                    {
                        if (List[i]==SelectedItem)
                        {
                            List[i] = new Model.Thethuvien() 
                            {
                              sothe=Sothe,      
                              ngaybd_hienthi = Ngaybatdau,
                              ngaybd = Convert.ToDateTime(Ngaybatdau),
                              ngaykt_hienthi = Ngayketthuc,
                              ngaykt = Convert.ToDateTime(Ngayketthuc),
                              ghichu=Ghichu
                            };
                            break;
                        };
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
                        var item = Model.DataProvider.Ins.QLTV.Thethuviens.Where(x => x.sothe == ma).SingleOrDefault();
                        Model.DataProvider.Ins.QLTV.Thethuviens.Remove(item);
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
            string ma = "MATTV" + ((i + 1).ToString());
            return ma;
        }
    }
}
