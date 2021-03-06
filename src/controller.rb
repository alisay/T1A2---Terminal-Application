#ruby
#!/usr/bin/env ruby 

require "./model.rb"
require "optparse"
require "optparse/date"


options = {}

parser = OptionParser.new do |opt|
      
    opt.on("-c", "--country [VALUE]", "[COUNTRY CODES]

    AF Afghanistan      DE Germany          PK Pakistan
    AL Albania	        GH Ghana            PS Palestine
    DZ Algeria          GR Greece           PA Panama
    AO Angola	        GL Greenland        PG Papua New Guinea
    AR Argentina        GT Guatemala	    PY Paraguay
    AM Armenia	        GN Guinea           PE Peru
    AU Australia        GW Guinea-Bissau    PH Philippines
    AT Austria	        GY Guyana           PL Poland
    AZ Azerbaijan       HT Haiti            PT Portugal
    BS Bahamas	        HN Honduras         PR Puerto Rico
    BD Bangladesh       HK Hong Kong        QA Qatar
    BY Belarus	        HU Hungary          XK Republic of Kosovo
    BE Belgium	        IS Iceland          RO Romania
    BZ Belize	        IN India            RU Russia
    BJ Benin	        ID Indonesia        RW Rwanda
    BT Bhutan	        IR Iran             SA Saudi Arabia
    BO Bolivia	        IQ Iraq             SN Senegal
    BA Bosnia/Herz  	IE Ireland          RS Serbia
    BW Botswana	        IL Israel           SL Sierra Leone
    BR Brazil	        IT Italy            SG Singapore
    BN Brunei       	JM Jamaica          SK Slovakia
    BG Bulgaria	        JP Japan            SI Slovenia
    BF Burkina Faso     JO Jordan           SB Solomon Islands
    BI Burundi      	KZ Kazakhstan       SO Somalia
    KH Cambodia	        KE Kenya            ZA South Africa
    CM Cameroon	        KP Korea            KR South Korea
    CA Canada	        XK Kosovo           SS South Sudan
    CI Ivory Coast      KW Kuwait           ES Spain
    CF CAR          	KG Kyrgyzstan       LK Sri Lanka
    TD Chad             LA Lao              SD Sudan
    CL Chile	        LV Latvia           SR Suriname
    CN China	        LB Lebanon          SJ Svalbard and Jan Mayen
    CO Colombia	        LS Lesotho          SZ Swaziland
    CG Congo	        LR Liberia          SE Sweden
    CD DR Congo     	LY Libya            CH Switzerland
    CR Costa Rica       LT Lithuania        SY Syrian Arab Republic
    HR Croatia      	LU Luxembourg       TW Taiwan
    CU Cuba         	MK Macedonia        TJ Tajikistan
    CY Cyprus	        MG Madagascar       TZ Tanzania
    CZ Czechia	        MW Malawi           TH Thailand
    DK Denmark	        MY Malaysia         TL Timor-Leste
    DP Diamond Princess	ML Mali             TG Togo
    DJ Djibouti	        MR Mauritania       TT Trinidad and Tobago
    DO Dominican Repub	MX Mexico           TN Tunisia
    CD DR Congo	        MD Moldova          TR Turkey
    EC Ecuador	        MN Mongolia         TM Turkmenistan
    EG Egypt	        ME Montenegro       AE UAE
    SV El Salvador  	MA Morocco          UG Uganda
    GQ Equatorial GuineaMZ Mozambique       GB United Kingdom
    ER Eritrea	        MM Myanmar          UA Ukraine
    EE Estonia      	NA Namibia          US USA
    ET Ethiopia	        NP Nepal            UY Uruguay
    FK Falkland Islands	NL Netherlands      UZ Uzbekistan
    FJ Fiji         	NC New Caledonia    VU Vanuatu
    FI Finland      	NZ New Zealand      VE Venezuela
    FR France	        NI Nicaragua	    VN Vietnam
    GF French Guiana	NE Niger            EH Western Sahara
    TF French ST    	NG Nigeria          YE Yemen
    GA Gabon	        KP North Korea      ZM Zambia
    GM Gambia	        NO Norway           ZW Zimbabwe
    GE Georgia      	OM Oman	
    
    ") do |location|
        options[:country] = location
    end
        
    opt.on("-d", "--date [DATE]","[YY/MM/DD preferred]" , Date) do |date|
        options[:date] = date
    end

    opt.on("-s", "--stat [VALUE]", "[OPTIONS: new/deaths/total/recovered/toll]") do |statistic|
        options[:stat] = statistic
    end

    opt.on("-h", "--help", "[Shows this message]") do 
        puts opt
        exit
    end


end

#def method
begin
    parser.parse!
    puts "There were #{Coronapp.get(options)} on this day"
rescue DateError
    puts %Q[The date must be this year. Run "ruby #{File.basename($0)}" --help for details.]
rescue CountryError
    puts %Q[Please use a valid country code. Run "ruby #{File.basename($0)}" --help for details.]
rescue OptionParser::InvalidArgument => e
    puts %Q[#{e.message.capitalize}. Run "ruby #{File.basename($0)}" --help for details.]
rescue KeyError
    puts %Q[Insufficient arguments. Run "ruby #{File.basename($0)}" --help for details.]
end
