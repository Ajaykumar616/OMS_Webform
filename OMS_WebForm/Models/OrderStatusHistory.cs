using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OMS_WebForm.Models
{
    public class OrderStatusHistory
    {
        public int HistoryId { get; set; }
        public int OrderId { get; set; }
        public string OldStatus { get; set; }
        public string NewStatus { get; set; }
        public string ChangedBy { get; set; }
        public DateTime ChangedAt { get; set; }
        public string Reason { get; set; }
    }
}