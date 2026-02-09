using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OMS_WebForm.Models
{
    public class Orderse
    {
        [JsonProperty("orderId")] 
        public long OrderId { get; set; }
        [JsonProperty("userId")] 
        public long UserId { get; set; }
        [JsonProperty("orderDate")]
        public DateTime OrderDate { get; set; }
        [JsonProperty("orderStatus")] 
        public string OrderStatus { get; set; }
        [JsonProperty("createdAt")] 
        public DateTime CreatedAt { get; set; }
        [JsonProperty("updatedAt")] 
        public DateTime UpdatedAt { get; set; }
        [JsonProperty("totalAmount")]
        public decimal TotalAmount { get; set; }
    }
}