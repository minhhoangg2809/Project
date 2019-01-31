using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections.ObjectModel;
using System.Windows.Input;
using System.Windows;
using System.Windows.Controls;

namespace Quanlythuvien.ViewModel
{
    public class Muontrasach_ViewModel : BaseViewModel
    {
        private ObservableCollection<Model.Muontra> _List;

        public ObservableCollection<Model.Muontra> List
        {
            get { return _List; }
            set { _List = value; OnPropertyChanged(); }
        }

        private Model.Muontra _SelectedItem;

        public Model.Muontra SelectedItem
        {
            get { return _SelectedItem; }
            set
            {
                _SelectedItem = value;
                if (_SelectedItem != null)
                {
                    SSothe = _SelectedItem.Docgia;
                    SSach = _SelectedItem.Sach;
                    Ngaymuon = _SelectedItem.ngaymuon_hienthi;
                    Trasach = _SelectedItem.datra;
                    Ngaytra = _SelectedItem.ngaytra_hienthi;
                }
                OnPropertyChanged();
            }
        }

        #region SelectedItem.Property
        private ObservableCollection<Model.Docgia> _ListSothe;
        private Model.Docgia _SSothe;
        private ObservableCollection<Model.Sach> _ListSach;
        private Model.Sach _SSach;
        private string _Ngaymuon;
        private string _Ngaytra;
        private bool _trasach;

        public bool Trasach
        {
            get { return _trasach; }
            set { _trasach = value; OnPropertyChanged(); }
        }

        public string Ngaytra
        {
            get { return _Ngaytra; }
            set { _Ngaytra = value; OnPropertyChanged(); }
        }

        public string Ngaymuon
        {
            get { return _Ngaymuon; }
            set { _Ngaymuon = value; OnPropertyChanged(); }
        }

        public Model.Sach SSach
        {
            get { return _SSach; }
            set { _SSach = value; OnPropertyChanged(); }
        }

        public ObservableCollection<Model.Sach> ListSach
        {
            get { return _ListSach; }
            set { _ListSach = value; OnPropertyChanged(); }
        }

        public Model.Docgia SSothe
        {
            get { return _SSothe; }
            set { _SSothe = value; OnPropertyChanged(); }
        }

        public ObservableCollection<Model.Docgia> ListSothe
        {
            get { return _ListSothe; }
            set { _ListSothe = value; OnPropertyChanged(); }
        }
        #endregion

        #region Command
        public ICommand Up_Command { get; set; }
        public ICommand Down_Command { get; set; }
        public ICommand Save_Command { get; set; }
        public ICommand Delete_Command { get; set; }
        #endregion

        public Muontrasach_ViewModel()
        {
            List = new ObservableCollection<Model.Muontra>(Model.DataProvider.Ins.QLTV.Muontras);
            ListSach = new ObservableCollection<Model.Sach>(Model.DataProvider.Ins.QLTV.Saches);
            ListSothe = new ObservableCollection<Model.Docgia>(Model.DataProvider.Ins.QLTV.Docgias);

            DateTime muon = new DateTime();
            DateTime tra = new DateTime();

            Up_Command = new RelayCommand<object>(p =>
            {
                return true;
            }, p =>
            {
                SelectedItem = null;
                SSach = null;
                SSothe = null;
                Trasach = false;
                Ngaymuon = "";
                Ngaytra = "";
            });
            //
            Save_Command = new RelayCommand<object>(p =>
            {
                if (Trasach == true)
                    return false;

                if (string.IsNullOrEmpty(Ngaymuon))
                    return false;

                if (!DateTime.TryParse(Ngaymuon, out muon))
                    return false;

                if (SSach == null || SSothe == null)
                    return false;

                return true;
            }, p =>
            {
                Model.Muontra muontra = new Model.Muontra()
                {
                    ma_muontra = Guid.NewGuid().ToString(),
                    Sach = SSach,
                    Docgia = SSothe,
                    ngaymuon = Convert.ToDateTime(Ngaymuon),
                    ngaymuon_hienthi = Ngaymuon,
                    ngaytra = null,
                    ngaytra_hienthi = "",
                    datra = Trasach,
                    ghichu = ""
                };

                try
                {
                    Model.DataProvider.Ins.QLTV.Muontras.Add(muontra);
                    Model.DataProvider.Ins.QLTV.SaveChanges();

                    List.Insert(0, muontra);

                    SelectedItem = null;
                    SSach = null;
                    SSothe = null;
                    Trasach = false;
                    Ngaymuon = "";
                    Ngaytra = "";

                    MessageBox.Show("Đã thêm thành công", "THÔNG BÁO");
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Đã xảy ra lỗi", "THÔNG BÁO");
                    MessageBox.Show(ex.Message);
                }
            });
            //
            Down_Command = new RelayCommand<object>(p =>
            {
                if (SelectedItem == null)
                    return false;

                if (Trasach == false)
                    return false;

                if (string.IsNullOrEmpty(Ngaymuon) || string.IsNullOrEmpty(Ngaytra))
                    return false;

                if (!DateTime.TryParse(Ngaymuon, out muon) || !DateTime.TryParse(Ngaytra, out tra))
                    return false;

                if (Convert.ToDateTime(Ngaytra) < Convert.ToDateTime(Ngaymuon))
                    return false;

                if (SSach == null || SSothe == null)
                    return false;

                return true;
            }, p =>
            {
                var item = Model.DataProvider.Ins.QLTV.Muontras.Where(x => x.ma_muontra == SelectedItem.ma_muontra).SingleOrDefault();
                item.datra = Trasach;
                item.ngaytra = Convert.ToDateTime(Ngaytra);
                item.ngaytra_hienthi = Ngaytra;
                item.ghichu = "Đã trả sách";

                try
                {
                    Model.DataProvider.Ins.QLTV.SaveChanges();

                    for (int i = 0; i < List.Count(); i++)
                    {
                        if (List[i] == SelectedItem)
                        {
                            List[i] = new Model.Muontra()
                            {
                                ma_muontra = SelectedItem.ma_muontra,
                                Sach = SSach,
                                Docgia = SSothe,
                                ghichu = SelectedItem.ghichu,
                                ngaytra_hienthi = Ngaytra,
                                ngaymuon_hienthi = SelectedItem.ngaymuon_hienthi,
                                datra = Trasach
                            };
                            break;
                        }
                    }
                    MessageBox.Show("Đã trả sách", "THÔNG BÁO");
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
                        var item = Model.DataProvider.Ins.QLTV.Muontras.Where(x => x.ma_muontra == ma).SingleOrDefault();
                        Model.DataProvider.Ins.QLTV.Muontras.Remove(item);
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
    }
}
