//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace BanSanGo.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class LoaiSanGo
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public LoaiSanGo()
        {
            this.SanGoes = new HashSet<SanGo>();
        }
    
        public int MaLoaiSanGo { get; set; }
        public string TenLoaiSanGo { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SanGo> SanGoes { get; set; }
    }
}
