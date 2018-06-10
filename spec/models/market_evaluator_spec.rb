require 'rails_helper'

describe MarketEvaluator do
  let(:parsed_request) { { :status=>"success",
                           :data=>
                            {:stats=>{:total=>3322},
                             :coins=>
                              [{:id=>1335,
                                :slug=>"bitcoin-btc",
                                :symbol=>"BTC",
                                :name=>"Bitcoin",
                                :circulatingSupply=>17022000,
                                :totalSupply=>17022000,
                                :exchangeable=>true,
                                :exchangeAvailable=>true,
                                :description=>
                                 "Bitcoin is the first decentralized digital currency that can be sent through the internet globally without using financial institutions like banks. The network is controlled by many of its users, instead of a few entities.",
                                :color=>"#f7931a",
                                :iconType=>"vector",
                                :iconUrl=>"https://cdn.coinranking.com/Sy33Krudb/btc.svg",
                                :websiteUrl=>"https://bitcoin.org",
                                :marketCap=>129912738541,
                                :volume=>4939540000,
                                :penalty=>false,
                                :price=>"7632.0490271971",
                                :rank=>1,
                                :history=>
                                 ["7538.5963465695",
                                  "7533.7975435585",
                                  "7505.8148965883",
                                  "7509.5931237349",
                                  "7508.4970731206",
                                  "7473.0169480514",
                                  "7426.5553540042",
                                  "7430.7552651562",
                                  "7420.2690433628",
                                  "7450.8916055202",
                                  "7430.4464067868",
                                  "7443.5691001961",
                                  "7460.975224075",
                                  "7451.0942086787",
                                  "7456.1960997501",
                                  "7454.6010638513",
                                  "7441.2658610455",
                                  "7439.3555962809",
                                  "7462.0478972425",
                                  "7551.9883516803",
                                  "7590.2650215554",
                                  "7634.4992000026",
                                  "7631.2981245454",
                                  "7627.6510632851",
                                  "7632.0490271971"],
                                :change=>1.24},
                               {:id=>1211,
                                :slug=>"ethereum-eth",
                                :symbol=>"ETH",
                                :name=>"Ethereum",
                                :circulatingSupply=>99890228,
                                :totalSupply=>99890228,
                                :exchangeable=>true,
                                :exchangeAvailable=>true,
                                :description=>
                                 "Ethereum is a public decentralized blockchain that provides peer-to-peer smart contracts, without the interference of third parties. This open source (transparent) platform hosts and distributes decentralized applications, thus connecting peers directly.",
                                :color=>"#3C3C3D",
                                :iconType=>"vector",
                                :iconUrl=>"https://cdn.coinranking.com/rk4RKHOuW/eth.svg",
                                :websiteUrl=>"https://www.ethereum.org",
                                :marketCap=>60801741674,
                                :volume=>1839000000,
                                :penalty=>false,
                                :price=>"608.6855830814",
                                :rank=>2,
                                :history=>
                                 ["597.2145988973",
                                  "596.0637791719",
                                  "591.7606622254",
                                  "594.1820243176",
                                  "596.2904516015",
                                  "589.8325910827",
                                  "583.9553925956",
                                  "584.852230994",
                                  "583.4952971132",
                                  "587.5522756062",
                                  "587.915811372",
                                  "591.2058121611",
                                  "592.7202138286",
                                  "590.9448890405",
                                  "590.0863096559",
                                  "590.9769744599",
                                  "589.8453037889",
                                  "588.3699554462",
                                  "592.0916247602",
                                  "603.5508379306",
                                  "607.8492505189",
                                  "610.33934733",
                                  "609.0921600111",
                                  "609.1729512738",
                                  "608.6855830814"],
                                :change=>1.92},
                               {:id=>840,
                                :slug=>"ripple-xrp",
                                :symbol=>"XRP",
                                :name=>"Ripple",
                                :circulatingSupply=>39241525848,
                                :totalSupply=>99992075773,
                                :exchangeable=>true,
                                :exchangeAvailable=>true,
                                :description=>
                                 "Ripple is a global real-time settlement network that connects banks around the world, allowing immediate cross-border transactions using less intermediaries. The cross-border transfers occur within seconds between banks globally, whilst providing both parties an end-to-end visibility throughout the transactions.",
                                :color=>"#27a2db",
                                :iconType=>"vector",
                                :iconUrl=>"https://cdn.coinranking.com/Bkuz9Hd_-/xrp.svg",
                                :websiteUrl=>"https://ripple.com",
                                :marketCap=>26674587234,
                                :volume=>420299000,
                                :penalty=>false,
                                :price=>"0.6797540783",
                                :rank=>3,
                                :history=>
                                 ["0.671219704",
                                  "0.6690806619",
                                  "0.6609274059",
                                  "0.6620280129",
                                  "0.6634816341",
                                  "0.6534723572",
                                  "0.6445226175",
                                  "0.6478483033",
                                  "0.6484390293",
                                  "0.6567367443",
                                  "0.6541303186",
                                  "0.6602698431",
                                  "0.6600944485",
                                  "0.6603380382",
                                  "0.6597038177",
                                  "0.6630590738",
                                  "0.661115649",
                                  "0.6594236409",
                                  "0.6646050702",
                                  "0.6738611747",
                                  "0.6770709784",
                                  "0.6827143978",
                                  "0.6775494602",
                                  "0.677932168",
                                  "0.6797540783"],
                                :change=>1.27},
                               {:id=>1327,
                                :slug=>"bitcoincash-bch",
                                :symbol=>"BCH",
                                :name=>"Bitcoin Cash",
                                :circulatingSupply=>17167450,
                                :totalSupply=>21000000,
                                :exchangeable=>true,
                                :exchangeAvailable=>true,
                                :description=>
                                 "Bitcoin Cash is an electronic cash platform that allows peer-to-peer online cash payments to be made without the clearance of a clearing house. Also, Bitcoin Cash is a continuation of the bitcoin blockchain history.",
                                :color=>"#f7931A",
                                :iconType=>"vector",
                                :iconUrl=>"https://cdn.coinranking.com/SkdJqSuuW/bch.svg",
                                :websiteUrl=>"https://www.bitcoincash.org",
                                :marketCap=>19826607618,
                                :volume=>726626000,
                                :penalty=>false,
                                :price=>"1154.8953175004",
                                :rank=>4,
                                :history=>
                                 ["1119.3153157224",
                                  "1119.0756662898",
                                  "1108.2148369296",
                                  "1109.7726034038",
                                  "1114.8705960978",
                                  "1097.917899417",
                                  "1074.2841017256",
                                  "1075.7228430246",
                                  "1072.2523318479",
                                  "1080.5049690577",
                                  "1074.6006733563",
                                  "1081.3237519723",
                                  "1089.6734102919",
                                  "1082.5571041682",
                                  "1074.3218415184",
                                  "1077.3367521764",
                                  "1074.3248542751",
                                  "1068.6933161199",
                                  "1082.6468373169",
                                  "1129.9275576156",
                                  "1142.7950369734",
                                  "1150.2104085814",
                                  "1147.4146657958",
                                  "1152.1142081313",
                                  "1154.8953175004"],
                                :change=>3.18},
                               {:id=>1281,
                                :slug=>"eos-eos",
                                :symbol=>"EOS",
                                :name=>"EOS",
                                :circulatingSupply=>896149492,
                                :totalSupply=>1000000000,
                                :exchangeable=>true,
                                :exchangeAvailable=>false,
                                :description=>
                                 "EOS is an operating system on the blockchain that runs decentralized applications for businesses. The main focus of the platform is performance and scalability of smart contracts and transaction throughput. EOS is built to be horizontally scalable, so that in the future it can handle thousands of business apps.",
                                :color=>"#202022",
                                :iconType=>"vector",
                                :iconUrl=>"https://cdn.coinranking.com/H1YjiSd_-/eos.svg",
                                :websiteUrl=>"https://eos.io/",
                                :marketCap=>12711239064,
                                :volume=>1451650000,
                                :penalty=>false,
                                :price=>"14.1842841819",
                                :rank=>5,
                                :history=>
                                 ["13.751078349",
                                  "13.7073522293",
                                  "13.5571917654",
                                  "13.5868118576",
                                  "13.5973133149",
                                  "13.39216066",
                                  "13.1833290359",
                                  "13.1558178158",
                                  "13.0621155757",
                                  "13.2047783156",
                                  "13.1743034285",
                                  "13.627757684",
                                  "13.8580949227",
                                  "13.7100068546",
                                  "13.5898821811",
                                  "13.6403635178",
                                  "13.6690503761",
                                  "13.5746762834",
                                  "13.7294421073",
                                  "13.9697712664",
                                  "14.0719916968",
                                  "14.1791998697",
                                  "14.1057586594",
                                  "14.1203261699",
                                  "14.1842841819"],
                                :change=>3.15},
                               {:id=>527,
                                :slug=>"litecoin-ltc",
                                :symbol=>"LTC",
                                :name=>"Litecoin",
                                :circulatingSupply=>56849373,
                                :totalSupply=>84000000,
                                :exchangeable=>true,
                                :exchangeAvailable=>true,
                                :description=>
                                 "Litecoin is a peer-to-peer decentralized digital currency with an instant, near zero-cost payment service to peers across the world. It features a faster transaction confirmation status, along with a refined storage competency.",
                                :color=>"#a0a0a0",
                                :iconType=>"vector",
                                :iconUrl=>"https://cdn.coinranking.com/rJ10HrfoM/ltc.svg",
                                :websiteUrl=>"https://litecoin.org",
                                :marketCap=>6873941956,
                                :volume=>294010000,
                                :penalty=>false,
                                :price=>"120.915000347",
                                :rank=>6,
                                :history=>
                                 ["119.8439272814",
                                  "119.787204905",
                                  "119.4551910373",
                                  "119.7188918463",
                                  "119.7760889228",
                                  "118.6971576707",
                                  "117.4024212335",
                                  "117.1483251549",
                                  "116.7718629068",
                                  "117.547217704",
                                  "117.4207643602",
                                  "117.699040389",
                                  "117.9922443413",
                                  "117.8252774015",
                                  "117.5430423879",
                                  "117.6858014116",
                                  "117.5072392792",
                                  "117.4078014746",
                                  "118.1564864599",
                                  "120.0263947351",
                                  "120.6934224763",
                                  "121.6634642192",
                                  "121.4431784525",
                                  "121.0573237048",
                                  "120.915000347"],
                                :change=>0.89 }] } }
                              }
  it 'returns info for BTC' do
    crypto = 'BTC'

    @market_data = MarketEvaluator.currency_market_change(crypto, parsed_request)
    
    expect(@market_data).to eq('+1.24')
  end

  it 'returns info for ETH' do
    crypto = 'ETH'

    @market_data = MarketEvaluator.currency_market_change(crypto, parsed_request)

    expect(@market_data).to eq('+1.92')
  end

  it 'returns info for XRP' do
    crypto = 'XRP'

    @market_data = MarketEvaluator.currency_market_change(crypto, parsed_request)

    expect(@market_data).to eq('+1.27')
  end

  it 'returns info for LTC' do
    crypto = 'LTC'

    @market_data = MarketEvaluator.currency_market_change(crypto, parsed_request)

    expect(@market_data).to eq('+0.89')
  end
end