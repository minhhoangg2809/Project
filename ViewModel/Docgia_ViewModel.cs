using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections.ObjectModel;
using System.Windows;
using System.Windows.Input;
using System.Windows.Controls;

namespace Quanlythuvien.ViewModel
{
    public class Docgia_ViewModel : BaseViewModel
    {
        private ObservableCollection<Model.Docgia> _List;

        public ObservableCollection<Model.Docgia> List
        {
            get { return _List; }
            set { _List = value; OnPropertyChanged(); }
        }

        private Model.Docgia _SelectedItem;

        public Model.Docgia SelectedItem
        {
            get { return _SelectedItem; }
            set
            {
                _SelectedItem = value;
                if (_SelectedItem != null)
                {
                    Madocgia = _SelectedItem.ma_docgia;
                    Tendocgia = _SelectedItem.ten_docgia;
                    Diachi = _SelectedItem.diachi;
                    SThethuvien = _SelectedItem.Thethuvien;
                }
                OnPropertyChanged();
            }
        }

        #region SelectedItem.Property
        private int _Madocgia;
        private string _Tendocgia;
        private string _Diachi;
        private ObservableCollection<Model.Thethuvien> _ListThethuvien;
        private Model.Thethuvien _SThethuvien;

        public string Tendocgia
        {
            get { return _Tendocgia; }
            set { _Tendocgia = value; OnPropertyChanged(); }
        }
        public int Madocgia
        {
            get { return _Madocgia; }
            set { _Madocgia = value; OnPropertyChanged(); }
        }
        public Model.Thethuvien SThethuvien
        {
            get { return _SThethuvien; }
            set { _SThethuvien = value; OnPropertyChanged(); }
        }

        public ObservableCollection<Model.Thethuvien> ListThethuvien
        {
            get { return _ListThethuvien; }
            set { _ListThethuvien = value; OnPropertyChanged(); }
        }

        public string Diachi
        {
            get { return _Diachi; }
            set { _Diachi = value; OnPropertyChanged(); }
        }

        #endregion

        #region Command
        public ICommand Add_Command { get; set; }
        public ICommand Save_Command { get; set; }
        public ICommand Edit_Command { get; set; }
        public ICommand Delete_Command { get; set; }
        #endregion
        public Docgia_ViewModel()
        {
            List = new ObservableCollection<Model.Docgia>(Model.DataProvider.Ins.QLTV.Docgias);
            DSThethuvien();

            Add_Command = new RelayCommand<object>(p =>
            {
                return true;
            }, p =>
            {
                SelectedItem = null;
                Tendocgia = "";
                Diachi = "";
                SThethuvien = null;
            });
            //
            Save_Command = new RelayCommand<object>(p =>
            {
                if (string.IsNullOrEmpty(Tendocgia) || string.IsNullOrEmpty(Diachi) || SThethuvien == null)
                    return false;

                return true;
            }, p =>
            {
                var chk = List.Where(x => x.Thethuvien == SThethuvien).Count();
                if (chk == 0)
                {
                    Model.Docgia docgia = new Model.Docgia()
                    {
                        ma_docgia = Convert.ToInt32(Taoma()),
                        ten_docgia = Tendocgia,
                        diachi = Diachi,
                        Thethuvien = SThethuvien
                    };

                    try
                    {
                        Model.DataProvider.Ins.QLTV.Docgias.Add(docgia);
                        Model.DataProvider.Ins.QLTV.SaveChanges();

                        List.Insert(0, docgia);
                        MessageBox.Show("Thêm mới thành công", "THÔNG BÁO");

                        DSThethuvien();

                        SelectedItem = null;
                        Tendocgia = "";
                        Diachi = "";
                        SThethuvien = null;
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show("Đã xảy ra lỗi", "THÔNG BÁO");
                        MessageBox.Show(ex.Message);
                    }
                }
                else
                {
                    MessageBox.Show("Số thẻ đã được sử dụng", "THÔNG BÁO");
                    MessageBox.Show("TIP: Làm mới trang để lấy danh sách số thẻ khả dụng", "THÔNG BÁO", MessageBoxButton.OK, MessageBoxImage.Information);
                }

            });
            //
            Edit_Command = new RelayCommand<object>(p =>
            {
                if (SelectedItem == null)
                    return false;

                if (string.IsNullOrEmpty(Tendocgia) || string.IsNullOrEmpty(Diachi) || SThethuvien == null)
                    return false;

                return true;
            }, p =>
            {
                var item = Model.DataProvider.Ins.QLTV.Docgias.Where(x => x.ma_docgia == SelectedItem.ma_docgia).SingleOrDefault();
                item.ten_docgia = Tendocgia;
                item.diachi = Diachi;
                item.Thethuvien = SThethuvien;

                try
                {
                    Model.DataProvider.Ins.QLTV.SaveChanges();

                    for (int i = 0; i < List.Count(); i++)
                    {
                        if (List[i] == SelectedItem)
                        {
                            List[i] = new Model.Docgia()
                            {
                                ma_docgia = Madocgia,
                                ten_docgia = Tendocgia,
                                diachi = Diachi,
                                Thethuvien = SThethuvien
                            };
                            break;
                        }
                    }

                    MessageBox.Show("Chỉnh sửa thành công", "THÔNG BÁO");

                    DSThethuvien();
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
                        int ma = Convert.ToInt32(p.ToolTip);
                        var item = Model.DataProvider.Ins.QLTV.Docgias.Where(x => x.ma_docgia == ma).SingleOrDefault();
                        Model.DataProvider.Ins.QLTV.Docgias.Remove(item);
                        Model.DataProvider.Ins.QLTV.SaveChanges();

                        List.Remove(item);
                        MessageBox.Show("Xóa thành công", "THÔNG BÁO");

                        DSThethuvien();
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show("Đã xảy ra lỗi", "THÔNG BÁO");
                        MessageBox.Show(ex.Message);
                    }
                }

            });
        }
        private void DSThethuvien()
        {
            ListThethuvien = new ObservableCollection<Model.Thethuvien>(Model.DataProvider.Ins.QLTV.Thethuviens);

            for (int i = 0; i < ListThethuvien.Count(); i++)
            {
                while (List.Where(x => x.Thethuvien == ListThethuvien[i]).Count() != 0)
                {
                    if (ListThethuvien[i] == ListThethuvien[ListThethuvien.Count() - 1])
                    {
                        ListThethuvien.Remove(ListThethuvien[i]);
                        break;
                    }
                    else
                    {
                        ListThethuvien.Remove(ListThethuvien[i]);
                    }
                };
            }
        }
        private string Taoma()
        {
            string ma;

            Random rd = new Random();
            int s1 = rd.Next(1, 9);
            int s2 = rd.Next(1, 9);
            int s3 = rd.Next(1, 9);

            return ma = s1.ToString() + s2.ToString() + s3.ToString();
        }
    }
}
