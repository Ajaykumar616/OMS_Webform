using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OMS_WebForm.Models
{
    public class ShippingReference
    {
        public int ShippingId { get; set; }
        public int OrderId { get; set; }
        public string Carrier { get; set; }
        public string TrackingNumber { get; set; }
        public string ShippingStatus { get; set; }
        public DateTime? ShippedDate { get; set; }
        public DateTime? DeliveredDate { get; set; }
    }
}