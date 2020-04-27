RSpec.describe Coronapp do
  it "has a version number" do
    expect(Coronapp::VERSION).not_to be nil
  end

  it "understands the meaning of the statistic" do
    expect(Coronapp::Stat.new.get_stat(:new)).to eq("new_daily_cases")
  end
    
  it "expects the statistic to be a string" do 
    expect(Coronapp::Stat.new.get_stat(:new)).to be_a_kind_of(String)
  end


end

