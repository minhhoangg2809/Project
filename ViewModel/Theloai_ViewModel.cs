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
    public class Theloai_ViewModel : BaseViewModel
    {
        private ObservableCollection<Model.Theloai> _List;

        public ObservableCollection<Model.Theloai> List
        {
            get { return _List; }
            set { _List = value; OnPropertyChanged(); }
        }

        private Model.Theloai _SelectedItem;

        public Model.Theloai SelectedItem
        {
            get { return _SelectedItem; }
            set
            {
                _SelectedItem = value;
                if (_SelectedItem != null)
                {
                    Matheloai = _SelectedItem.ma_theloai;
                    Tentheloai = _SelectedItem.ten_theloai;
                    Ghichu = _SelectedItem.ghichu;
                }
                OnPropertyChanged();
            }
        }

        #region SelectedItem.Property
        private string _Matheloai;
        private string _Tentheloai;
        private string _Ghichu;


        public string Matheloai
        {
            get { return _Matheloai; }
            set { _Matheloai = value; OnPropertyChanged(); }
        }

        public string Tentheloai
        {
            get { return _Tentheloai; }
            set { _Tentheloai = value; OnPropertyChanged(); }
        }

        public string Ghichu
        {
            get { return _Ghichu; }
            set { _Ghichu = value; OnPropertyChanged(); }
        }
        #endregion

        #region Command
        public ICommand Add_Command { get; set; }
        public ICommand Save_Command { get; set; }
        public ICommand Edit_Command { get; set; }
        public ICommand Delete_Command { get; set; }
        #endregion
        public Theloai_ViewModel()
        {
            List = new ObservableCollection<Model.Theloai>(Model.DataProvider.Ins.QLTV.Theloais);

            Add_Command = new RelayCommand<object>(p =>
            {
                return true;
            }, p =>
            {
                SelectedItem = null;
                Matheloai = "";
                Tentheloai = "";
                Ghichu = "";
            });
            //
            Edit_Command = new RelayCommand<object>(p =>
            {
                if (SelectedItem == null)
                    return false;

                if (string.IsNullOrEmpty(Tentheloai))
                    return false;

                return true;
            }, p =>
            {
                try
                {
                    var item = Model.DataProvider.Ins.QLTV.Theloais.Where(x => x.ma_theloai == SelectedItem.ma_theloai).SingleOrDefault();
                    item.ten_theloai = Kiemtraten(Tentheloai);
                    item.ghichu = Ghichu;

                    Model.DataProvider.Ins.QLTV.SaveChanges();

                    for (int i = 0; i < List.Count(); i++)
                    {
                        if (List[i] == SelectedItem)
                        {
                            List[i] = new Model.Theloai()
                            {
                                ma_theloai = Matheloai,
                                ten_theloai = Kiemtraten(Tentheloai),
                                ghichu = Ghichu
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
            Save_Command = new RelayCommand<object>(p =>
            {
                if (string.IsNullOrEmpty(Tentheloai))
                    return false;

                var kiemtra1 = Model.DataProvider.Ins.QLTV.Theloais.Where(x => x.ten_theloai == Tentheloai).Count();
                if (kiemtra1 != 0)
                    return false;

                return true;
            }, p =>
            {
                Model.Theloai tl = new Model.Theloai()
                {
                    ma_theloai = Taoma(List.Count()),
                    ten_theloai = Tentheloai,
                    ghichu = Ghichu
                };

                try
                {
                    Model.DataProvider.Ins.QLTV.Theloais.Add(tl);
                    Model.DataProvider.Ins.QLTV.SaveChanges();

                    List.Insert(0, tl);

                    SelectedItem = null;
                    Matheloai = "";
                    Tentheloai = "";
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
                        var item = Model.DataProvider.Ins.QLTV.Theloais.Where(x => x.ma_theloai == ma).SingleOrDefault();
                        Model.DataProvider.Ins.QLTV.Theloais.Remove(item);
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
            string ma = "TL" + ((i + 1).ToString());
            return ma;
        }
        private string Kiemtraten(string ten)
        {
            int i = List.Where(x => x.ten_theloai.Contains(ten)).Count();
            if (i != 0)
            {
                ten = ten + "(" + (i.ToString()) + ")";
            }
            return ten;
        }
    }
}
