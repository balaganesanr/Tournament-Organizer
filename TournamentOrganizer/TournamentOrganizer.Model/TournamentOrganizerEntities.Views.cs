//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System.Data.Entity.Infrastructure.MappingViews;

[assembly: DbMappingViewCacheTypeAttribute(
    typeof(TournamentOrganizer.Model.TournamentOrganizerEntities),
    typeof(Edm_EntityMappingGeneratedViews.ViewsForBaseEntitySets7e89b50c2f9796f2e88651b11f422355aaa8ad71baeb00f5c8cc4f0d8bfc257d))]

namespace Edm_EntityMappingGeneratedViews
{
    using System;
    using System.CodeDom.Compiler;
    using System.Data.Entity.Core.Metadata.Edm;

    /// <summary>
    /// Implements a mapping view cache.
    /// </summary>
    [GeneratedCode("Entity Framework Power Tools", "0.9.0.0")]
    internal sealed class ViewsForBaseEntitySets7e89b50c2f9796f2e88651b11f422355aaa8ad71baeb00f5c8cc4f0d8bfc257d : DbMappingViewCache
    {
        /// <summary>
        /// Gets a hash value computed over the mapping closure.
        /// </summary>
        public override string MappingHashValue
        {
            get { return "7e89b50c2f9796f2e88651b11f422355aaa8ad71baeb00f5c8cc4f0d8bfc257d"; }
        }

        /// <summary>
        /// Gets a view corresponding to the specified extent.
        /// </summary>
        /// <param name="extent">The extent.</param>
        /// <returns>The mapping view, or null if the extent is not associated with a mapping view.</returns>
        public override DbMappingView GetView(EntitySetBase extent)
        {
            if (extent == null)
            {
                throw new ArgumentNullException("extent");
            }

            var extentName = extent.EntityContainer.Name + "." + extent.Name;

            if (extentName == "TournamentOrganizerModelStoreContainer.Clients")
            {
                return GetView0();
            }

            if (extentName == "TournamentOrganizerEntities.Clients")
            {
                return GetView1();
            }

            if (extentName == "TournamentOrganizerModelStoreContainer.Game")
            {
                return GetView2();
            }

            if (extentName == "TournamentOrganizerModelStoreContainer.Gender")
            {
                return GetView3();
            }

            if (extentName == "TournamentOrganizerModelStoreContainer.Group")
            {
                return GetView4();
            }

            if (extentName == "TournamentOrganizerModelStoreContainer.GroupTeam")
            {
                return GetView5();
            }

            if (extentName == "TournamentOrganizerModelStoreContainer.Match")
            {
                return GetView6();
            }

            if (extentName == "TournamentOrganizerModelStoreContainer.Participant")
            {
                return GetView7();
            }

            if (extentName == "TournamentOrganizerModelStoreContainer.Role")
            {
                return GetView8();
            }

            if (extentName == "TournamentOrganizerModelStoreContainer.Score")
            {
                return GetView9();
            }

            if (extentName == "TournamentOrganizerModelStoreContainer.Stage")
            {
                return GetView10();
            }

            if (extentName == "TournamentOrganizerModelStoreContainer.Subdivision")
            {
                return GetView11();
            }

            if (extentName == "TournamentOrganizerModelStoreContainer.Team")
            {
                return GetView12();
            }

            if (extentName == "TournamentOrganizerModelStoreContainer.TeamParticipant")
            {
                return GetView13();
            }

            if (extentName == "TournamentOrganizerModelStoreContainer.Tournament")
            {
                return GetView14();
            }

            if (extentName == "TournamentOrganizerModelStoreContainer.User")
            {
                return GetView15();
            }

            if (extentName == "TournamentOrganizerModelStoreContainer.UserState")
            {
                return GetView16();
            }

            if (extentName == "TournamentOrganizerEntities.Games")
            {
                return GetView17();
            }

            if (extentName == "TournamentOrganizerEntities.Genders")
            {
                return GetView18();
            }

            if (extentName == "TournamentOrganizerEntities.Groups")
            {
                return GetView19();
            }

            if (extentName == "TournamentOrganizerEntities.GroupTeams")
            {
                return GetView20();
            }

            if (extentName == "TournamentOrganizerEntities.Matches")
            {
                return GetView21();
            }

            if (extentName == "TournamentOrganizerEntities.Participants")
            {
                return GetView22();
            }

            if (extentName == "TournamentOrganizerEntities.Roles")
            {
                return GetView23();
            }

            if (extentName == "TournamentOrganizerEntities.Scores")
            {
                return GetView24();
            }

            if (extentName == "TournamentOrganizerEntities.Stages")
            {
                return GetView25();
            }

            if (extentName == "TournamentOrganizerEntities.Subdivisions")
            {
                return GetView26();
            }

            if (extentName == "TournamentOrganizerEntities.Teams")
            {
                return GetView27();
            }

            if (extentName == "TournamentOrganizerEntities.TeamParticipants")
            {
                return GetView28();
            }

            if (extentName == "TournamentOrganizerEntities.Tournaments")
            {
                return GetView29();
            }

            if (extentName == "TournamentOrganizerEntities.Users")
            {
                return GetView30();
            }

            if (extentName == "TournamentOrganizerEntities.UserStates")
            {
                return GetView31();
            }

            if (extentName == "TournamentOrganizerModelStoreContainer.RefreshTokens")
            {
                return GetView32();
            }

            if (extentName == "TournamentOrganizerEntities.RefreshTokens")
            {
                return GetView33();
            }

            return null;
        }

        /// <summary>
        /// Gets the view for TournamentOrganizerModelStoreContainer.Clients.
        /// </summary>
        /// <returns>The mapping view.</returns>
        private static DbMappingView GetView0()
        {
            return new DbMappingView(@"
    SELECT VALUE -- Constructing Clients
        [TournamentOrganizerModel.Store.Clients](T1.Clients_Id, T1.Clients_Secret, T1.Clients_Name, T1.Clients_ApplicationType, T1.Clients_Active, T1.Clients_RefreshTokenLifeTime, T1.Clients_AllowedOrigin)
    FROM (
        SELECT 
            T.Id AS Clients_Id, 
            T.Secret AS Clients_Secret, 
            T.Name AS Clients_Name, 
            T.ApplicationType AS Clients_ApplicationType, 
            T.Active AS Clients_Active, 
            T.RefreshTokenLifeTime AS Clients_RefreshTokenLifeTime, 
            T.AllowedOrigin AS Clients_AllowedOrigin, 
            True AS _from0
        FROM TournamentOrganizerEntities.Clients AS T
    ) AS T1");
        }

        /// <summary>
        /// Gets the view for TournamentOrganizerEntities.Clients.
        /// </summary>
        /// <returns>The mapping view.</returns>
        private static DbMappingView GetView1()
        {
            return new DbMappingView(@"
    SELECT VALUE -- Constructing Clients
        [TournamentOrganizerModel.Client](T1.Client_Id, T1.Client_Secret, T1.Client_Name, T1.Client_ApplicationType, T1.Client_Active, T1.Client_RefreshTokenLifeTime, T1.Client_AllowedOrigin)
    FROM (
        SELECT 
            T.Id AS Client_Id, 
            T.Secret AS Client_Secret, 
            T.Name AS Client_Name, 
            T.ApplicationType AS Client_ApplicationType, 
            T.Active AS Client_Active, 
            T.RefreshTokenLifeTime AS Client_RefreshTokenLifeTime, 
            T.AllowedOrigin AS Client_AllowedOrigin, 
            True AS _from0
        FROM TournamentOrganizerModelStoreContainer.Clients AS T
    ) AS T1");
        }

        /// <summary>
        /// Gets the view for TournamentOrganizerModelStoreContainer.Game.
        /// </summary>
        /// <returns>The mapping view.</returns>
        private static DbMappingView GetView2()
        {
            return new DbMappingView(@"
    SELECT VALUE -- Constructing Game
        [TournamentOrganizerModel.Store.Game](T1.Game_Id, T1.Game_Name)
    FROM (
        SELECT 
            T.Id AS Game_Id, 
            T.Name AS Game_Name, 
            True AS _from0
        FROM TournamentOrganizerEntities.Games AS T
    ) AS T1");
        }

        /// <summary>
        /// Gets the view for TournamentOrganizerModelStoreContainer.Gender.
        /// </summary>
        /// <returns>The mapping view.</returns>
        private static DbMappingView GetView3()
        {
            return new DbMappingView(@"
    SELECT VALUE -- Constructing Gender
        [TournamentOrganizerModel.Store.Gender](T1.Gender_ID, T1.Gender_Name)
    FROM (
        SELECT 
            T.ID AS Gender_ID, 
            T.Name AS Gender_Name, 
            True AS _from0
        FROM TournamentOrganizerEntities.Genders AS T
    ) AS T1");
        }

        /// <summary>
        /// Gets the view for TournamentOrganizerModelStoreContainer.Group.
        /// </summary>
        /// <returns>The mapping view.</returns>
        private static DbMappingView GetView4()
        {
            return new DbMappingView(@"
    SELECT VALUE -- Constructing Group
        [TournamentOrganizerModel.Store.Group](T1.Group_Id, T1.Group_Name, T1.Group_StageId)
    FROM (
        SELECT 
            T.Id AS Group_Id, 
            T.Name AS Group_Name, 
            T.StageId AS Group_StageId, 
            True AS _from0
        FROM TournamentOrganizerEntities.Groups AS T
    ) AS T1");
        }

        /// <summary>
        /// Gets the view for TournamentOrganizerModelStoreContainer.GroupTeam.
        /// </summary>
        /// <returns>The mapping view.</returns>
        private static DbMappingView GetView5()
        {
            return new DbMappingView(@"
    SELECT VALUE -- Constructing GroupTeam
        [TournamentOrganizerModel.Store.GroupTeam](T1.GroupTeam_Id, T1.GroupTeam_GroupId, T1.GroupTeam_TeamId)
    FROM (
        SELECT 
            T.Id AS GroupTeam_Id, 
            T.GroupId AS GroupTeam_GroupId, 
            T.TeamId AS GroupTeam_TeamId, 
            True AS _from0
        FROM TournamentOrganizerEntities.GroupTeams AS T
    ) AS T1");
        }

        /// <summary>
        /// Gets the view for TournamentOrganizerModelStoreContainer.Match.
        /// </summary>
        /// <returns>The mapping view.</returns>
        private static DbMappingView GetView6()
        {
            return new DbMappingView(@"
    SELECT VALUE -- Constructing Match
        [TournamentOrganizerModel.Store.Match](T1.Match_Id, T1.Match_StageId, T1.Match_Team1Id, T1.Match_Team2Id, T1.Match_ScheduledDate, T1.Match_WinnerTeamId)
    FROM (
        SELECT 
            T.Id AS Match_Id, 
            T.StageId AS Match_StageId, 
            T.Team1Id AS Match_Team1Id, 
            T.Team2Id AS Match_Team2Id, 
            T.ScheduledDate AS Match_ScheduledDate, 
            T.WinnerTeamId AS Match_WinnerTeamId, 
            True AS _from0
        FROM TournamentOrganizerEntities.Matches AS T
    ) AS T1");
        }

        /// <summary>
        /// Gets the view for TournamentOrganizerModelStoreContainer.Participant.
        /// </summary>
        /// <returns>The mapping view.</returns>
        private static DbMappingView GetView7()
        {
            return new DbMappingView(@"
    SELECT VALUE -- Constructing Participant
        [TournamentOrganizerModel.Store.Participant](T1.Participant_Id, T1.Participant_UserId, T1.Participant_SubdivisionId)
    FROM (
        SELECT 
            T.Id AS Participant_Id, 
            T.UserId AS Participant_UserId, 
            T.SubdivisionId AS Participant_SubdivisionId, 
            True AS _from0
        FROM TournamentOrganizerEntities.Participants AS T
    ) AS T1");
        }

        /// <summary>
        /// Gets the view for TournamentOrganizerModelStoreContainer.Role.
        /// </summary>
        /// <returns>The mapping view.</returns>
        private static DbMappingView GetView8()
        {
            return new DbMappingView(@"
    SELECT VALUE -- Constructing Role
        [TournamentOrganizerModel.Store.Role](T1.Role_Id, T1.Role_Name)
    FROM (
        SELECT 
            T.Id AS Role_Id, 
            T.Name AS Role_Name, 
            True AS _from0
        FROM TournamentOrganizerEntities.Roles AS T
    ) AS T1");
        }

        /// <summary>
        /// Gets the view for TournamentOrganizerModelStoreContainer.Score.
        /// </summary>
        /// <returns>The mapping view.</returns>
        private static DbMappingView GetView9()
        {
            return new DbMappingView(@"
    SELECT VALUE -- Constructing Score
        [TournamentOrganizerModel.Store.Score](T1.Score_Id, T1.Score_Team1SetScore, T1.Score_Team2SetScore, T1.Score_WinnerTeamId)
    FROM (
        SELECT 
            T.Id AS Score_Id, 
            T.Team1SetScore AS Score_Team1SetScore, 
            T.Team2SetScore AS Score_Team2SetScore, 
            T.WinnerTeamId AS Score_WinnerTeamId, 
            True AS _from0
        FROM TournamentOrganizerEntities.Scores AS T
    ) AS T1");
        }

        /// <summary>
        /// Gets the view for TournamentOrganizerModelStoreContainer.Stage.
        /// </summary>
        /// <returns>The mapping view.</returns>
        private static DbMappingView GetView10()
        {
            return new DbMappingView(@"
    SELECT VALUE -- Constructing Stage
        [TournamentOrganizerModel.Store.Stage](T1.Stage_Id, T1.Stage_Name, T1.Stage_SubdivisionId)
    FROM (
        SELECT 
            T.Id AS Stage_Id, 
            T.Name AS Stage_Name, 
            T.SubdivisionId AS Stage_SubdivisionId, 
            True AS _from0
        FROM TournamentOrganizerEntities.Stages AS T
    ) AS T1");
        }

        /// <summary>
        /// Gets the view for TournamentOrganizerModelStoreContainer.Subdivision.
        /// </summary>
        /// <returns>The mapping view.</returns>
        private static DbMappingView GetView11()
        {
            return new DbMappingView(@"
    SELECT VALUE -- Constructing Subdivision
        [TournamentOrganizerModel.Store.Subdivision](T1.Subdivision_Id, T1.Subdivision_Name, T1.Subdivision_TournamentId)
    FROM (
        SELECT 
            T.Id AS Subdivision_Id, 
            T.Name AS Subdivision_Name, 
            T.TournamentId AS Subdivision_TournamentId, 
            True AS _from0
        FROM TournamentOrganizerEntities.Subdivisions AS T
    ) AS T1");
        }

        /// <summary>
        /// Gets the view for TournamentOrganizerModelStoreContainer.Team.
        /// </summary>
        /// <returns>The mapping view.</returns>
        private static DbMappingView GetView12()
        {
            return new DbMappingView(@"
    SELECT VALUE -- Constructing Team
        [TournamentOrganizerModel.Store.Team](T1.Team_Id, T1.Team_Name, T1.Team_SubdivisionId)
    FROM (
        SELECT 
            T.Id AS Team_Id, 
            T.Name AS Team_Name, 
            T.SubdivisionId AS Team_SubdivisionId, 
            True AS _from0
        FROM TournamentOrganizerEntities.Teams AS T
    ) AS T1");
        }

        /// <summary>
        /// Gets the view for TournamentOrganizerModelStoreContainer.TeamParticipant.
        /// </summary>
        /// <returns>The mapping view.</returns>
        private static DbMappingView GetView13()
        {
            return new DbMappingView(@"
    SELECT VALUE -- Constructing TeamParticipant
        [TournamentOrganizerModel.Store.TeamParticipant](T1.TeamParticipant_Id, T1.TeamParticipant_TeamId, T1.TeamParticipant_ParticipantId)
    FROM (
        SELECT 
            T.Id AS TeamParticipant_Id, 
            T.TeamId AS TeamParticipant_TeamId, 
            T.ParticipantId AS TeamParticipant_ParticipantId, 
            True AS _from0
        FROM TournamentOrganizerEntities.TeamParticipants AS T
    ) AS T1");
        }

        /// <summary>
        /// Gets the view for TournamentOrganizerModelStoreContainer.Tournament.
        /// </summary>
        /// <returns>The mapping view.</returns>
        private static DbMappingView GetView14()
        {
            return new DbMappingView(@"
    SELECT VALUE -- Constructing Tournament
        [TournamentOrganizerModel.Store.Tournament](T1.Tournament_Id, T1.Tournament_Name, T1.Tournament_GameId)
    FROM (
        SELECT 
            T.Id AS Tournament_Id, 
            T.Name AS Tournament_Name, 
            T.GameId AS Tournament_GameId, 
            True AS _from0
        FROM TournamentOrganizerEntities.Tournaments AS T
    ) AS T1");
        }

        /// <summary>
        /// Gets the view for TournamentOrganizerModelStoreContainer.User.
        /// </summary>
        /// <returns>The mapping view.</returns>
        private static DbMappingView GetView15()
        {
            return new DbMappingView(@"
    SELECT VALUE -- Constructing User
        [TournamentOrganizerModel.Store.User](T1.User_Id, T1.User_Username, T1.User_Password, T1.User_Name, T1.User_Avatar, T1.User_GenderId, T1.User_RoleId, T1.User_StatusId, T1.User_IsDeleted, T1.User_LastLoginDate, T1.User_LastPasswordChangedDate, T1.User_ForgotPasswordToken, T1.User_ForgotPasswordTokenSentOn, T1.User_CreatedBy, T1.User_CreatedOn, T1.User_ModifiedBy, T1.User_ModifiedOn, T1.User_SecurityStamp)
    FROM (
        SELECT 
            T.Id AS User_Id, 
            T.Username AS User_Username, 
            T.Password AS User_Password, 
            T.Name AS User_Name, 
            T.Avatar AS User_Avatar, 
            T.GenderId AS User_GenderId, 
            T.RoleId AS User_RoleId, 
            T.StatusId AS User_StatusId, 
            T.IsDeleted AS User_IsDeleted, 
            T.LastLoginDate AS User_LastLoginDate, 
            T.LastPasswordChangedDate AS User_LastPasswordChangedDate, 
            T.ForgotPasswordToken AS User_ForgotPasswordToken, 
            T.ForgotPasswordTokenSentOn AS User_ForgotPasswordTokenSentOn, 
            T.CreatedBy AS User_CreatedBy, 
            T.CreatedOn AS User_CreatedOn, 
            T.ModifiedBy AS User_ModifiedBy, 
            T.ModifiedOn AS User_ModifiedOn, 
            T.SecurityStamp AS User_SecurityStamp, 
            True AS _from0
        FROM TournamentOrganizerEntities.Users AS T
    ) AS T1");
        }

        /// <summary>
        /// Gets the view for TournamentOrganizerModelStoreContainer.UserState.
        /// </summary>
        /// <returns>The mapping view.</returns>
        private static DbMappingView GetView16()
        {
            return new DbMappingView(@"
    SELECT VALUE -- Constructing UserState
        [TournamentOrganizerModel.Store.UserState](T1.UserState_Id, T1.UserState_Name)
    FROM (
        SELECT 
            T.Id AS UserState_Id, 
            T.Name AS UserState_Name, 
            True AS _from0
        FROM TournamentOrganizerEntities.UserStates AS T
    ) AS T1");
        }

        /// <summary>
        /// Gets the view for TournamentOrganizerEntities.Games.
        /// </summary>
        /// <returns>The mapping view.</returns>
        private static DbMappingView GetView17()
        {
            return new DbMappingView(@"
    SELECT VALUE -- Constructing Games
        [TournamentOrganizerModel.Game](T1.Game_Id, T1.Game_Name)
    FROM (
        SELECT 
            T.Id AS Game_Id, 
            T.Name AS Game_Name, 
            True AS _from0
        FROM TournamentOrganizerModelStoreContainer.Game AS T
    ) AS T1");
        }

        /// <summary>
        /// Gets the view for TournamentOrganizerEntities.Genders.
        /// </summary>
        /// <returns>The mapping view.</returns>
        private static DbMappingView GetView18()
        {
            return new DbMappingView(@"
    SELECT VALUE -- Constructing Genders
        [TournamentOrganizerModel.Gender](T1.Gender_ID, T1.Gender_Name)
    FROM (
        SELECT 
            T.ID AS Gender_ID, 
            T.Name AS Gender_Name, 
            True AS _from0
        FROM TournamentOrganizerModelStoreContainer.Gender AS T
    ) AS T1");
        }

        /// <summary>
        /// Gets the view for TournamentOrganizerEntities.Groups.
        /// </summary>
        /// <returns>The mapping view.</returns>
        private static DbMappingView GetView19()
        {
            return new DbMappingView(@"
    SELECT VALUE -- Constructing Groups
        [TournamentOrganizerModel.Group](T1.Group_Id, T1.Group_Name, T1.Group_StageId)
    FROM (
        SELECT 
            T.Id AS Group_Id, 
            T.Name AS Group_Name, 
            T.StageId AS Group_StageId, 
            True AS _from0
        FROM TournamentOrganizerModelStoreContainer.[Group] AS T
    ) AS T1");
        }

        /// <summary>
        /// Gets the view for TournamentOrganizerEntities.GroupTeams.
        /// </summary>
        /// <returns>The mapping view.</returns>
        private static DbMappingView GetView20()
        {
            return new DbMappingView(@"
    SELECT VALUE -- Constructing GroupTeams
        [TournamentOrganizerModel.GroupTeam](T1.GroupTeam_Id, T1.GroupTeam_GroupId, T1.GroupTeam_TeamId)
    FROM (
        SELECT 
            T.Id AS GroupTeam_Id, 
            T.GroupId AS GroupTeam_GroupId, 
            T.TeamId AS GroupTeam_TeamId, 
            True AS _from0
        FROM TournamentOrganizerModelStoreContainer.GroupTeam AS T
    ) AS T1");
        }

        /// <summary>
        /// Gets the view for TournamentOrganizerEntities.Matches.
        /// </summary>
        /// <returns>The mapping view.</returns>
        private static DbMappingView GetView21()
        {
            return new DbMappingView(@"
    SELECT VALUE -- Constructing Matches
        [TournamentOrganizerModel.Match](T1.Match_Id, T1.Match_StageId, T1.Match_Team1Id, T1.Match_Team2Id, T1.Match_ScheduledDate, T1.Match_WinnerTeamId)
    FROM (
        SELECT 
            T.Id AS Match_Id, 
            T.StageId AS Match_StageId, 
            T.Team1Id AS Match_Team1Id, 
            T.Team2Id AS Match_Team2Id, 
            T.ScheduledDate AS Match_ScheduledDate, 
            T.WinnerTeamId AS Match_WinnerTeamId, 
            True AS _from0
        FROM TournamentOrganizerModelStoreContainer.Match AS T
    ) AS T1");
        }

        /// <summary>
        /// Gets the view for TournamentOrganizerEntities.Participants.
        /// </summary>
        /// <returns>The mapping view.</returns>
        private static DbMappingView GetView22()
        {
            return new DbMappingView(@"
    SELECT VALUE -- Constructing Participants
        [TournamentOrganizerModel.Participant](T1.Participant_Id, T1.Participant_UserId, T1.Participant_SubdivisionId)
    FROM (
        SELECT 
            T.Id AS Participant_Id, 
            T.UserId AS Participant_UserId, 
            T.SubdivisionId AS Participant_SubdivisionId, 
            True AS _from0
        FROM TournamentOrganizerModelStoreContainer.Participant AS T
    ) AS T1");
        }

        /// <summary>
        /// Gets the view for TournamentOrganizerEntities.Roles.
        /// </summary>
        /// <returns>The mapping view.</returns>
        private static DbMappingView GetView23()
        {
            return new DbMappingView(@"
    SELECT VALUE -- Constructing Roles
        [TournamentOrganizerModel.Role](T1.Role_Id, T1.Role_Name)
    FROM (
        SELECT 
            T.Id AS Role_Id, 
            T.Name AS Role_Name, 
            True AS _from0
        FROM TournamentOrganizerModelStoreContainer.Role AS T
    ) AS T1");
        }

        /// <summary>
        /// Gets the view for TournamentOrganizerEntities.Scores.
        /// </summary>
        /// <returns>The mapping view.</returns>
        private static DbMappingView GetView24()
        {
            return new DbMappingView(@"
    SELECT VALUE -- Constructing Scores
        [TournamentOrganizerModel.Score](T1.Score_Id, T1.Score_Team1SetScore, T1.Score_Team2SetScore, T1.Score_WinnerTeamId)
    FROM (
        SELECT 
            T.Id AS Score_Id, 
            T.Team1SetScore AS Score_Team1SetScore, 
            T.Team2SetScore AS Score_Team2SetScore, 
            T.WinnerTeamId AS Score_WinnerTeamId, 
            True AS _from0
        FROM TournamentOrganizerModelStoreContainer.Score AS T
    ) AS T1");
        }

        /// <summary>
        /// Gets the view for TournamentOrganizerEntities.Stages.
        /// </summary>
        /// <returns>The mapping view.</returns>
        private static DbMappingView GetView25()
        {
            return new DbMappingView(@"
    SELECT VALUE -- Constructing Stages
        [TournamentOrganizerModel.Stage](T1.Stage_Id, T1.Stage_Name, T1.Stage_SubdivisionId)
    FROM (
        SELECT 
            T.Id AS Stage_Id, 
            T.Name AS Stage_Name, 
            T.SubdivisionId AS Stage_SubdivisionId, 
            True AS _from0
        FROM TournamentOrganizerModelStoreContainer.Stage AS T
    ) AS T1");
        }

        /// <summary>
        /// Gets the view for TournamentOrganizerEntities.Subdivisions.
        /// </summary>
        /// <returns>The mapping view.</returns>
        private static DbMappingView GetView26()
        {
            return new DbMappingView(@"
    SELECT VALUE -- Constructing Subdivisions
        [TournamentOrganizerModel.Subdivision](T1.Subdivision_Id, T1.Subdivision_Name, T1.Subdivision_TournamentId)
    FROM (
        SELECT 
            T.Id AS Subdivision_Id, 
            T.Name AS Subdivision_Name, 
            T.TournamentId AS Subdivision_TournamentId, 
            True AS _from0
        FROM TournamentOrganizerModelStoreContainer.Subdivision AS T
    ) AS T1");
        }

        /// <summary>
        /// Gets the view for TournamentOrganizerEntities.Teams.
        /// </summary>
        /// <returns>The mapping view.</returns>
        private static DbMappingView GetView27()
        {
            return new DbMappingView(@"
    SELECT VALUE -- Constructing Teams
        [TournamentOrganizerModel.Team](T1.Team_Id, T1.Team_Name, T1.Team_SubdivisionId)
    FROM (
        SELECT 
            T.Id AS Team_Id, 
            T.Name AS Team_Name, 
            T.SubdivisionId AS Team_SubdivisionId, 
            True AS _from0
        FROM TournamentOrganizerModelStoreContainer.Team AS T
    ) AS T1");
        }

        /// <summary>
        /// Gets the view for TournamentOrganizerEntities.TeamParticipants.
        /// </summary>
        /// <returns>The mapping view.</returns>
        private static DbMappingView GetView28()
        {
            return new DbMappingView(@"
    SELECT VALUE -- Constructing TeamParticipants
        [TournamentOrganizerModel.TeamParticipant](T1.TeamParticipant_Id, T1.TeamParticipant_TeamId, T1.TeamParticipant_ParticipantId)
    FROM (
        SELECT 
            T.Id AS TeamParticipant_Id, 
            T.TeamId AS TeamParticipant_TeamId, 
            T.ParticipantId AS TeamParticipant_ParticipantId, 
            True AS _from0
        FROM TournamentOrganizerModelStoreContainer.TeamParticipant AS T
    ) AS T1");
        }

        /// <summary>
        /// Gets the view for TournamentOrganizerEntities.Tournaments.
        /// </summary>
        /// <returns>The mapping view.</returns>
        private static DbMappingView GetView29()
        {
            return new DbMappingView(@"
    SELECT VALUE -- Constructing Tournaments
        [TournamentOrganizerModel.Tournament](T1.Tournament_Id, T1.Tournament_Name, T1.Tournament_GameId)
    FROM (
        SELECT 
            T.Id AS Tournament_Id, 
            T.Name AS Tournament_Name, 
            T.GameId AS Tournament_GameId, 
            True AS _from0
        FROM TournamentOrganizerModelStoreContainer.Tournament AS T
    ) AS T1");
        }

        /// <summary>
        /// Gets the view for TournamentOrganizerEntities.Users.
        /// </summary>
        /// <returns>The mapping view.</returns>
        private static DbMappingView GetView30()
        {
            return new DbMappingView(@"
    SELECT VALUE -- Constructing Users
        [TournamentOrganizerModel.User](T1.User_Id, T1.User_Username, T1.User_Password, T1.User_Name, T1.User_Avatar, T1.User_GenderId, T1.User_RoleId, T1.User_StatusId, T1.User_IsDeleted, T1.User_LastLoginDate, T1.User_LastPasswordChangedDate, T1.User_ForgotPasswordToken, T1.User_ForgotPasswordTokenSentOn, T1.User_CreatedBy, T1.User_CreatedOn, T1.User_ModifiedBy, T1.User_ModifiedOn, T1.User_SecurityStamp)
    FROM (
        SELECT 
            T.Id AS User_Id, 
            T.Username AS User_Username, 
            T.Password AS User_Password, 
            T.Name AS User_Name, 
            T.Avatar AS User_Avatar, 
            T.GenderId AS User_GenderId, 
            T.RoleId AS User_RoleId, 
            T.StatusId AS User_StatusId, 
            T.IsDeleted AS User_IsDeleted, 
            T.LastLoginDate AS User_LastLoginDate, 
            T.LastPasswordChangedDate AS User_LastPasswordChangedDate, 
            T.ForgotPasswordToken AS User_ForgotPasswordToken, 
            T.ForgotPasswordTokenSentOn AS User_ForgotPasswordTokenSentOn, 
            T.CreatedBy AS User_CreatedBy, 
            T.CreatedOn AS User_CreatedOn, 
            T.ModifiedBy AS User_ModifiedBy, 
            T.ModifiedOn AS User_ModifiedOn, 
            T.SecurityStamp AS User_SecurityStamp, 
            True AS _from0
        FROM TournamentOrganizerModelStoreContainer.User AS T
    ) AS T1");
        }

        /// <summary>
        /// Gets the view for TournamentOrganizerEntities.UserStates.
        /// </summary>
        /// <returns>The mapping view.</returns>
        private static DbMappingView GetView31()
        {
            return new DbMappingView(@"
    SELECT VALUE -- Constructing UserStates
        [TournamentOrganizerModel.UserState](T1.UserState_Id, T1.UserState_Name)
    FROM (
        SELECT 
            T.Id AS UserState_Id, 
            T.Name AS UserState_Name, 
            True AS _from0
        FROM TournamentOrganizerModelStoreContainer.UserState AS T
    ) AS T1");
        }

        /// <summary>
        /// Gets the view for TournamentOrganizerModelStoreContainer.RefreshTokens.
        /// </summary>
        /// <returns>The mapping view.</returns>
        private static DbMappingView GetView32()
        {
            return new DbMappingView(@"
    SELECT VALUE -- Constructing RefreshTokens
        [TournamentOrganizerModel.Store.RefreshTokens](T1.RefreshTokens_Id, T1.RefreshTokens_Username, T1.RefreshTokens_ClientId, T1.RefreshTokens_IssuedUtc, T1.RefreshTokens_ExpiresUtc, T1.RefreshTokens_ProtectedTicket)
    FROM (
        SELECT 
            T.Id AS RefreshTokens_Id, 
            T.Username AS RefreshTokens_Username, 
            T.ClientId AS RefreshTokens_ClientId, 
            T.IssuedUtc AS RefreshTokens_IssuedUtc, 
            T.ExpiresUtc AS RefreshTokens_ExpiresUtc, 
            T.ProtectedTicket AS RefreshTokens_ProtectedTicket, 
            True AS _from0
        FROM TournamentOrganizerEntities.RefreshTokens AS T
    ) AS T1");
        }

        /// <summary>
        /// Gets the view for TournamentOrganizerEntities.RefreshTokens.
        /// </summary>
        /// <returns>The mapping view.</returns>
        private static DbMappingView GetView33()
        {
            return new DbMappingView(@"
    SELECT VALUE -- Constructing RefreshTokens
        [TournamentOrganizerModel.RefreshToken](T1.RefreshToken_Id, T1.RefreshToken_Username, T1.RefreshToken_ClientId, T1.RefreshToken_IssuedUtc, T1.RefreshToken_ExpiresUtc, T1.RefreshToken_ProtectedTicket)
    FROM (
        SELECT 
            T.Id AS RefreshToken_Id, 
            T.Username AS RefreshToken_Username, 
            T.ClientId AS RefreshToken_ClientId, 
            T.IssuedUtc AS RefreshToken_IssuedUtc, 
            T.ExpiresUtc AS RefreshToken_ExpiresUtc, 
            T.ProtectedTicket AS RefreshToken_ProtectedTicket, 
            True AS _from0
        FROM TournamentOrganizerModelStoreContainer.RefreshTokens AS T
    ) AS T1");
        }
    }
}
