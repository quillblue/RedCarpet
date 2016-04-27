﻿#pragma warning disable 1591
//------------------------------------------------------------------------------
// <auto-generated>
//     此代码由工具生成。
//     运行时版本:4.0.30319.34014
//
//     对此文件的更改可能会导致不正确的行为，并且如果
//     重新生成代码，这些更改将会丢失。
// </auto-generated>
//------------------------------------------------------------------------------

namespace hongtan.Models
{
	using System.Data.Linq;
	using System.Data.Linq.Mapping;
	using System.Data;
	using System.Collections.Generic;
	using System.Reflection;
	using System.Linq;
	using System.Linq.Expressions;
	using System.ComponentModel;
	using System;
	
	
	[global::System.Data.Linq.Mapping.DatabaseAttribute(Name="Vote")]
	public partial class bidDataContext : System.Data.Linq.DataContext
	{
		
		private static System.Data.Linq.Mapping.MappingSource mappingSource = new AttributeMappingSource();
		
    #region 可扩展性方法定义
    partial void OnCreated();
    partial void InsertBidModel(BidModel instance);
    partial void UpdateBidModel(BidModel instance);
    partial void DeleteBidModel(BidModel instance);
    #endregion
		
		public bidDataContext() : 
				base(global::System.Configuration.ConfigurationManager.ConnectionStrings["VoteConnectionString"].ConnectionString, mappingSource)
		{
			OnCreated();
		}
		
		public bidDataContext(string connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public bidDataContext(System.Data.IDbConnection connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public bidDataContext(string connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public bidDataContext(System.Data.IDbConnection connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public System.Data.Linq.Table<BidModel> hongtan_Vote
		{
			get
			{
				return this.GetTable<BidModel>();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.Hongtan_Vote")]
	public partial class BidModel : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _Id;
		
		private string _VoterIP;
		
		private System.DateTime _VoteDate;
		
		private System.DateTime _VoteTime;
		
		private string _VoteContent;
		
    #region 可扩展性方法定义
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnIdChanging(int value);
    partial void OnIdChanged();
    partial void OnVoterIPChanging(string value);
    partial void OnVoterIPChanged();
    partial void OnVoteDateChanging(System.DateTime value);
    partial void OnVoteDateChanged();
    partial void OnVoteTimeChanging(System.DateTime value);
    partial void OnVoteTimeChanged();
    partial void OnVoteContentChanging(string value);
    partial void OnVoteContentChanged();
    #endregion
		
		public BidModel()
		{
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Id", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
		public int Id
		{
			get
			{
				return this._Id;
			}
			set
			{
				if ((this._Id != value))
				{
					this.OnIdChanging(value);
					this.SendPropertyChanging();
					this._Id = value;
					this.SendPropertyChanged("Id");
					this.OnIdChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_VoterIP", DbType="VarChar(MAX) NOT NULL", CanBeNull=false)]
		public string VoterIP
		{
			get
			{
				return this._VoterIP;
			}
			set
			{
				if ((this._VoterIP != value))
				{
					this.OnVoterIPChanging(value);
					this.SendPropertyChanging();
					this._VoterIP = value;
					this.SendPropertyChanged("VoterIP");
					this.OnVoterIPChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_VoteDate", DbType="Datetime NOT NULL")]
		public System.DateTime VoteDate
		{
			get
			{
				return this._VoteDate;
			}
			set
			{
				if ((this._VoteDate != value))
				{
					this.OnVoteDateChanging(value);
					this.SendPropertyChanging();
					this._VoteDate = value;
					this.SendPropertyChanged("VoteDate");
					this.OnVoteDateChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_VoteTime", DbType="DateTime NOT NULL")]
		public System.DateTime VoteTime
		{
			get
			{
				return this._VoteTime;
			}
			set
			{
				if ((this._VoteTime != value))
				{
					this.OnVoteTimeChanging(value);
					this.SendPropertyChanging();
					this._VoteTime = value;
					this.SendPropertyChanged("VoteTime");
					this.OnVoteTimeChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_VoteContent", DbType="VarChar(200) NOT NULL", CanBeNull=false)]
		public string VoteContent
		{
			get
			{
				return this._VoteContent;
			}
			set
			{
				if ((this._VoteContent != value))
				{
					this.OnVoteContentChanging(value);
					this.SendPropertyChanging();
					this._VoteContent = value;
					this.SendPropertyChanged("VoteContent");
					this.OnVoteContentChanged();
				}
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
	}
}
#pragma warning restore 1591
