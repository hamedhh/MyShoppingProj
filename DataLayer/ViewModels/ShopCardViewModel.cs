﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLayer.ViewModels
{
    public class ShopCardItem
    {
        public int ProductID { get; set; }
        public int Count { get; set; }
    }

    public class ShopCardViewModel
    {
        public int ProductID { get; set; }
        public int Count { get; set; }
        public string ImageName { get; set; }
        public string Title { get; set; }
    }
}
