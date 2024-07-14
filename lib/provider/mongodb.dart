import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
final List<Map<String, String>>EmployeeData=[
  {
    "EmpId": "97",
    "EmployeeName": "KARRI MANOZ KUMAR REDDY",
    "MobileNo": "7731829995",
    "Gender": "M",
    "Designation": "Dean-Academics",
    "EmailId": "dean_ev@acoe.edu.in"
  },
  {
    "EmpId": "743",
    "EmployeeName": "RAJESH MURARI",
    "MobileNo": "9640382333",
    "Gender": "M",
    "Designation": "Associate Professor & HOD",
    "EmailId": "murari.rajesh@gmail.com"
  },
  {
    "EmpId": "4301",
    "EmployeeName": "DR. MANAM RAVINDRA",
    "MobileNo": "9705869368",
    "Gender": "M",
    "Designation": "HOD",
    "EmailId": "hodeee@acoe.edu.in"
  },
  {
    "EmpId": "4455",
    "EmployeeName": "DR. BODDEPALLI RAJANI",
    "MobileNo": "8639493172",
    "Gender": "F",
    "Designation": "Professor",
    "EmailId": "drrajaniboddepalli2015@gmail.com"
  },
  {
    "EmpId": "1852",
    "EmployeeName": "CH UMA PHANEENDRA KUMAR",
    "MobileNo": "9948133548",
    "Gender": "M",
    "Designation": "Associate Professor",
    "EmailId": "chaturvedula_eee@acoe.edu.in"
  },
  {
    "EmpId": "2185",
    "EmployeeName": "DONEPUDI TATA RAO",
    "MobileNo": "9441241483",
    "Gender": "M",
    "Designation": "Associate Professor",
    "EmailId": "tatarao_eee@acoe.edu.in"
  },
  {
    "EmpId": "778",
    "EmployeeName": "DR. K R K V PRASAD",
    "MobileNo": "8309600083",
    "Gender": "M",
    "Designation": "Associate Professor",
    "EmailId": "krvprasad219@gmail.com"
  },
  {
    "EmpId": "5803",
    "EmployeeName": "DR. SIRISHA NARKEDAMILLI",
    "MobileNo": "9849207850",
    "Gender": "F",
    "Designation": "Associate Professor",
    "EmailId": "sirishanarkeda@gmail.com"
  },
  {
    "EmpId": "1485",
    "EmployeeName": "KAMBAMPATI LAKSHMI",
    "MobileNo": "9160077441",
    "Gender": "F",
    "Designation": "Associate Professor",
    "EmailId": "lakshmi_eee@acoe.edu.in"
  },
  {
    "EmpId": "3199",
    "EmployeeName": "KONETI VARALAKSHMI",
    "MobileNo": "9959170059",
    "Gender": "F",
    "Designation": "Associate Professor",
    "EmailId": "vara1981@gmail.com"
  },
  {
    "EmpId": "4554",
    "EmployeeName": "KURRA VENKATESWARA RAO",
    "MobileNo": "9700800232",
    "Gender": "M",
    "Designation": "Sr Assistant Professor",
    "EmailId": "venkateswararao283@gmail.com"
  },
  {
    "EmpId": "3926",
    "EmployeeName": "MANTHINA SATYANARAYANA RAJU",
    "MobileNo": "9618568023",
    "Gender": "M",
    "Designation": "Sr Assistant Professor",
    "EmailId": "satyanarayanaraju_eee@acoe.edu.in"
  },
  {
    "EmpId": "3105",
    "EmployeeName": "RAYUDU SRINIVAS",
    "MobileNo": "7731078885",
    "Gender": "M",
    "Designation": "Associate Professor",
    "EmailId": "srinivasrayudu245@gmail.com"
  },
  {
    "EmpId": "4957",
    "EmployeeName": "T LAKSHMI NARAYANA",
    "MobileNo": "9010054544",
    "Gender": "M",
    "Designation": "Sr Assistant Professor",
    "EmailId": "lakshminarayana_eee@acoe.edu.in"
  },
  {
    "EmpId": "4749",
    "EmployeeName": "VADREVU RAMAKRISHNA",
    "MobileNo": "9392285615",
    "Gender": "M",
    "Designation": "Sr Assistant Professor",
    "EmailId": "vramakrishna222@gmail.com"
  },
  {
    "EmpId": "1150",
    "EmployeeName": "VEMANA U.P. LAVANYA",
    "MobileNo": "9849024589",
    "Gender": "F",
    "Designation": "Sr Assistant Professor",
    "EmailId": "lavanya.vemana@gmail.com"
  },
  {
    "EmpId": "5487",
    "EmployeeName": "BATHULA SRI RAMA MURTHY",
    "MobileNo": "7659878743",
    "Gender": "M",
    "Designation": "Assistant Professor",
    "EmailId": "sriramamurthy_eee@acoe.edu.in"
  },
  {
    "EmpId": "3981",
    "EmployeeName": "KARRI RAVI KUMAR REDDY",
    "MobileNo": "9989027268",
    "Gender": "M",
    "Designation": "Assistant Professor",
    "EmailId": "ravikumarreddy.k@aec.edu.in"
  },
  {
    "EmpId": "5357",
    "EmployeeName": "KONDALA RAO PARASA",
    "MobileNo": "8500496799",
    "Gender": "M",
    "Designation": "Assistant Professor",
    "EmailId": "kondalarao_eee@acoe.edu.in"
  },
  {
    "EmpId": "1430",
    "EmployeeName": "M P SUBBA RAJU",
    "MobileNo": "9618018807",
    "Gender": "M",
    "Designation": "Assistant Professor",
    "EmailId": "subbaraju.56@gmail.com"
  },
  {
    "EmpId": "1171",
    "EmployeeName": "M.V. KUMAR REDDY",
    "MobileNo": "7731893388",
    "Gender": "M",
    "Designation": "Assistant Professor",
    "EmailId": "kumarreddy_eee@acoe.edu.in"
  },
  {
    "EmpId": "5788",
    "EmployeeName": "PADALA SRIKAVITHA",
    "MobileNo": "6281713367",
    "Gender": "F",
    "Designation": "Assistant Professor",
    "EmailId": "srikavitha2013@gmail.com"
  },
  {
    "EmpId": "5477",
    "EmployeeName": "PRAMOD KUMAR IRLAPATI",
    "MobileNo": "9573241622",
    "Gender": "M",
    "Designation": "Assistant Professor",
    "EmailId": "pramod_eee@acoe.edu.in"
  },
  {
    "EmpId": "2711",
    "EmployeeName": "SADHANAPU REDDY RAMESH",
    "MobileNo": "9490417563",
    "Gender": "M",
    "Designation": "Assistant Professor",
    "EmailId": "ramesh516269@gmail.com"
  },
  {
    "EmpId": "1551",
    "EmployeeName": "SANA VANI",
    "MobileNo": "9491191617",
    "Gender": "F",
    "Designation": "Assistant Professor",
    "EmailId": "sanavanimtech@gmail.com"
  },
  {
    "EmpId": "4436",
    "EmployeeName": "TATA HIMAJA",
    "MobileNo": "7386500555",
    "Gender": "F",
    "Designation": "Assistant Professor",
    "EmailId": "himaja_eee@acoe.edu.in"
  },
  {
    "EmpId": "2307",
    "EmployeeName": "CH V V D MANI KUMAR",
    "MobileNo": "8121584413",
    "Gender": "M",
    "Designation": "Teaching Assistant",
    "EmailId": "manikumar213@gmail.com"
  },
  {
    "EmpId": "1177",
    "EmployeeName": "GEDDAM CH.M.K. RAO",
    "MobileNo": "7989944795",
    "Gender": "M",
    "Designation": "Teaching Assistant",
    "EmailId": "manikanteswarrao_eee@acoe.edu.in"
  },
  {
    "EmpId": "14",
    "EmployeeName": "KOPPISETTI VEERA BABU",
    "MobileNo": "7731824442",
    "Gender": "M",
    "Designation": "Teaching Assistant",
    "EmailId": "veerababukoppisetti@gmail.com"
  },
  {
    "EmpId": "5124 ",
    "EmployeeName": "AYINALA NAGA SAI ",
    "MobileNo": "7569649359",
    "Gender": "M ",
    "Designation": "Sr. Assistant Professor & HOD ",
    "EmailId": "ayinala.nagasai.civil113@gmail.com "
  },
  {
    "EmpId": "4332 ",
    "EmployeeName": "BELAGAM RAGHAVA MAHEEDHAR ",
    "MobileNo": "8019184695 ",
    "Gender": "M ",
    "Designation": "Sr Assistant Professor ",
    "EmailId": "maheedhar_civil@acoe.edu.in "
  },
  {
    "EmpId": "4558 ",
    "EmployeeName": "DR. VANDANAPU SWAMY NADH ",
    "MobileNo": "7981894261 ",
    "Gender": "M ",
    "Designation": "Associate Professor ",
    "EmailId": "swamynadh_civil@acoe.edu.in "
  },
  {
    "EmpId": "1626 ",
    "EmployeeName": "MARNEEDI SRINIVASU ",
    "MobileNo": "9246831333 ",
    "Gender": "M ",
    "Designation": "Associate Professor ",
    "EmailId": "srinivasu_civil@acoe.edu.in "
  },
  {
    "EmpId": "3232 ",
    "EmployeeName": "SAYAPANAYANI SIVACHARAN ",
    "MobileNo": "9989702182 ",
    "Gender": "M ",
    "Designation": "Associate Professor ",
    "EmailId": "sscharan28@rediffmail.com "
  },
  {
    "EmpId": "5669 ",
    "EmployeeName": "ALLA RAJENDRA ",
    "MobileNo": "8143146542 ",
    "Gender": "M ",
    "Designation": "Assistant Professor ",
    "EmailId": "rajendra_civil@acoe.edu.in "
  },
  {
    "EmpId": "5705 ",
    "EmployeeName": "DANAM NOELLE ",
    "MobileNo": "9390750157 ",
    "Gender": "F ",
    "Designation": "Assistant Professor ",
    "EmailId": "noelle_civil@acoe.edu.in "
  },
  {
    "EmpId": "4905 ",
    "EmployeeName": "DR TAMMINENI GNANANANDARAO ",
    "MobileNo": "9491789380 ",
    "Gender": "M ",
    "Designation": "Assistant Professor ",
    "EmailId": "anandrcwing@gmail.com "
  },
  {
    "EmpId": "5785 ",
    "EmployeeName": "DR. CHAPPA AJAY ",
    "MobileNo": "7989031278 ",
    "Gender": "M ",
    "Designation": "Assistant Professor ",
    "EmailId": "ajay.chappa91@gmail.com "
  },
  {
    "EmpId": "4886 ",
    "EmployeeName": "DR. CHUKKA NAGA DHEERAJ KUMAR REDDY ",
    "MobileNo": "9177556962 ",
    "Gender": "M ",
    "Designation": "Assistant Professor ",
    "EmailId": "dheerukumbi@gmail.com "
  },
  {
    "EmpId": "4543 ",
    "EmployeeName": "GEORGE FERNANDEZ RAJ ",
    "MobileNo": "6380867204 ",
    "Gender": "M ",
    "Designation": "Assistant Professor ",
    "EmailId": "goferz.raj5@gmail.com "
  },
  {
    "EmpId": "4961 ",
    "EmployeeName": "KOYYANA LAKSHMI SARASWATHI ",
    "MobileNo": "9391641961 ",
    "Gender": "F ",
    "Designation": "Assistant Professor ",
    "EmailId": "saraswathikoyyana@gmail.com "
  },
  {
    "EmpId": "4642 ",
    "EmployeeName": "MANAPURAM SAI SUDHEER ",
    "MobileNo": "9441076835 ",
    "Gender": "M ",
    "Designation": "Assistant Professor ",
    "EmailId": "sudheer.manapuram@gmail.com "
  },
  {
    "EmpId": "5396 ",
    "EmployeeName": "MOGANTI LAKSHMI KANTH ",
    "MobileNo": "8885922007 ",
    "Gender": "M ",
    "Designation": "Assistant Professor ",
    "EmailId": "lakshmikanth_civil@acoe.edu.in "
  },
  {
    "EmpId": "4508 ",
    "EmployeeName": "P UMA MAHESWARA RAO ",
    "MobileNo": "8919477900 ",
    "Gender": "M ",
    "Designation": "Assistant Professor ",
    "EmailId": "umapoetmahesh@gmail.com "
  },
  {
    "EmpId": "5262 ",
    "EmployeeName": "SALINA RUPU SUNDARA RAO ",
    "MobileNo": "9182360887 ",
    "Gender": "M ",
    "Designation": "Assistant Professor ",
    "EmailId": "salinasundrarao@gmail.com "
  },
  {
    "EmpId": "5647 ",
    "EmployeeName": "SEELAM NAGENDRA ",
    "MobileNo": "9398481077 ",
    "Gender": "M ",
    "Designation": "Assistant Professor ",
    "EmailId": "nagendra_civil@acoe.edu.in "
  },
  {
    "EmpId": "4286 ",
    "EmployeeName": "SYED NIZAMUDDIN KHADRI ",
    "MobileNo": "8008537047 ",
    "Gender": "M ",
    "Designation": "Assistant Professor ",
    "EmailId": "khadri_civil@acoe.edu.in "
  },
  {
    "EmpId": "4529 ",
    "EmployeeName": "UPPULURI PRAVEEN KUMAR ",
    "MobileNo": "9014119198 ",
    "Gender": "M ",
    "Designation": "Assistant Professor ",
    "EmailId": "praveenkumar_civil@acoe.edu.in "
  },
  {
    "EmpId": "4809 ",
    "EmployeeName": "VINJAMURI VIJAY KUMAR ",
    "MobileNo": "9652655277 ",
    "Gender": "M ",
    "Designation": "Assistant Professor ",
    "EmailId": "vijayvinjamuricivil@gmail.com "
  },
  {
    "EmpId": "1957 ",
    "EmployeeName": "DR. Y KRISHNA SRINIVASA SUBBA RAO ",
    "MobileNo": "7396659639 ",
    "Gender": "M ",
    "Designation": "Dean-Administration ",
    "EmailId": "hodmech@acoe.edu.in "
  },
  {
    "EmpId": "4351 ",
    "EmployeeName": "DR. D V S S S V PRASAD ",
    "MobileNo": "9492508781 ",
    "Gender": "M ",
    "Designation": "Professor ",
    "EmailId": "prasad_mech@acoe.edu.in "
  },
  {
    "EmpId": "4724 ",
    "EmployeeName": "DR. PULI DANAIAH ",
    "MobileNo": "7901533324 ",
    "Gender": "M ",
    "Designation": "Professor ",
    "EmailId": "_"
  },
  {
    "EmpId": "4277 ",
    "EmployeeName": "DR.AKHILESH KUMAR SINGH ",
    "MobileNo": "9612625040 ",
    "Gender": "M ",
    "Designation": "Professor ",
    "EmailId": "aksingh_mech@acoe.edu.in "
  },
  {
    "EmpId": "3590 ",
    "EmployeeName": "ABDUL ARIF ",
    "MobileNo": "7036358658 ",
    "Gender": "M ",
    "Designation": "Sr Assistant Professor ",
    "EmailId": "arif309mech@gmail.com "
  },
  {
    "EmpId": "3998 ",
    "EmployeeName": "AINAPURAPU CHIRANJEEVI V S PRASAD ",
    "MobileNo": "9491800825 ",
    "Gender": "M ",
    "Designation": "Sr Assistant Professor ",
    "EmailId": "chiranjeeviprasad34@gmail.com "
  },
  {
    "EmpId": "3744 ",
    "EmployeeName": "CH RAM MOHAN RAO ",
    "MobileNo": "9346200667 ",
    "Gender": "M ",
    "Designation": "Sr Assistant Professor ",
    "EmailId": "rammohanrao_mech@acoe.edu.in"
  },
  {
    "EmpId": "3734 ",
    "EmployeeName": "CHITTURI RAMPRASAD ",
    "MobileNo": "8885841223 ",
    "Gender": "M ",
    "Designation": "Sr Assistant Professor ",
    "EmailId": "rams.chitturi@gmail.com "
  },
  {
    "EmpId": "4447 ",
    "EmployeeName": "DR N. BHANU TEJA ",
    "MobileNo": "8903578086 ",
    "Gender": "M ",
    "Designation": "Associate Professor ",
    "EmailId": "bhanuteja_mech@acoe.edu.in "
  },
  {
    "EmpId": "4887 ",
    "EmployeeName": "DR. CH V V M J SATISH ",
    "MobileNo": "8466953336 ",
    "Gender": "M ",
    "Designation": "Associate Professor ",
    "EmailId": "satishchv@gmail.com "
  },
  {
    "EmpId": "4826 ",
    "EmployeeName": "DR. KUNAPULI SIVA SATYA MOHAN ",
    "MobileNo": "9618970423 ",
    "Gender": "M ",
    "Designation": "Associate Professor ",
    "EmailId": "kunapulisiva46@gmail.com "
  },
  {
    "EmpId": "5775 ",
    "EmployeeName": "DR. MOHAMMAD AHASAN ",
    "MobileNo": "9866305143 ",
    "Gender": "M ",
    "Designation": "Associate Professor ",
    "EmailId": "mdahasankhan@gmail.com "
  },
  {
    "EmpId": "4443 ",
    "EmployeeName": "DR. PONUGOTI GANGADHARA RAO ",
    "MobileNo": "9491949176 ",
    "Gender": "M ",
    "Designation": "Associate Professor ",
    "EmailId": "audibalav@gmail.com "
  },
  {
    "EmpId": "4264 ",
    "EmployeeName": "DR.MARXIM RAHULA BHARATHI B ",
    "MobileNo": "8583039077 ",
    "Gender": "M ",
    "Designation": "Associate Professor ",
    "EmailId": "rahulabharathi_mech@acoe.edu.in "
  },
  {
    "EmpId": "2670 ",
    "EmployeeName": "K VIJETHA ",
    "MobileNo": "7981944796 ",
    "Gender": "F ",
    "Designation": "Sr Assistant Professor ",
    "EmailId": "vijetha.k@aec.edu.in "
  },
  {
    "EmpId": "2991 ",
    "EmployeeName": "MULE PREM KUMAR REDDY ",
    "MobileNo": "9000524255 ",
    "Gender": "M ",
    "Designation": "Sr Assistant Professor ",
    "EmailId": "premkumar_bse@acoe.edu.in "
  },
  {
    "EmpId": "3775 ",
    "EmployeeName": "PASUPULETI HARICHANDRA PRASAD ",
    "MobileNo": "9032710390 ",
    "Gender": "M ",
    "Designation": "Sr Assistant Professor ",
    "EmailId": "harichandraprasad_mech@acoe.edu.in "
  },
  {
    "EmpId": "4691 ",
    "EmployeeName": "PEYYETY V S MURALI KRISHNA  ",
    "MobileNo": "9441308584 ",
    "Gender": "M ",
    "Designation": "Sr Assistant Professor ",
    "EmailId": "krishna4bi@gmail.com "
  },
  {
    "EmpId": "5776 ",
    "EmployeeName": "ULISETTI NAGAMANESWARA RAO ",
    "MobileNo": "9133993395 ",
    "Gender": "M ",
    "Designation": "Associate Professor ",
    "EmailId": "ulisettinagu9@gmail.com "
  },
  {
    "EmpId": "5310 ",
    "EmployeeName": "YADLURI RAVI KISHORE ",
    "MobileNo": "8143672791 ",
    "Gender": "M ",
    "Designation": "Sr Assistant Professor ",
    "EmailId": "ravilectures143@gmail.com "
  },
  {
    "EmpId": "3624 ",
    "EmployeeName": "AYITHAMPUDI SWATHI ",
    "MobileNo": "8985375397 ",
    "Gender": "F ",
    "Designation": "Assistant Professor ",
    "EmailId": "swathiayithampudi@gmail.com "
  },
  {
    "EmpId": "4399 ",
    "EmployeeName": "DR.NITLA STANLEY EBENEZER ",
    "MobileNo": "9160048124 ",
    "Gender": "M ",
    "Designation": "Assistant Professor ",
    "EmailId": "stanxaviers@gmail.com "
  },
  {
    "EmpId": "4720 ",
    "EmployeeName": "GOLLAPALLI VEERA SATYA SRINIVAS ",
    "MobileNo": "9959406080 ",
    "Gender": "M ",
    "Designation": "Assistant Professor ",
    "EmailId": "satyasrinivas4@gmail.com "
  },
  {
    "EmpId": "4228 ",
    "EmployeeName": "K B S TARUN KUMAR ",
    "MobileNo": "9492859634 ",
    "Gender": "M ",
    "Designation": "Assistant Professor ",
    "EmailId": "tarunkumar_mech@acoe.edu.in "
  },
  {
    "EmpId": "981 ",
    "EmployeeName": "M RAMBABU ",
    "MobileNo": "9573673233 ",
    "Gender": "M ",
    "Designation": "Assistant Professor ",
    "EmailId": "rambabuthermal@gmail.com "
  },
  {
    "EmpId": "1833 ",
    "EmployeeName": "MR. KOTAMARTHI VIJAY ",
    "MobileNo": "9701717017 ",
    "Gender": "M ",
    "Designation": "Assistant Professor ",
    "EmailId": "vijju.7482@gmail.com "
  },
  {
    "EmpId": "3749 ",
    "EmployeeName": "MRS. AMARTHALURI LALITHA JYOTHI ",
    "MobileNo": "9078184956 ",
    "Gender": "F ",
    "Designation": "Assistant Professor ",
    "EmailId": "jyothi.amarthaluri@gmail.com "
  },
  {
    "EmpId": "4812 ",
    "EmployeeName": "NANDAVARAPU RAVEENDRA REDDY ",
    "MobileNo": "8374663389 ",
    "Gender": "M ",
    "Designation": "Assistant Professor ",
    "EmailId": "raveendra_mech@acoe.edu.in "
  },
  {
    "EmpId": "5787 ",
    "EmployeeName": "P SRI GOWRI PADMAJA ",
    "MobileNo": "9492775368 ",
    "Gender": "F ",
    "Designation": "Assistant Professor ",
    "EmailId": "gowri_padmaja@yahoo.com "
  },
  {
    "EmpId": "3029 ",
    "EmployeeName": "PAVAN KUMAR CHINTALAPATI ",
    "MobileNo": "8008263154 ",
    "Gender": "M ",
    "Designation": "Assistant Professor ",
    "EmailId": "pawan.ch9@gmail.com "
  },
  {
    "EmpId": "1329 ",
    "EmployeeName": "PEYYALA SREE DEVI ",
    "MobileNo": "9603783773 ",
    "Gender": "F ",
    "Designation": "Assistant Professor ",
    "EmailId": "sreedevi_mech@acoe.edu.in "
  },
  {
    "EmpId": "5113 ",
    "EmployeeName": "RAJU NETHALA ",
    "MobileNo": "9160176959 ",
    "Gender": "M ",
    "Designation": "Assistant Professor ",
    "EmailId": "raju_mech@acoe.edu.in "
  },
  {
    "EmpId": "4731 ",
    "EmployeeName": "RATNALA PRASAD ",
    "MobileNo": "9948919748 ",
    "Gender": "M ",
    "Designation": "Assistant Professor ",
    "EmailId": "prasadratnala2012@gmail.com "
  },
  {
    "EmpId": "4816 ",
    "EmployeeName": "RUDRALA SIVA PRASAD ",
    "MobileNo": "8143180286 ",
    "Gender": "M ",
    "Designation": "Assistant Professor ",
    "EmailId": "sivaprasad_mech@acoe.edu.in "
  },
  {
    "EmpId": "4990 ",
    "EmployeeName": "SRIKAKOLAPU SWETHA RADHA ",
    "MobileNo": "9949485859 ",
    "Gender": "F ",
    "Designation": "Assistant Professor ",
    "EmailId": "swetha_mech@acoe.edu.in "
  },
  {
    "EmpId": "3712 ",
    "EmployeeName": "VALLAPUREDDY SIVA NAGI REDDY ",
    "MobileNo": "8464061676 ",
    "Gender": "M ",
    "Designation": "Assistant Professor ",
    "EmailId": "043mech@gmail.com "
  },
  {
    "EmpId": "4107 ",
    "EmployeeName": "ARADADI BHARATHI ",
    "MobileNo": "9640972411 ",
    "Gender": "F ",
    "Designation": "Teaching Assistant ",
    "EmailId": "bharathisweety3624@gmail.com "
  },
  {
    "EmpId": "4108 ",
    "EmployeeName": "BADUGU ANUSHA ",
    "MobileNo": "9133491485 ",
    "Gender": "F ",
    "Designation": "Teaching Assistant ",
    "EmailId": "banusha577@gmail.com "
  },
  {
    "EmpId": "3931 ",
    "EmployeeName": "U MOHAN SRINIVAS ",
    "MobileNo": "7013398543 ",
    "Gender": "M ",
    "Designation": "Teaching Assistant ",
    "EmailId": "mohansrinivas_mech@acoe.edu.in "
  },
  {
    "EmpId": "710 ",
    "EmployeeName": "DR. DANNINA KISHORE ",
    "MobileNo": "9490873900 ",
    "Gender": "M ",
    "Designation": "Dean. Evaluation & Controller Of Examinations ",
    "EmailId": "kishore.dannina@gmail.com "
  },
  {
    "EmpId": "729 ",
    "EmployeeName": "DR.R V V KRISHNA ",
    "MobileNo": "9949583125 ",
    "Gender": "M ",
    "Designation": "Professor & HOD ",
    "EmailId": "rvvkrishnasammi@gmail.com "
  },
  {
    "EmpId": "4501 ",
    "EmployeeName": "CHAVVAKULA JANAKI DEVI ",
    "MobileNo": "8008122280 ",
    "Gender": "F ",
    "Designation": "HOD ",
    "EmailId": "hodece@acoe.edu.in "
  },
  {
    "EmpId": "4339 ",
    "EmployeeName": "DR. UTLA S.B.K. MAHALAXMI ",
    "MobileNo": "9490950823 ",
    "Gender": "F ",
    "Designation": "HOD ",
    "EmailId": "mahalaxmi_ece@acoe.edu.in "
  },
  {
    "EmpId": "815 ",
    "EmployeeName": "DR. M VENKATESWARLU ",
    "MobileNo": "9182466045 ",
    "Gender": "M ",
    "Designation": "Professor ",
    "EmailId": "venkateswarlu_ece@acoe.edu.in "
  },
  {
    "EmpId": "4293 ",
    "EmployeeName": "DR. R. RAMAN ",
    "MobileNo": "9677726715 ",
    "Gender": "M ",
    "Designation": "Professor ",
    "EmailId": "raman_ece@acoe.edu.in "
  },
  {
    "EmpId": "1461 ",
    "EmployeeName": "ADIRAJU RAMA VASANTHA ",
    "MobileNo": "9949974343 ",
    "Gender": "F ",
    "Designation": "Associate Professor ",
    "EmailId": "vasanthaadiraju@gmail.com "
  },
  {
    "EmpId": "479 ",
    "EmployeeName": "ANJAIAH TALAMALA ",
    "MobileNo": "8074429087 ",
    "Gender": "M ",
    "Designation": "Associate Professor ",
    "EmailId": "anjibabu_talamala@acet.ac.in "
  },
  {
    "EmpId": "2778 ",
    "EmployeeName": "B JAGADEESH BABU ",
    "MobileNo": "7893839001 ",
    "Gender": "M ",
    "Designation": "Sr Assistant Professor ",
    "EmailId": "jagadeesh_ece@acoe.edu.in "
  },
  {
    "EmpId": "1441 ",
    "EmployeeName": "DR. GUDIVADA A ARUN KUMAR ",
    "MobileNo": "9494954969 ",
    "Gender": "M ",
    "Designation": "Associate Professor ",
    "EmailId": "aarunkumarg@gmail.com "
  },
  {
    "EmpId": "1133 ",
    "EmployeeName": "DR. INAKOTI RAMESH RAJA ",
    "MobileNo": "7729996263 ",
    "Gender": "M ",
    "Designation": "Associate Professor ",
    "EmailId": "rameshraja.inakoti@acet.ac.in "
  },
  {
    "EmpId": "1473 ",
    "EmployeeName": "DR. MANDIPUDI RAGHUNATH ",
    "MobileNo": "9866111664 ",
    "Gender": "M ",
    "Designation": "Associate Professor ",
    "EmailId": "raghunath_ece@acoe.edu.in "
  },
  {
    "EmpId": "5144 ",
    "EmployeeName": "DR. NARLA VENKATA LALITHA ",
    "MobileNo": "9985001587 ",
    "Gender": "F ",
    "Designation": "Associate Professor ",
    "EmailId": "lalithanarla.ece@gmail.com "
  },
  {
    "EmpId": "5791 ",
    "EmployeeName": "DR. PALEPU NARAYANA RAO  ",
    "MobileNo": "9032840352 ",
    "Gender": "M ",
    "Designation": "Associate Professor ",
    "EmailId": "pnarayana.usharama@gmail.com "
  },
  {
    "EmpId": "2667 ",
    "EmployeeName": "DR. R ANIL KUMAR ",
    "MobileNo": "9603677444 ",
    "Gender": "M ",
    "Designation": "Associate Professor ",
    "EmailId": "anidecs@gmail.com "
  },
  {
    "EmpId": "706 ",
    "EmployeeName": "DR.V VIJAYASRI BOLISETTY ",
    "MobileNo": "7732096663 ",
    "Gender": "F ",
    "Designation": "Associate Professor ",
    "EmailId": "vijayasri.bollisetty@acet.ac.in "
  },
  {
    "EmpId": "5594 ",
    "EmployeeName": "GARAGA SRILAKSHMI ",
    "MobileNo": "7382357559 ",
    "Gender": "F ",
    "Designation": "Associate Professor ",
    "EmailId": "srilakshmi1853@gmail.com "
  },
  {
    "EmpId": "627 ",
    "EmployeeName": "GEESALA VEERAPANDU ",
    "MobileNo": "9491191574 ",
    "Gender": "M ",
    "Designation": "Associate Professor ",
    "EmailId": "veerapandu_ece@acoe.edu.in "
  },
  {
    "EmpId": "4555 ",
    "EmployeeName": "GUMMAREKULA SATTI BABU ",
    "MobileNo": "8977891789 ",
    "Gender": "M ",
    "Designation": "Associate Professor ",
    "EmailId": "satish.babu2007@gmail.com "
  },
  {
    "EmpId": "1818 ",
    "EmployeeName": "K L V PRASAD ",
    "MobileNo": "9963230878 ",
    "Gender": "M ",
    "Designation": "Associate Professor ",
    "EmailId": "vijayaprasad431@gmail.com "
  },
  {
    "EmpId": "3974 ",
    "EmployeeName": "KALESH BUSA ",
    "MobileNo": "9052240950 ",
    "Gender": "M ",
    "Designation": "Sr Assistant Professor ",
    "EmailId": "kalesh.busa_ece@acoe.edu.in "
  },
  {
    "EmpId": "2799 ",
    "EmployeeName": "KAPULA KALYANI ",
    "MobileNo": "9542744111 ",
    "Gender": "F ",
    "Designation": "Sr Assistant Professor ",
    "EmailId": "kalyanikapula@gmail.com "
  },
  {
    "EmpId": "4798 ",
    "EmployeeName": "KISHORE KUMAR MUDUGU ",
    "MobileNo": "9014163543 ",
    "Gender": "M ",
    "Designation": "Associate Professor ",
    "EmailId": "kishorekumar_ece@acoe.edu.in "
  },
  {
    "EmpId": "4440 ",
    "EmployeeName": "KOMMU SANGEET KUMAR ",
    "MobileNo": "9494010055 ",
    "Gender": "M ",
    "Designation": "Sr Assistant Professor ",
    "EmailId": "sangeetkumar_ece@acoe.edu.in "
  },
  {
    "EmpId": "4393 ",
    "EmployeeName": "KONDAPALLI JAYARAM KUMAR ",
    "MobileNo": "9032235282 ",
    "Gender": "M ",
    "Designation": "Sr Assistant Professor ",
    "EmailId": "jramworld@gmail.com "
  },
  {
    "EmpId": "2902 ",
    "EmployeeName": "KOTIKALAPUDI CHANDRA SEKHAR ",
    "MobileNo": "9866095701 ",
    "Gender": "M ",
    "Designation": "Sr Assistant Professor ",
    "EmailId": "chandrasekhar_ece@acoe.edu.in "
  },
  {
    "EmpId": "4512 ",
    "EmployeeName": "MAKE MADHU MANIKYA KUMAR ",
    "MobileNo": "9700052990 ",
    "Gender": "M ",
    "Designation": "Sr Assistant Professor ",
    "EmailId": "manikyakumar_ece@acoe.edu.in "
  },
  {
    "EmpId": "4568 ",
    "EmployeeName": "P ANANTHA SRAVANTHI ",
    "MobileNo": "9618144449 ",
    "Gender": "F ",
    "Designation": "Associate Professor ",
    "EmailId": "sravanthi.angara@gmail.com "
  },
  {
    "EmpId": "774 ",
    "EmployeeName": "P. RAMESH ",
    "MobileNo": "9985935356 ",
    "Gender": "M ",
    "Designation": "Sr Assistant Professor ",
    "EmailId": "ramesh_ece@acoe.edu.in "
  },
  {
    "EmpId": "731 ",
    "EmployeeName": "PADALA RAMESH KUMAR ",
    "MobileNo": "7730848333 ",
    "Gender": "M ",
    "Designation": "Associate Professor ",
    "EmailId": "ramesh92001@gmail.com "
  },
  {
    "EmpId": "3576 ",
    "EmployeeName": "SNEHA M JOSEPH ",
    "MobileNo": "9676630555 ",
    "Gender": "F ",
    "Designation": "Sr Assistant Professor ",
    "EmailId": "snehamjoseph@gmail.com "
  },
  {
    "EmpId": "1979 ",
    "EmployeeName": "V PREETHI ",
    "MobileNo": "8106712887 ",
    "Gender": "F ",
    "Designation": "Associate Professor ",
    "EmailId": "preti.santhosh@gmail.com "
  },
  {
    "EmpId": "1906 ",
    "EmployeeName": "Y SUGANDHI NAIDU ",
    "MobileNo": "7731915407 ",
    "Gender": "F ",
    "Designation": "Associate Professor ",
    "EmailId": "sugnadhi_ece@acoe.edu.in "
  },
  {
    "EmpId": "4723 ",
    "EmployeeName": "DURGA CHANDRAMOULI YENUGU ",
    "MobileNo": "9642201229 ",
    "Gender": "M ",
    "Designation": "Assistant Professor ",
    "EmailId": "yd.chandramouli@gmail.com "
  },
  {
    "EmpId": "5591 ",
    "EmployeeName": "CHOUDALLA SAILA RAM ",
    "MobileNo": "9121781603 ",
    "Gender": "F ",
    "Designation": "Assistant Professor ",
    "EmailId": "sailaram.ch@gmail.com "
  },
  {
    "EmpId": "3973 ",
    "EmployeeName": "K.V. BALARAMAKRISHNA ",
    "MobileNo": "9133528101 ",
    "Gender": "M ",
    "Designation": "Assistant Professor ",
    "EmailId": "balaramakrishna_ece@acoe.edu.in "
  },
  {
    "EmpId": "4489 ",
    "EmployeeName": "KALA VIJAYA KUMARI ",
    "MobileNo": "9133618889 ",
    "Gender": "F ",
    "Designation": "Assistant Professor ",
    "EmailId": "vijayakumari_ece@acoe.edu.in "
  },
  {
    "EmpId": "4730 ",
    "EmployeeName": "KAMMAMPATI VENKATA RAMANA ",
    "MobileNo": "8143142689 ",
    "Gender": "M ",
    "Designation": "Assistant Professor ",
    "EmailId": "venkat.ramana489@gmail.com "
  },
  {
    "EmpId": "5789 ",
    "EmployeeName": "KASI SATYASHEELA ",
    "MobileNo": "7893844107 ",
    "Gender": "F ",
    "Designation": "Assistant Professor ",
    "EmailId": "satyasheela_ece@acoe.edu.in "
  },
  {
    "EmpId": "1817 ",
    "EmployeeName": "KETHA MAHESH BABU ",
    "MobileNo": "9491519655 ",
    "Gender": "M ",
    "Designation": "Assistant Professor ",
    "EmailId": "maheshbabu_ece@acoe.edu.in "
  },
  {
    "EmpId": "4480 ",
    "EmployeeName": "KODI SUMA ",
    "MobileNo": "8500571605 ",
    "Gender": "F ",
    "Designation": "Assistant Professor ",
    "EmailId": "suma_ece@acoe.edu.in "
  },
  {
    "EmpId": "4981 ",
    "EmployeeName": "KUKKALA HIMA BINDU ",
    "MobileNo": "9160813718 ",
    "Gender": "F ",
    "Designation": "Assistant Professor ",
    "EmailId": "himabindu_ece@acoe.edu.in "
  },
  {
    "EmpId": "4982 ",
    "EmployeeName": "MEDAPATI SUDHEER KUMAR REDDY ",
    "MobileNo": "9848373751 ",
    "Gender": "M ",
    "Designation": "Assistant Professor ",
    "EmailId": "sudheer_ece@acoe.edu.in "
  },
  {
    "EmpId": "4502 ",
    "EmployeeName": "PADALA BHUPA REDDY ",
    "MobileNo": "7386211683 ",
    "Gender": "M ",
    "Designation": "Assistant Professor ",
    "EmailId": "bhupareddy_ece@acoe.edu.in "
  },
  {
    "EmpId": "1477 ",
    "EmployeeName": "PANDIRI JHANSI ",
    "MobileNo": "9491939290 ",
    "Gender": "F ",
    "Designation": "Assistant Professor ",
    "EmailId": "jhansi_ece@acoe.edu.in "
  },
  {
    "EmpId": "3577 ",
    "EmployeeName": "PASUPULETI SWARNA LATHA ",
    "MobileNo": "9705847645 ",
    "Gender": "F ",
    "Designation": "Assistant Professor ",
    "EmailId": "swarnalathapasupuleti@gmail.com "
  },
  {
    "EmpId": "5469 ",
    "EmployeeName": "PEETHALA MANJARI BENHAR ",
    "MobileNo": "9765303611 ",
    "Gender": "F ",
    "Designation": "Assistant Professor ",
    "EmailId": "manjari_ece@acoe.edu.in "
  },
  {
    "EmpId": "5326 ",
    "EmployeeName": "RAYUDU PRASANTHI ",
    "MobileNo": "7981888208 ",
    "Gender": "F ",
    "Designation": "Assistant Professor ",
    "EmailId": "prasanthi_ece@acoe.edu.in "
  },
  {
    "EmpId": "4550 ",
    "EmployeeName": "SIDDANI DURGA PRASAD ",
    "MobileNo": "7386619551 ",
    "Gender": "M ",
    "Designation": "Assistant Professor ",
    "EmailId": "durgaprasadece2009@gmail.com "
  },
  {
    "EmpId": "4684 ",
    "EmployeeName": "SRIDHARA SRIVALLI KIRANMAYI ",
    "MobileNo": "9908177036 ",
    "Gender": "F ",
    "Designation": "Assistant Professor ",
    "EmailId": "srivallikiranmayi@gmail.com "
  },
  {
    "EmpId": "4340 ",
    "EmployeeName": "TENNETI KRISHNA MOHANA ",
    "MobileNo": "9052373452 ",
    "Gender": "F ",
    "Designation": "Assistant Professor ",
    "EmailId": "krishnamohana_ece@acoe.edu.in "
  },
  {
    "EmpId": "4735 ",
    "EmployeeName": "THIRAGATI PHANIMALA ",
    "MobileNo": "9502083533 ",
    "Gender": "F ",
    "Designation": "Assistant Professor ",
    "EmailId": "phanimala_ece@acoe.edu.in "
  },
  {
    "EmpId": "3691 ",
    "EmployeeName": "TETAKALA ASHOK ",
    "MobileNo": "9493526075 ",
    "Gender": "M ",
    "Designation": "Teaching Assistant ",
    "EmailId": "ashok_ece@acoe.edu.in "
  },
  {
    "EmpId": "117 ",
    "EmployeeName": "DR. MUTHEVI ANIL KUMAR ",
    "MobileNo": "7731865554 ",
    "Gender": "M",
    "Designation": "Professor & HOD ",
    "EmailId": "lettertoanil@gmail.com "
  },
  {
    "EmpId": "2225 ",
    "EmployeeName": "DR. PULLELA S V V S R KUMAR ",
    "MobileNo": "9848163227 ",
    "Gender": "M",
    "Designation": "Dean-Academics ",
    "EmailId": "dean_ac@acoe.edu.in "
  },
  {
    "EmpId": "2200 ",
    "EmployeeName": "DR. GARAPATI SATYANARAYANA MURTHY ",
    "MobileNo": "9553548444 ",
    "Gender": "M",
    "Designation": "HOD ",
    "EmailId": "murthy_cse@acoe.edu.in "
  },
  {
    "EmpId": "361 ",
    "EmployeeName": "DR. REGELLA VENKATA SATYA LALITHA ",
    "MobileNo": "8008379819 ",
    "Gender": "F",
    "Designation": "Professor ",
    "EmailId": "rvslalitha@gmail.com "
  },
  {
    "EmpId": "4672 ",
    "EmployeeName": "AMANULLA MOHAMMAD ",
    "MobileNo": "9491221335 ",
    "Gender": "M",
    "Designation": "Sr Assistant Professor ",
    "EmailId": "amanmdmtech@gmail.com "
  },
  {
    "EmpId": "5250 ",
    "EmployeeName": "CHALLAPALLI SUJANA ",
    "MobileNo": "8885815941 ",
    "Gender": "F",
    "Designation": "Sr Assistant Professor ",
    "EmailId": "sujana.challapalli@gmail.com "
  },
  {
    "EmpId": "5613 ",
    "EmployeeName": "DAMMU VENKATA RAVI KUMAR ",
    "MobileNo": "9912624422 ",
    "Gender": "M",
    "Designation": "Associate Professor ",
    "EmailId": "venkataravi_cse@acoe.edu.in "
  },
  {
    "EmpId": "5468 ",
    "EmployeeName": "DR. BHATTIPROLU VENKATA RAMAKRISHNA ",
    "MobileNo": "9849995798 ",
    "Gender": "M",
    "Designation": "Associate Professor ",
    "EmailId": "ramakrishna_cse@acoe.edu.in "
  },
  {
    "EmpId": "1008 ",
    "EmployeeName": "DR. CHAKKA SVVSN MURTY ",
    "MobileNo": "9440130301 ",
    "Gender": "M",
    "Designation": "Associate Professor ",
    "EmailId": "chsatyamurty@gmail.com "
  },
  {
    "EmpId": "5547 ",
    "EmployeeName": "GARA JAYA RAJU ",
    "MobileNo": "9490890317 ",
    "Gender": "M",
    "Designation": "Sr Assistant Professor ",
    "EmailId":"_"
  },
  {
    "EmpId": "2776 ",
    "EmployeeName": "J L SARWANI THEEPARTHI  ",
    "MobileNo": "7659813335 ",
    "Gender": "M",
    "Designation": "Associate Professor ",
    "EmailId": "tjlsarwa@gmail.com "
  },
  {
    "EmpId": "4670 ",
    "EmployeeName": "JAGATHA SATYA NARENDRAKUMAR ",
    "MobileNo": "9640770278 ",
    "Gender": "M",
    "Designation": "Sr Assistant Professor ",
    "EmailId": "satyanaredrgj@gmail.com "
  },
  {
    "EmpId": "2749 ",
    "EmployeeName": "MRS. JALLIGAMPALA DIVYA LALITA SRI ",
    "MobileNo": "9010868185 ",
    "Gender": "F",
    "Designation": "Sr Assistant Professor ",
    "EmailId": "lalitha517@gmail.com "
  },
  {
    "EmpId": "1730 ",
    "EmployeeName": "MUNAGA MASTHAN SIVA KRISHNA ",
    "MobileNo": "9703803659 ",
    "Gender": "M",
    "Designation": "Associate Professor ",
    "EmailId": "sivakrishna.munga@acet.ac.in "
  },
  {
    "EmpId": "4926 ",
    "EmployeeName": "NADELLA SUNIL ",
    "MobileNo": "9848325165 ",
    "Gender": "M",
    "Designation": "Associate Professor ",
    "EmailId": "sunilnadella@gmail.com "
  },
  {
    "EmpId": "211 ",
    "EmployeeName": "RAMESH N S V S C SRIPADA ",
    "MobileNo": "8978615317 ",
    "Gender": "M",
    "Designation": "Associate Professor ",
    "EmailId": "ramesh_snsvsc@yahoo.co.in "
  },
  {
    "EmpId": "4930 ",
    "EmployeeName": "SAPE CHITTIBABULU ",
    "MobileNo": "9866940959 ",
    "Gender": "M",
    "Designation": "Associate Professor ",
    "EmailId": "chittibabulu_cse@acoe.edu.in "
  },
  {
    "EmpId": "1628 ",
    "EmployeeName": "TADI SATYA KUMARI ",
    "MobileNo": "9848724625 ",
    "Gender": "F",
    "Designation": "Associate Professor ",
    "EmailId": "satyakumari_cse@acoe.edu.in "
  },
  {
    "EmpId": "1738 ",
    "EmployeeName": "TALATAM VEERRAJU ",
    "MobileNo": "9848795430 ",
    "Gender": "M",
    "Designation": "Associate Professor ",
    "EmailId": "veerraju_cse@acoe.edu.in "
  },
  {
    "EmpId": "4964 ",
    "EmployeeName": "YANAMADALA DURGA PRASAD ",
    "MobileNo": "9618110407 ",
    "Gender": "F",
    "Designation": "Associate Professor ",
    "EmailId": "durgaprasad_cse@acoe.edu.in "
  },
  {
    "EmpId": "4740 ",
    "EmployeeName": "ATTRU HANUMANTHARAO ",
    "MobileNo": "9492144194 ",
    "Gender": "M",
    "Designation": "Assistant Professor ",
    "EmailId": "hanumantharao_cse@acoe.edu.in "
  },
  {
    "EmpId": "5321 ",
    "EmployeeName": "BANDARU SATYA LAKSHMI ",
    "MobileNo": "8179559055 ",
    "Gender": "F",
    "Designation": "Assistant Professor ",
    "EmailId": "lakshmi.b_cse@acoe.edu.in "
  },
  {
    "EmpId": "5489 ",
    "EmployeeName": "CHINTALA RAMESH ",
    "MobileNo": "8179649549 ",
    "Gender": "M",
    "Designation": "Assistant Professor ",
    "EmailId": "chintala.ramesh13@gmail.com "
  },
  {
    "EmpId": "4665 ",
    "EmployeeName": "DUNE SATYANARAYANA ",
    "MobileNo": "7893365011 ",
    "Gender": "M",
    "Designation": "Assistant Professor ",
    "EmailId": "_"
  },
  {
    "EmpId": "4690 ",
    "EmployeeName": "GADI MOUNICA ",
    "MobileNo": "8367344569 ",
    "Gender": "F",
    "Designation": "Assistant Professor ",
    "EmailId": "mounica.gadi1@gmail.com "
  },
  {
    "EmpId": "5395 ",
    "EmployeeName": "KALE NAGA VENKATA SRINIVAS ",
    "MobileNo": "9959199112 ",
    "Gender": "M",
    "Designation": "Assistant Professor ",
    "EmailId": "venkatasrinivas_cse@acoe.edu.in "
  },
  {
    "EmpId": "4770 ",
    "EmployeeName": "MRS. SURYA LAKSHMI KANTHAM VINTI ",
    "MobileNo": "8897611612 ",
    "Gender": "F",
    "Designation": "Assistant Professor ",
    "EmailId": "surya.vinti@gmail.com "
  },
  {
    "EmpId": "4705 ",
    "EmployeeName": "N VEERENDRA KUMAR REDDI ",
    "MobileNo": "9440543261 ",
    "Gender": "M",
    "Designation": "Assistant Professor ",
    "EmailId": "_"
  },
  {
    "EmpId": "5359 ",
    "EmployeeName": "NALAM DURGA DEVI ",
    "MobileNo": "8096150459 ",
    "Gender": "F",
    "Designation": "Assistant Professor ",
    "EmailId": "durgadevi_cse@acoe.edu.in "
  },
  {
    "EmpId": "1727 ",
    "EmployeeName": "P NAGA SESHA LAKSHMI ",
    "MobileNo": "9640381333 ",
    "Gender": "F",
    "Designation": "Assistant Professor ",
    "EmailId": "lakshmi_cse@acoe.edu.in "
  },
  {
    "EmpId": "5663 ",
    "EmployeeName": "PARAMESWARAKUMAR GOTTALA ",
    "MobileNo": "9030611337 ",
    "Gender": "M",
    "Designation": "Assistant Professor ",
    "EmailId": "paramesh243@gmail.com "
  },
  {
    "EmpId": "4925 ",
    "EmployeeName": "RAYAVARAPU SRI DIVYA ",
    "MobileNo": "7386880743 ",
    "Gender": "F",
    "Designation": "Assistant Professor ",
    "EmailId": "rayavarapudivya@gmail.com "
  },
  {
    "EmpId": "5595 ",
    "EmployeeName": "S MALLESWARI AKSHINTALA ",
    "MobileNo": "9849566494 ",
    "Gender": "F",
    "Designation": "Assistant Professor ",
    "EmailId": "malleswari_cse@acoe.edu.in "
  },
  {
    "EmpId": "5220 ",
    "EmployeeName": "TANGELLA DEVI SWATHI KIRANMAYI ",
    "MobileNo": "8328330751 ",
    "Gender": "F",
    "Designation": "Assistant Professor ",
    "EmailId": "kiranmayi_cse@acoe.edu.in "
  },
  {
    "EmpId": "3594 ",
    "EmployeeName": "VEDURI VEERA PRASAD ",
    "MobileNo": "9441320467 ",
    "Gender": "M",
    "Designation": "Assistant Professor ",
    "EmailId": "veeraprasad_cse@acoe.edu.in "
  },
  {
    "EmpId": "1326 ",
    "EmployeeName": "GANDIKOTA V R PAVAN KUMAR ",
    "MobileNo": "9505963334 ",
    "Gender": "M",
    "Designation": "Teaching Assistant ",
    "EmailId": "pavankumar_cse@acoe.edu.in "
  },
  {
    "EmpId": "5150 ",
    "EmployeeName": "DR GODLA SANJIV RAO ",
    "MobileNo": "9848194619 ",
    "Gender": "M ",
    "Designation": "Professor & HOD ",
    "EmailId": "sanji_grs@yahoo.com "
  },
  {
    "EmpId": "5086 ",
    "EmployeeName": "DR. BODDEPALLI KIRAN KUMAR ",
    "MobileNo": "8074032373 ",
    "Gender": "M ",
    "Designation": "HOD ",
    "EmailId": "kirankumar_cse@acoe.edu.in "
  },
  {
    "EmpId": "5615 ",
    "EmployeeName": "BANDA S N V RAMANAMURTHY ",
    "MobileNo": "9989591150 ",
    "Gender": "M ",
    "Designation": "Sr Assistant Professor ",
    "EmailId": "ramanamurthy.banda@gmail.com "
  },
  {
    "EmpId": "4721 ",
    "EmployeeName": "DR. BHATTIPROLU SRINIVAS ",
    "MobileNo": "9866732745 ",
    "Gender": "M ",
    "Designation": "Associate Professor ",
    "EmailId": "_"
  },
  {
    "EmpId": "2209 ",
    "EmployeeName": "DR. BOLLU MANIKYALA RAO ",
    "MobileNo": "9640380333 ",
    "Gender": "M ",
    "Designation": "Sr Assistant Professor ",
    "EmailId": "manik.bollu@gmail.com "
  },
  {
    "EmpId": "4837 ",
    "EmployeeName": "DR. IRAGANI NARASIMHA RAO ",
    "MobileNo": "9885160468 ",
    "Gender": "M ",
    "Designation": "Sr Assistant Professor ",
    "EmailId": "narasimharao_csm@acoe.edu.in "
  },
  {
    "EmpId": "5538 ",
    "EmployeeName": "KANTE SATYANARAYANA ",
    "MobileNo": "9550442426 ",
    "Gender": "M ",
    "Designation": "Associate Professor ",
    "EmailId": "satyanarayana_csm@acoe.edu.in "
  },
  {
    "EmpId": "3600 ",
    "EmployeeName": "NAGARAPU MADHURI ",
    "MobileNo": "9912175174 ",
    "Gender": "F ",
    "Designation": "Sr Assistant Professor ",
    "EmailId": "nagarapu.madhuri21@gmail.com "
  },
  {
    "EmpId": "5641 ",
    "EmployeeName": "TALLURI SUSHMA ",
    "MobileNo": "9398465994 ",
    "Gender": "F ",
    "Designation": "Associate Professor ",
    "EmailId": "sushma_csm@acoe.edu.in "
  },
  {
    "EmpId": "709 ",
    "EmployeeName": "V. CHANDRA SEKHARA RAO ",
    "MobileNo": "9010987771 ",
    "Gender": "M ",
    "Designation": "Associate Professor ",
    "EmailId": "chandrasekhara_csm@acoe.edu.in "
  },
  {
    "EmpId": "2431 ",
    "EmployeeName": "VENNETI KIRAN ",
    "MobileNo": "9491390511 ",
    "Gender": "M ",
    "Designation": "Associate Professor ",
    "EmailId": "kiran_csm@acoe.edu.in "
  },
  {
    "EmpId": "5740 ",
    "EmployeeName": "ANANDAKUMAR KOTIPALLI ",
    "MobileNo": "8332888677 ",
    "Gender": "M ",
    "Designation": "Assistant Professor ",
    "EmailId": "anandakumar_csm@acoe.edu.in "
  },
  {
    "EmpId": "5588 ",
    "EmployeeName": "ANGARA SATYAM ",
    "MobileNo": "9959818318 ",
    "Gender": "M ",
    "Designation": "Assistant Professor ",
    "EmailId": "satyam_csm@acoe.edu.in "
  },
  {
    "EmpId": "5702 ",
    "EmployeeName": "KANDULA ROJARANI ",
    "MobileNo": "9652151183 ",
    "Gender": "F ",
    "Designation": "Assistant Professor ",
    "EmailId": "rojarani_csm@acoe.edu.in "
  },
  {
    "EmpId": "5974 ",
    "EmployeeName": "KARRI RUPA SRAVANTHI ",
    "MobileNo": "8074129080 ",
    "Gender": "F ",
    "Designation": "Assistant Professor ",
    "EmailId": "sravanthi24613@gmail.com "
  },
  {
    "EmpId": "5283 ",
    "EmployeeName": "KONALA PADMAVATHI ",
    "MobileNo": "7093466940 ",
    "Gender": "F ",
    "Designation": "Assistant Professor ",
    "EmailId": "padmavathi_csm@acoe.edu.in "
  },
  {
    "EmpId": "4693 ",
    "EmployeeName": "KOTA K V SATYANARAYANA ",
    "MobileNo": "9492152898 ",
    "Gender": "M ",
    "Designation": "Assistant Professor ",
    "EmailId": "satyanarayana.k_csm@acoe.edu.in "
  },
  {
    "EmpId": "2720 ",
    "EmployeeName": "KROVVIDI S B AMBIKA ",
    "MobileNo": "9542364482 ",
    "Gender": "F ",
    "Designation": "Assistant Professor ",
    "EmailId": "ksbambika@gmail.com "
  },
  {
    "EmpId": "5573 ",
    "EmployeeName": "KURIVELLA N S K SANTHOSH ",
    "MobileNo": "9030187871 ",
    "Gender": "M ",
    "Designation": "Assistant Professor ",
    "EmailId": "santhosh_csm@acoe.edu.in "
  },
  {
    "EmpId": "5290 ",
    "EmployeeName": "SUNKARA DIVYAJABILI DEVI ",
    "MobileNo": "8985369258 ",
    "Gender": "F ",
    "Designation": "Assistant Professor ",
    "EmailId": "padmavathi_csm@acoe.edu.in "
  },
  {
    "EmpId": "5671 ",
    "EmployeeName": "SUNKAVILLI VIJAYA NIRMALA ",
    "MobileNo": "9133119515 ",
    "Gender": "F ",
    "Designation": "Assistant Professor ",
    "EmailId": "nirmala_csm@acoe.edu.in "
  },
  {
    "EmpId": "4820 ",
    "EmployeeName": "YADAVALLI SURESH KUMAR ",
    "MobileNo": "7893681828 ",
    "Gender": "M ",
    "Designation": "Assistant Professor ",
    "EmailId": "sureshkumar_csm@acoe.edu.in "
  },
  {
    "EmpId": "5756 ",
    "EmployeeName": "YERRAMSETTI SRINIVASA RAO ",
    "MobileNo": "9502774886 ",
    "Gender": "M ",
    "Designation": "Assistant Professor ",
    "EmailId": "srinu.srinu1990@gmail.com "
  },
  {
    "EmpId": "5067 ",
    "EmployeeName": "YERRAVARAPU V V DURGA PRASAD ",
    "MobileNo": "8096513248 ",
    "Gender": "M ",
    "Designation": "Assistant Professor ",
    "EmailId": "pattabhi527@gmail.com "
  },
  {
    "EmpId": "4196 ",
    "EmployeeName": "PALIVELA JYOTHI ",
    "MobileNo": "9959083448 ",
    "Gender": "F ",
    "Designation": "Teaching Assistant ",
    "EmailId": "jyothi_cse@acoe.edu.in "
  },
  {
    "EmpId": "5380 ",
    "EmployeeName": "PALIVELA MADHU BHARATHI ",
    "MobileNo": "6301719536 ",
    "Gender": "F ",
    "Designation": "Teaching Assistant ",
    "EmailId": "bharathi_cse@acoe.edu.in "
  },
  {
    "EmpId": "4362 ",
    "EmployeeName": "DR. CHALUVADI V RAGHAVENDRAN ",
    "MobileNo": "9440674553 ",
    "Gender": "M ",
    "Designation": "Dean-Academics ",
    "EmailId": "raghuchv@yahoo.com "
  },
  {
    "EmpId": "1275 ",
    "EmployeeName": "R V V N BHEEMA RAO ",
    "MobileNo": "9951798999 ",
    "Gender": "M ",
    "Designation": "Associate Professor & HOD ",
    "EmailId": "rvvnbrao@gmail.com "
  },
  {
    "EmpId": "1330 ",
    "EmployeeName": "DR. KOVVURI N BHARGAVI ",
    "MobileNo": "8919776949 ",
    "Gender": "F ",
    "Designation": "Associate Professor ",
    "EmailId":"_"
  },
  {
    "EmpId": "3945 ",
    "EmployeeName": "THIRUVEEDULA SRINIVASULU ",
    "MobileNo": "8919933894 ",
    "Gender": "M ",
    "Designation": "Sr Assistant Professor ",
    "EmailId": "tsrinu531@gmail.com "
  },
  {
    "EmpId": "5249 ",
    "EmployeeName": "G L NARASAMBA VANGURI ",
    "MobileNo": "7396566314 ",
    "Gender": "F ",
    "Designation": "Assistant Professor ",
    "EmailId": "gayatrijeedigunta05@gmail.com "
  },
  {
    "EmpId": "5070 ",
    "EmployeeName": "JUVVALA SAILAJA ",
    "MobileNo": "8341485222 ",
    "Gender": "F ",
    "Designation": "Assistant Professor ",
    "EmailId": "sailu.sailaja130@gmail.com "
  },
  {
    "EmpId": "1255 ",
    "EmployeeName": "NAGIREDDI SURYA KALA ",
    "MobileNo": "9848270337 ",
    "Gender": "F ",
    "Designation": "Assistant Professor ",
    "EmailId": "kala.nagireddi@gmail.com "
  },
  {
    "EmpId": "5706 ",
    "EmployeeName": "PERABATHULA LATHA ",
    "MobileNo": "9573338783 ",
    "Gender": "F ",
    "Designation": "Assistant Professor ",
    "EmailId": "lathakiran2631@gmail.com "
  },
  {
    "EmpId": "4796 ",
    "EmployeeName": "POTHURAJU CHANDRA KALA ",
    "MobileNo": "8688386516 ",
    "Gender": "F ",
    "Designation": "Teaching Assistant ",
    "EmailId": "_"
  },
  {
    "EmpId": "1565 ",
    "EmployeeName": "TALLADA PADMA PRAVEEN ",
    "MobileNo": "9949563020 ",
    "Gender": "M ",
    "Designation": "Assistant Professor & HOD ",
    "EmailId": "talladapraveen@gmail.com "
  },
  {
    "EmpId": "4939 ",
    "EmployeeName": "DR. CHOKKAREDDY RAJASEKHAR REDDY ",
    "MobileNo": "9177039373 ",
    "Gender": "M ",
    "Designation": "HOD ",
    "EmailId": "hodbse@acoe.edu.in "
  },
  {
    "EmpId": "4000 ",
    "EmployeeName": "DR. JILLELLA M KANTHI THILAKA ",
    "MobileNo": "9490480262 ",
    "Gender": "F ",
    "Designation": "Professor ",
    "EmailId": "jmkanthi20@gmail.com "
  },
  {
    "EmpId": "1014 ",
    "EmployeeName": "DASARI SRAVANI ",
    "MobileNo": "9989751455 ",
    "Gender": "F ",
    "Designation": "Sr Assistant Professor ",
    "EmailId": "sravanidasari4@gmail.com "
  },
  {
    "EmpId": "5339 ",
    "EmployeeName": "DR. AKKARABOYINA L LAVANYA ",
    "MobileNo": "9160796186 ",
    "Gender": "F ",
    "Designation": "Sr Assistant Professor ",
    "EmailId": "lavanya.a_bse@acoe.edu.in "
  },
  {
    "EmpId": "4979 ",
    "EmployeeName": "DR. ALTHADA RAMESH BABU ",
    "MobileNo": "9491577939 ",
    "Gender": "M ",
    "Designation": "Sr Assistant Professor ",
    "EmailId": "rameshbabu.althada@gmail.com "
  },
  {
    "EmpId": "5502 ",
    "EmployeeName": "DR. ANSHU CHATTERJEE ",
    "MobileNo": "7699023897 ",
    "Gender": "M ",
    "Designation": "Sr Assistant Professor ",
    "EmailId": "chatterjee_bse@acoe.edu.in "
  },
  {
    "EmpId": "3711 ",
    "EmployeeName": "DR. GUDDATI BALA CHANDRA MOULI ",
    "MobileNo": "9440494036 ",
    "Gender": "M ",
    "Designation": "Associate Professor ",
    "EmailId": "gbchandramouli@gmail.com "
  },
  {
    "EmpId": "3721 ",
    "EmployeeName": "DR. NAKKA RAJESWARA RAO ",
    "MobileNo": "9701720827 ",
    "Gender": "M ",
    "Designation": "Associate Professor ",
    "EmailId": "rajeshn9@gmail.com "
  },
  {
    "EmpId": "2007 ",
    "EmployeeName": "DR. P S V SHANMUKHI ",
    "MobileNo": "9491158113 ",
    "Gender": "M ",
    "Designation": "Associate Professor ",
    "EmailId": "shanmukhi.papana@gmail.com "
  },
  {
    "EmpId": "5650 ",
    "EmployeeName": "GUDA SUDHAKAR ",
    "MobileNo": "9603071666 ",
    "Gender": "M ",
    "Designation": "Sr Assistant Professor ",
    "EmailId": "sudhakar_bse@acoe.edu.in "
  },
  {
    "EmpId": "2042 ",
    "EmployeeName": "J BALA MOHAN RAJU ",
    "MobileNo": "9246464569 ",
    "Gender": "M ",
    "Designation": "Sr Assistant Professor ",
    "EmailId": "mohanraju_bse@acoe.edu.in "
  },
  {
    "EmpId": "5351 ",
    "EmployeeName": "KAKI SWAMY ",
    "MobileNo": "9618642215 ",
    "Gender": "M ",
    "Designation": "Sr Assistant Professor ",
    "EmailId": "swamy_bse@acoe.edu.in "
  },
  {
    "EmpId": "5285 ",
    "EmployeeName": "MALLIREDDY NARESH ",
    "MobileNo": "7010832410 ",
    "Gender": "M ",
    "Designation": "Sr Assistant Professor ",
    "EmailId": "naresh_cse@acoe.edu.in "
  },
  {
    "EmpId": "4627 ",
    "EmployeeName": "SAFEERUDDIN KHAN ",
    "MobileNo": "8790367721 ",
    "Gender": "M ",
    "Designation": "Sr Assistant Professor ",
    "EmailId": "safeeruddin_mech@acoe.edu.in "
  },
  {
    "EmpId": "5036 ",
    "EmployeeName": "VENKATA RAMANAIAH JAMMISETTI ",
    "MobileNo": "9493088184 ",
    "Gender": "M ",
    "Designation": "Sr Assistant Professor ",
    "EmailId": "venkataramanaiah_bse@acoe.edu.in "
  },
  {
    "EmpId": "5941 ",
    "EmployeeName": "BALARAM GANGADA ",
    "MobileNo": "8142313801 ",
    "Gender": "M ",
    "Designation": "Assistant Professor ",
    "EmailId": "balaram_bse@acoe.edu.in "
  },
  {
    "EmpId": "4845 ",
    "EmployeeName": "DADI SANDHYA SARASWATHI ",
    "MobileNo": "7815960261 ",
    "Gender": "F ",
    "Designation": "Assistant Professor ",
    "EmailId": "sandhyasaraswathi7@gmail.com "
  },
  {
    "EmpId": "4058 ",
    "EmployeeName": "DIGUMARTHI V SARADHI ",
    "MobileNo": "8985944025 ",
    "Gender": "M ",
    "Designation": "Assistant Professor ",
    "EmailId": "saradhid9@gmail.com "
  },
  {
    "EmpId": "5774 ",
    "EmployeeName": "DR. ABBIREDDY SRIDHAR REDDY ",
    "MobileNo": "9010893336 ",
    "Gender": "M ",
    "Designation": "Assistant Professor ",
    "EmailId": "sridhar_mech@acoe.edu.in "
  },
  {
    "EmpId": "5363 ",
    "EmployeeName": "DUBA DURGA VENKATA PEDDINTLA KUMARI ",
    "MobileNo": "7989432687 ",
    "Gender": "F ",
    "Designation": "Assistant Professor ",
    "EmailId": "kumari_cse@acoe.edu.in "
  },
  {
    "EmpId": "5704 ",
    "EmployeeName": "DULAM SRINIVASA RAO ",
    "MobileNo": "9676732372 ",
    "Gender": "M ",
    "Designation": "Assistant Professor ",
    "EmailId": "srinivasrao50@gmail.com "
  },
  {
    "EmpId": "5315 ",
    "EmployeeName": "GURRAM VENKATA NAGA BHAGYA SREE ",
    "MobileNo": "9705955891 ",
    "Gender": "F ",
    "Designation": "Assistant Professor ",
    "EmailId": "bhagyasree_cse@acoe.edu.in "
  },
  {
    "EmpId": "5228 ",
    "EmployeeName": "KARRI SIVA PRASANNA ",
    "MobileNo": "9542174417 ",
    "Gender": "F ",
    "Designation": "Assistant Professor ",
    "EmailId": "sivaprasanna_bse@acoe.edu.in "
  },
  {
    "EmpId": "5571 ",
    "EmployeeName": "MUMMIDI SIVA SANKAR ",
    "MobileNo": "9618771114 ",
    "Gender": "M ",
    "Designation": "Assistant Professor ",
    "EmailId": "msivasankar1114@gmail.com "
  },
  {
    "EmpId": "2026 ",
    "EmployeeName": "NADIPUDI PUNNAPU CHANDRUDU ",
    "MobileNo": "9000827323 ",
    "Gender": "M ",
    "Designation": "Assistant Professor ",
    "EmailId": "punnapuchandrudu_bse@acoe.edu.in "
  },
  {
    "EmpId": "5217 ",
    "EmployeeName": "KUNUKU VENKATA RAMANA ",
    "MobileNo": "8978497268 ",
    "Gender": "M ",
    "Designation": "Librarian ",
    "EmailId": "ramana178@gmail.com "
  },
  {
    "EmpId": "165 ",
    "EmployeeName": "DR. BUDDANA SURYANARAYANA MURTHY ",
    "MobileNo": "9848978188 ",
    "Gender": "M ",
    "Designation": "Associate Professor & HOD ",
    "EmailId": "bsn3213@gmail.com "
  },
  {
    "EmpId": "4050 ",
    "EmployeeName": "BUDIDA JYOTHI ",
    "MobileNo": "9502148180 ",
    "Gender": "F ",
    "Designation": "HOD ",
    "EmailId": "hod2bse@acoe.edu.in "
  },
  {
    "EmpId": "768 ",
    "EmployeeName": "CHADA LALITHA ALIVELU MANGA TAYARU ",
    "MobileNo": "9959230525 ",
    "Gender": "F ",
    "Designation": "Associate Professor ",
    "EmailId": "ch.lalitha16@gmail.com "
  },
  {
    "EmpId": "4943 ",
    "EmployeeName": "DR. BALAJI PRAKASH ",
    "MobileNo": "9381594187 ",
    "Gender": "M ",
    "Designation": "Associate Professor ",
    "EmailId": "balaji_bse@acoe.edu.in "
  },
  {
    "EmpId": "5050 ",
    "EmployeeName": "DR. DIDDI SRINIVASA RAO ",
    "MobileNo": "9492389820 ",
    "Gender": "M ",
    "Designation": "Sr Assistant Professor ",
    "EmailId": "srinurit@gmail.com "
  },
  {
    "EmpId": "5209 ",
    "EmployeeName": "DR. GORANTLA KIRAN KUMAR ",
    "MobileNo": "9740251522 ",
    "Gender": "M ",
    "Designation": "Associate Professor ",
    "EmailId": "kiran_bse@acoe.edu.in "
  },
  {
    "EmpId": "4650 ",
    "EmployeeName": "DR.MURALASETTI NOOKARAJU ",
    "MobileNo": "9951847366 ",
    "Gender": "M ",
    "Designation": "Sr Assistant Professor ",
    "EmailId": "mnookarajuphd@gmail.com "
  },
  {
    "EmpId": "5805 ",
    "EmployeeName": "KARRI NAGARAJU ",
    "MobileNo": "9392752230 ",
    "Gender": "M ",
    "Designation": "Associate Professor ",
    "EmailId": "nag2230@gmail.com "
  },
  {
    "EmpId": "5394 ",
    "EmployeeName": "KHASIMBEE SHAIK ",
    "MobileNo": "7731068542 ",
    "Gender": "F ",
    "Designation": "Sr Assistant Professor ",
    "EmailId": "khasimbee_cse@acoe.edu.in "
  },
  {
    "EmpId": "5032 ",
    "EmployeeName": "MEDINTY SHYAM SUNDAR MOHAN KUMAR ",
    "MobileNo": "9963977796 ",
    "Gender": "M ",
    "Designation": "Sr Assistant Professor ",
    "EmailId": "shyamsundar_bse@acoe.edu.in "
  },
  {
    "EmpId": "1504 ",
    "EmployeeName": "MUMMIDIVARAPU NAGA RAJU ",
    "MobileNo": "9052850557 ",
    "Gender": "M ",
    "Designation": "Sr Assistant Professor ",
    "EmailId": "nagaraju0206@gmail.com "
  },
  {
    "EmpId": "1003 ",
    "EmployeeName": "POTHAMSETTI RAJA SEKHAR REDDY ",
    "MobileNo": "8885988111 ",
    "Gender": "M ",
    "Designation": "Sr Assistant Professor ",
    "EmailId": "sekharreddy_bse@acoe.edu.in "
  },
  {
    "EmpId": "823 ",
    "EmployeeName": "TELUGU NEELIMA ",
    "MobileNo": "9963850771 ",
    "Gender": "F ",
    "Designation": "Associate Professor ",
    "EmailId": "teluguneelima@gmail.com "
  },
  {
    "EmpId": "3582 ",
    "EmployeeName": "AHAMED NASEEMUDDIN ",
    "MobileNo": "9700686705 ",
    "Gender": "M ",
    "Designation": "Assistant Professor ",
    "EmailId": "naseemuddin_mech@acoe.edu.in "
  },
  {
    "EmpId": "5757 ",
    "EmployeeName": "AKSHINTHALA ANILKUMAR ",
    "MobileNo": "9014959479 ",
    "Gender": "M ",
    "Designation": "Assistant Professor ",
    "EmailId": "anilkumarakshinthala@gmail.com "
  },
  {
    "EmpId": "5690 ",
    "EmployeeName": "BALIJIREDDY VIJAYA SATHYA DURGA RAGINI ",
    "MobileNo": "9398003179 ",
    "Gender": "F ",
    "Designation": "Assistant Professor ",
    "EmailId": "balijireddydurgaragini@gmail.com "
  },
  {
    "EmpId": "5587 ",
    "EmployeeName": "CHALAMALASETTI HIMA BINDU ",
    "MobileNo": "9951438662 ",
    "Gender": "F ",
    "Designation": "Assistant Professor ",
    "EmailId": "bindunaidu095@gmail.com "
  },
  {
    "EmpId": "5578 ",
    "EmployeeName": "DAMAYANTHI ATTI ",
    "MobileNo": "8885182656 ",
    "Gender": "F ",
    "Designation": "Assistant Professor ",
    "EmailId": "damayanthi_bse@acoe.edu.in "
  },
  {
    "EmpId": "5392 ",
    "EmployeeName": "DR. CHITRADA PRASAD ",
    "MobileNo": "9490263136 ",
    "Gender": "M ",
    "Designation": "Assistant Professor ",
    "EmailId": "prasad.c_bse@acoe.edu.in "
  },
  {
    "EmpId": "5372 ",
    "EmployeeName": "DR. PRAKASH GADIPELLI ",
    "MobileNo": "7013518130 ",
    "Gender": "M ",
    "Designation": "Assistant Professor ",
    "EmailId": "jamesprakash68669@gmail.com "
  },
  {
    "EmpId": "5612 ",
    "EmployeeName": "DR. RAJESH ELLA ",
    "MobileNo": "9182860689 ",
    "Gender": "M ",
    "Designation": "Assistant Professor ",
    "EmailId": "rajesh.e_bse@acoe.edu.in "
  },
  {
    "EmpId": "264 ",
    "EmployeeName": "JAYANTHI VENKATA SIVA RAM KUMAR ",
    "MobileNo": "9441662969 ",
    "Gender": "M ",
    "Designation": "Assistant Professor ",
    "EmailId": "jayanth_sk2006@yahoo.co.in "
  },
  {
    "EmpId": "4832 ",
    "EmployeeName": "KANCHAPU DURGA BHAVANI  ",
    "MobileNo": "7997933779 ",
    "Gender": "F ",
    "Designation": "Assistant Professor ",
    "EmailId": "durgabhavani_bse@acoe.edu.in "
  },
  {
    "EmpId": "4304 ",
    "EmployeeName": "MARY JYOTHI M ",
    "MobileNo": "9951694318 ",
    "Gender": "F ",
    "Designation": "Assistant Professor ",
    "EmailId": "maryjyothi_bse@acoe.edu.in "
  },
  {
    "EmpId": "5784 ",
    "EmployeeName": "NAKKA VENKATA SAI MANIKANTA ",
    "MobileNo": "9533361332 ",
    "Gender": "M ",
    "Designation": "Assistant Professor ",
    "EmailId": "manikanta_bse@acoe.edu.in "
  },
  {
    "EmpId": "5581 ",
    "EmployeeName": "PITHANI DIVYA ",
    "MobileNo": "7993778809 ",
    "Gender": "F ",
    "Designation": "Assistant Professor ",
    "EmailId": "divya_bse@acoe.edu.in "
  },
  {
    "EmpId": "5350 ",
    "EmployeeName": "RAJANALA SIVA MADHULATHA ",
    "MobileNo": "8919626375 ",
    "Gender": "F ",
    "Designation": "Assistant Professor ",
    "EmailId": "skytube512@gmail.com "
  },
  {
    "EmpId": "5701 ",
    "EmployeeName": "RAMESH SABBAVARAPU ",
    "MobileNo": "9652876867 ",
    "Gender": "M ",
    "Designation": "Assistant Professor ",
    "EmailId": "ramesh.sabbavarapu7@gmail.com "
  }
];


// Function to insert deansList into Firestore
Future<void> insertIqacList() async {
  final IqacCollection = FirebaseFirestore.instance.collection('Committee');

  for (var iqac in EmployeeData) {
    await IqacCollection.add(iqac);
  }
}
