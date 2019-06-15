using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using DataLayer;

namespace MyEShoping.Controllers
{
    public class Api_ShopCardController : ApiController
    {
        EShoping_DBEntities db = new EShoping_DBEntities();


        // GET: api/Api_ShopCard
        public int Get()
        {
            List<DataLayer.ViewModels.ShopCardItem> _listcard = new List<DataLayer.ViewModels.ShopCardItem>();
            var session = HttpContext.Current.Session;
            if (session["ShopCard"] != null)
            {
                _listcard = session["ShopCard"] as List<DataLayer.ViewModels.ShopCardItem>;
            }
            return _listcard.Sum(a => a.Count);
        }

        // GET: api/Api_ShopCard/5
        public int Get(int id)
        {
            List<DataLayer.ViewModels.ShopCardItem> _listcard = new List<DataLayer.ViewModels.ShopCardItem>();
            var session = HttpContext.Current.Session;
            if (session["ShopCard"] != null)
            {
                _listcard = session["ShopCard"] as List<DataLayer.ViewModels.ShopCardItem>;
            }
            if (_listcard.Any(a => a.ProductID == id))
            {
                var index = _listcard.FindIndex(a => a.ProductID == id);
                _listcard[index].Count += 1;
            }
            else
            {
                _listcard.Add(new DataLayer.ViewModels.ShopCardItem()
                {
                    Count = 1,
                    ProductID = id
                });
            }
            session["ShopCard"] = _listcard;
            return Get();
        }

    }
}
