//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace TournamentOrganizer.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class Score
    {
        public long Id { get; set; }
        public byte Team1SetScore { get; set; }
        public byte Team2SetScore { get; set; }
        public Nullable<long> WinnerTeamId { get; set; }
    
        public virtual Team Team { get; set; }
    }
}
