using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OMS_WebForm.Models
{
    public class PaymentReference
    {
        public int PaymentRefId { get; set; }
        public int OrderId { get; set; }
        public string PaymentMode { get; set; }
        public string TransactionRef { get; set; }
        public string PaymentStatus { get; set; }
        public DateTime PaidAt { get; set; }
    }
}