module RawBallotsHelper
  def all_companies
    if Lucite::Application.config.company_source == :remote
      RemoteMemberCompany.find(:all)
    else
      ProducingCompany.find(:all)
    end
  end
  
  def adjudicator_numbers
    [["Judge #1","1"], 
     ["Judge #2", "2"],
     ["Judge #3", "3"], 
     ["Judge #4", "4"], 
     ["Judge #5", "5"], 
     ["Alternate Judge", "A"]]
  end
  
  def performer_score_values
    [["10 - Excellent", "10"], 
     ["9.5", "9.5"], 
     ["9 - Outstanding", "9"],
     ["8.5", "8.5"],
     ["8 - Superior", "8"],
     ["7.5", "7.5"],
     ["7 - Noticeably Above Avg", "7"],
     ["6.5", "6.5"],
     ["6 - Slightly Above Avg", "6"],
     ["5.5", "5.5"],
     ["5 - Average", "5"],
     ["4.5", "4.5"],
     ["4 - Fair", "4"],
     ["3.5", "3.5"],
     ["3 - Noticeably Below Avg", "3"],
     ["2.5", "2.5"],
     ["2 - Poor", "2"],
     ["1.5", "1.5"],
     ["1 - Did Not Meet Criteria", "1"],
     ["N/I - Not Identifiable", "N/I"]]
  end

  def score_values
    [["10 - Excellent", "10"], 
     ["9.5", "9.5"], 
     ["9 - Outstanding", "9"],
     ["8.5", "8.5"],
     ["8 - Superior", "8"],
     ["7.5", "7.5"],
     ["7 - Noticeably Above Avg", "7"],
     ["6.5", "6.5"],
     ["6 - Slightly Above Avg", "6"],
     ["5.5", "5.5"],
     ["5 - Average", "5"],
     ["4.5", "4.5"],
     ["4 - Fair", "4"],
     ["3.5", "3.5"],
     ["3 - Noticeably Below Avg", "3"],
     ["2.5", "2.5"],
     ["2 - Poor", "2"],
     ["1.5", "1.5"],
     ["1 - Did Not Meet Criteria", "1"],
     ["N/A - Not Applicable", "N/A"]]
  end

  def gender_values
    [["Male","M"],
     ["Female","F"]]
  end

  def role_types
    [["Featured Role", "FEAT"],
     ["Lead Role", "LEAD"],
     ["Cameo Role", "CAMEO"]]
  end
  
end
