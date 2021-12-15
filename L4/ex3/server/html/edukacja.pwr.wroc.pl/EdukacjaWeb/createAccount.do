<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    
    <meta http-equiv="X-UA-Compatible" content="IE=EDGE">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">     

    
        <link rel="stylesheet" type="text/css" href="css/reset.css"/>
        <link rel="stylesheet" type="text/css" href="css/base.css"/>
    


        <title>New account :: JSOS :: Oauth authorization server </title>    

        <link rel="stylesheet" type="text/css" href="css/custom-form-elements.css"/>
        <link rel="stylesheet" type="text/css" href="css/createAccount.css"/>
        <link rel="stylesheet" type="text/css" href="css/authenticate.css"/>
        
        <script type="text/javascript" src="js/jquery-1.6.2.min.js"></script>
        <script type="text/javascript" src="js/custom-form-elements.js"></script>
        <script type="text/javascript" src="js/validation-type.js"></script>
        <script src="https://www.google.com/recaptcha/api.js" async="" defer=""></script>
    </head>
<body>  

    <!-- <div class="header">
        <div class="title">
            <span class="edukacja">JSOS</span>
            <span class="oauth"></span>
        </div>
    </div> -->
    
        
        
    
    <div class="centered wide top">
        
	    <form id="createAccountForm1" method="post" action="wicket/page?1-2.IFormSubmitListener-createAccountForm"><div style="width:0px;height:0px;position:absolute;left:-100px;top:-100px;overflow:hidden"><input type="hidden" name="createAccountForm1_hf_0" id="createAccountForm1_hf_0" /></div>
	    
            <input type="hidden" value="http:/edukacja.pwr.wroc.pl/EdukacjaWeb" name="oauth_request_url"/>
        	<input type="hidden" value="C483406578E35464DYUVCLZPVHRCYXPB9Y3GNVXRONDQ7LOMQ2PVGPFZAIKDYQAJ6IKT03V1M7LK7OCLKH8FM5BKGOUMM7AU5YJ7PKOCABFNDSLVZSSLVL3N6FFMB6WR" name="oauth_consumer_key"/>
		    <input type="hidden" value="R3168907259IMXC2YYCAQP47EFEUYNDLYEC1LBRVR5T02J5KZTZJ0YIYH2U6BFQ5GLJ893XQ46AT99SE8EDYMVJFG68XRH08RD8CM3A4ZAC98ADPH85XB9KXSR50KYYWJJ5WD2I7OQ8V6X5YEDV3RL5K5ED7290ITI5MDWX6YDTI7PV7504BJ4GPXJ3FCJQI9DHKT34DQOMYA1RAFHJLEH7Q192PFOO8RA20TZKWPQ9U68ZC0M1Q0Y8BNJ99RSMIZOZ41C648TGKP732W3FGMXJEUCAKS7EOF9Y7K6H8FHAP6CDJNPPEP6WT19OTJLSN2ES9EKBBKQ6S9XYH2ZYHDBHHIN14S9WIV2ZKXPV7GV6Z3VB49NBWWA5K1TE6U7TGT5D6NTPJV5GH6SLRAC1OK13XWERRXPNA1K5QO0N4SRE23QCB5FVF9XDPJ4YKJDTWPM8VT9V23FRNSF81TM76M10LP4A8DH0IEMYWZ8E9UM21CMQDR5Q5ETHFRJ36QWLI1PKRONAO8A8ZNRYGA1DRAHX5512P4ZRVCNT19110FY42KFV1KGX1DIN6RNHSN1KKX10XSZGQ0ITVXS7PI0RIIE23AAUX2LLD050DFBSLZRWABUW9N8B5GMO7CUVVL130NU8C4ZBHSNTU9YCXJ53J79KCZV81CWMML5NFU7RGW4ZPK15VZYETAODNPHDHVX4ETG9454EF929SAP8ZTNUNKZABN1XQ4WVQL9UQ5JB90OMKDLMI484GWEPHI7V9096VC3JF9J8UBG8YLWTS9161BK74GP06TH4DR50N5UCGODEIBJ9S81ACUDZTTJM21D73M9LRR68YELJM4GWPRBINV37KPMP78KJBMZ92QIRNNUYZUVJKV4PWHFOBWAYZRSA0LSOVYNDE5HMPZQ5KRF3PZ7MIA71HA1O8MNUSJWZ0MCLG5TVNQ2ORZXJVZQC8P2NS4GHJN4KERP551I609P8AY74MD719ZMSRT3ZTYG2HSUW0FPW9FLJO9REINJSMRD5K" name="oauth_token"/>
		    <input type="hidden" value="" name="username"/>
		    <input type="hidden" value="" name="oauth_locale"/>
	    
	   		 <div class="panel">
	   		 
	   		 	<div class="avatar"></div>
        
		        
		        	 <div class="formHeader">
			            <div class="switches x-switch-group">
					            <span class="x-switch">
				                    <input id="validationTypePESEL" type="radio" class="x-input wicket-id3" name="validationType" value="radio11"/>
				                    <label for="validationTypePESEL" class="label radio-label x-label x-deselected">Polish citizenship </label>
			                    </span>
			                    <span class="x-switch">
			                        <input id="validationTypePASSPORT" type="radio" class="x-input wicket-id3" name="validationType" value="radio12" checked="checked"/>
			                        <label for="validationTypePASSPORT" class="label radio-label x-label x-selected">Other citizenship </label>
			                    </span>
			            </div>
			            
			            <div class="clear"></div>
		          	</div>       
            	 
            	<div class="panelCont">
            		<h1 class="row mainInformation">You are setting a new account at the JSOS system</h1> 
			        <div class="row komunikat"></div>
			        
	                <div class="row credentials">
		                <div class="column left">
				           <!-- label wicket:id="nameLabel" for="name" class="label">Name</label><br />-->
			               <input type="text" class="credential" placeholder="Name (as in identity card)" maxlength="100" value="" name="name"/>
			            </div>
			        
			            <div class="column right">
		                    <!-- label wicket:id="surnameLabel" for="surname" class="label">Name</label><br />-->
		                    <input type="text" class="credential" placeholder="Last name (as in identity card) " maxlength="100" value="" name="surname"> 
		                </div>
		                
	                	<div id="validationPanelPESEL" class="validationPanel">
	                   		<!-- label wicket:id="peselLabel" id="peselLabel" for="pesel" class="label">PESEL</label><br />-->
	                    	<input id="pesel" type="text" placeholder="PESEL number " class="credential" maxlength="11" value="" name="pesel"/>
		                    <div class="peselValidationDisabled">
		                    	<input id="peselValidationDisabled" type="checkbox" name="peselValidationDisabled"/>
		                    	<label id="peselValidationDisabledLabel" for="peselValidationDisabled">Switch of the PESEL number correctness control</label>
		                    </div>
	                    </div>
	
	                    <div id="validationPanelPASSPORT" class="validationPanel">
	                       
		                	<div class="row credentials" >	
			                	<div class="left column">
			                		<select id="nationality" class="credential" name="nationality">
<option selected="selected" value="">Select your citizenship</option>
<option value="AF">Afghan</option>
<option value="AL">Albanian</option>
<option value="DZ">Algerian</option>
<option value="UM">American (islands)</option>
<option value="US">American (USA)</option>
<option value="AD">Andorran</option>
<option value="AO">Angolan</option>
<option value="AI">Anguillan</option>
<option value="AQ">Antarctican</option>
<option value="AG">Antiguan and Barbudan</option>
<option value="AN">The Netherlands Antilles</option>
<option value="SA">Saudi Arabian</option>
<option value="AR">Argentinian</option>
<option value="AM">Armenian</option>
<option value="AW">Aruban</option>
<option value="AU">Australian</option>
<option value="AT">Austrian</option>
<option value="AZ">Azerbaijani</option>
<option value="BS">Bahamas</option>
<option value="BH">Bahrain</option>
<option value="BD">Bangladeshi</option>
<option value="BB">Barbadian</option>
<option value="BE">Belgian</option>
<option value="BZ">Belizean</option>
<option value="BJ">Beninese</option>
<option value="BM">Bermudan</option>
<option value="00">Stateless</option>
<option value="BT">Bhutanese</option>
<option value="BY">Belarusian</option>
<option value="BO">Bolivian</option>
<option value="BW">Botswanian</option>
<option value="BA">Bosnian-Herzegovinian</option>
<option value="BR">Brazilian</option>
<option value="BN">Bruneian</option>
<option value="GB">British</option>
<option value="IO">British Indian Sea Territory </option>
<option value="VG">British Virgin Islands</option>
<option value="BG">Bulgarian</option>
<option value="BF">Burkinabe </option>
<option value="BI">Burundian</option>
<option value="CL">Chilean</option>
<option value="CN">Chinese</option>
<option value="HR">Croatian</option>
<option value="CY">Cypriot</option>
<option value="TD">Chadian</option>
<option value="CZZ">Montenegrin</option>
<option value="CZ">Czech</option>
<option value="CD">Democratic Republic of the Congo</option>
<option value="DO">Dominican</option>
<option value="DM">of Dominica</option>
<option value="DK">Danish</option>
<option value="DJ">Djibouti</option>
<option value="EG">Egiptian</option>
<option value="EC">Ecuadorean</option>
<option value="ER">Eritrean</option>
<option value="EE">Estonian</option>
<option value="ET">Ethiopian</option>
<option value="FK">Falkland</option>
<option value="FM">Federated States of Micronesia</option>
<option value="FJ">Fijian</option>
<option value="PH">Philipinian</option>
<option value="FI">Finninsh</option>
<option value="FR">French</option>
<option value="FX">French (Metropoly)</option>
<option value="TF">French (south terirories)</option>
<option value="GA">Gabonese</option>
<option value="GM">Gambian</option>
<option value="GS">South Georgia and Sandwich Islands</option>
<option value="GH">Ghanaian</option>
<option value="GI">Gibraltar</option>
<option value="GR">Greek</option>
<option value="GD">Grenadian</option>
<option value="GL">Greenlandian</option>
<option value="GE">Georgian </option>
<option value="GU">Guam</option>
<option value="GY">Guyanese</option>
<option value="GF">French guyanese</option>
<option value="GP">Guadelupian </option>
<option value="GT">Guatemalan </option>
<option value="GN">Guinean</option>
<option value="GW">Guinean (Bissau)</option>
<option value="GQ">Guinean (Equatorial)</option>
<option value="HT">Haitian </option>
<option value="ES">Spanish</option>
<option value="NL">Dutch</option>
<option value="HN">Honduran</option>
<option value="HK">Hong Kong</option>
<option value="ID">Indonesian</option>
<option value="IN">Indian</option>
<option value="IQ">Iraqui</option>
<option value="IR">Iranian </option>
<option value="IE">Irish</option>
<option value="IS">Islandian</option>
<option value="IL">Israeli</option>
<option value="JM">Jamaican</option>
<option value="JP">Japanese</option>
<option value="YE">Yemeni</option>
<option value="JO">Jordanian</option>
<option value="KY">Cayman</option>
<option value="KH">Cambodian</option>
<option value="CM">Cameroonian</option>
<option value="CA">Canadian</option>
<option value="QA">Quatari</option>
<option value="KZ">Kazakh</option>
<option value="KE">Kenyan</option>
<option value="KG">Kyrgyz</option>
<option value="KI">Kiribatian</option>
<option value="CO">Columbian</option>
<option value="KM">Comorian</option>
<option value="CG">Congolese</option>
<option value="KR">South Korean</option>
<option value="KP">North Korean</option>
<option value="KV">Kosovar</option>
<option value="CR">Costarican</option>
<option value="CU">Cuban</option>
<option value="KW">Kuwaiti</option>
<option value="LA">Laotian</option>
<option value="LS">Lesotho</option>
<option value="LB">Lebanese</option>
<option value="LR">Liberian</option>
<option value="LY">Libyan</option>
<option value="LI">Liechstenstein</option>
<option value="LT">Lithuanian</option>
<option value="LU">Luxembourgeois</option>
<option value="LV">Latvian</option>
<option value="MK">Macedonian</option>
<option value="MG">Madagascarian</option>
<option value="YT">Mayotte</option>
<option value="MO">Macau</option>
<option value="MW">Malawian</option>
<option value="MV">Maldivian</option>
<option value="MY">Malaysian </option>
<option value="ML">Malian</option>
<option value="MT">Maltese</option>
<option value="MP">North Mariana Islands</option>
<option value="MA">Moroccan </option>
<option value="MQ">Martinique</option>
<option value="MR">Mauritanian </option>
<option value="MU">Mauritian </option>
<option value="MX">Mexican</option>
<option value="MM">Myanmar</option>
<option value="MD">Moldovan</option>
<option value="MC">Monegasque</option>
<option value="MN">Mongolian</option>
<option value="MS">Montserratian</option>
<option value="MZ">Mozambique</option>
<option value="NA">Namibian</option>
<option value="NR">Nauruan</option>
<option value="NP">Nepalese</option>
<option value="DE">German</option>
<option value="NE">Nigeran</option>
<option value="NG">Nigerian</option>
<option value="NI">Nicaraguan</option>
<option value="NU">Niuean</option>
<option value="NF">Norfolk</option>
<option value="NO">Norwegian</option>
<option value="NC">New Caledonian</option>
<option value="NZ">New Zealandian</option>
<option value="OM">Omani</option>
<option value="PK">Pakistani</option>
<option value="PW">Palauan</option>
<option value="PS">Palestinian</option>
<option value="PA">Panamanian</option>
<option value="PG">Papua New Guinean</option>
<option value="PY">Paraguayan </option>
<option value="PE">Peruwian </option>
<option value="PN">Pitcairn Islands</option>
<option value="PF">French Polinesian</option>
<option value="ZA">Southafrican</option>
<option value="PR">Portorican</option>
<option value="PT">Portugese </option>
<option value="CV">Cape Verdean</option>
<option value="RE">Reunion</option>
<option value="RU">Russian</option>
<option value="RD">Rwandan </option>
<option value="RO">Romanian</option>
<option value="RW">Rwandan </option>
<option value="KN">Saint Kitts and Nevis </option>
<option value="LC">Saint Lucian</option>
<option value="PM">Saint Pierre ang Miquelon </option>
<option value="VC">Saint Vincent and The Grenadines</option>
<option value="SV">Salvadoran</option>
<option value="AS">American (Samoa)</option>
<option value="WS">West Samoan</option>
<option value="SM">San Marino</option>
<option value="SN">Senegalese</option>
<option value="SRB">Serbian</option>
<option value="YU">Serbian and montenegrin</option>
<option value="RS">Serbian</option>
<option value="SC">Seyshellois</option>
<option value="SL">Sierra Leoneans</option>
<option value="SG">Singaporean </option>
<option value="SK">Slovakian</option>
<option value="SI">Slovenian</option>
<option value="SO">Somalian</option>
<option value="LK">Sri Lankan</option>
<option value="SZ">Swazi (Ngwane)</option>
<option value="SD">Sudanese</option>
<option value="SR">Surinamese</option>
<option value="SJ">Svalbard and Jan Mayen Islands</option>
<option value="SY">Syrian</option>
<option value="CH">Swiss</option>
<option value="SE">Swedish</option>
<option value="CF">Central African</option>
<option value="SH">Saint Helens</option>
<option value="TJ">Tajik</option>
<option value="TH">Thai</option>
<option value="TW">Taiwanese</option>
<option value="TZ">Tanzanian</option>
<option value="TP">East Timorese</option>
<option value="TG">Togo</option>
<option value="TK">Tokelauans</option>
<option value="TO">Tongan</option>
<option value="TT">Trinidad and Tobago</option>
<option value="TN">Tunisian</option>
<option value="TR">Turkish</option>
<option value="TM">Turkmen</option>
<option value="TC">Turks and Caicos Islands</option>
<option value="TV">Tuvalu Islands</option>
<option value="UG">Ugandan</option>
<option value="UA">Ukrainian</option>
<option value="UY">Uruguayan </option>
<option value="UZ">Uzbek</option>
<option value="VU">Vanuatan</option>
<option value="WF">Wallis and Futuna Islands</option>
<option value="VA">Vatican</option>
<option value="VE">Venezuelan </option>
<option value="HU">Hungarian</option>
<option value="VN">Vietnamese</option>
<option value="IT">Italian</option>
<option value="CI">Ivory Coast</option>
<option value="BV">Bouvet Islands </option>
<option value="CX">Christmas Island</option>
<option value="CK">Cook Islands</option>
<option value="VI">Virgin islands (USA)</option>
<option value="FO">Faroe Islands</option>
<option value="HM">Heard Islands and McDonald Islands</option>
<option value="CC">Coco Islands</option>
<option value="MH">Marshall Islands</option>
<option value="SB">Solomon Islands</option>
<option value="ST">Saint Thomas and Prince Islands</option>
<option value="EH">Western Sahara</option>
<option value="ZM">Zambian</option>
<option value="ZW">Zimbabwean </option>
<option value="AE">Emirati</option>
</select>
		                        </div>		                      
				                <div class="clear"></div>
	                        </div>
	                        
	                        <div class="row credentials" >
		                        <div class="left column">	
			                        <select id="documentType" class="credential" name="documentType">
<option selected="selected" value="">Select the type of your identity document</option>
<option value="PA">Passport</option>
<option value="DW">ID card</option>
<option value="KP">The residence card</option>
<option value="PT">Polish identity document foreigner</option>
</select>
			                	</div>
			                    <!-- div class="right column">
				                    <input wicket:id="documentSeries" id="documentSeries" type="text" placeholder="Seria dokumentu" class="credential" maxlength="20"/>
				                </div>
				                <div class="clear"></div-->
				            </div>
			                
			                <div class="row credentials" >
				                <div class="right column">
				                    <input id="documentNumber" type="text" placeholder="Series and number of your identity document" class="credential" maxlength="30" value="" name="documentNumber"/>
				                </div>
				                <div class="clear"></div>
				            </div>
		                	
	                	</div>
		                
		                <div class="clear"></div>
			         </div>
            
		            <div class="row credentials">
		                <div class="left column">
			                <!-- label wicket:id="emailLabel" for="email" class="label">Adres email</label><br />-->
			                <input id="email" type="text" placeholder="e-mail address" class="credential" maxlength="60" value="" name="email"/>
			            </div>
			            <div class="right column">
			                <!-- label wicket:id="emailVerificationLabel" for="emailVerification" class="label">Adres email</label><br />-->
		                    <input id="emailVerification" type="text" placeholder="repeat e-mail address" class="credential" maxlength="60" value="" name="emailVerification"/>
		                </div>
		                <div class="clear"></div>
		            </div>
		
		            <div class="row credentials">
		                <div class="left column">
		                	<div class="g-recaptcha" data-sitekey="6LdkIecUAAAAAI_K_6yxPsrqN5NT_aSmwAnlzfEi"></div>
		                </div>
		                <div class="clear">
		                </div>	                
		            </div>
	 
			         <div class="row klauzulaInformacyjna">In view of the requirements of the Resolution of the European Parliament and of the Council (EU) 2016/679 of 27 April 2016 on the protection of individuals with regard to the processing of personal data, the free movement of such data and the repeal of Directive 95/46/EC (hereinafter: GDPR), we inform you about our processing of your personal data. The purposes and methods of processing the personal data that you are now providing by setting up an account in the students&#039; service system (hereinafter: JSOS) are determined by the Administrator, i.e. Wrocław University of Science and Technology with its registered office at Wybrzeże Wyspiańskiego 27 in Wrocław, Poland. You can contact the Administrator by going to pwr.edu.pl/kontakt and completing the form. The Administrator has appointed a Data Protection Officer whom you can contact by email about matters related to the protection of personal data: IOD@pwr.edu.pl;The personal data that you share with Wrocław University of Science and Technology when setting up an account in the JSOS system are needed to improve our communication with you and facilitate the steps taken in connection with your interest in our activity and educational offer. Currently, JSOS is an essential tool of contact with the University for our students, candidates recruited for studies or preparatory courses, and applicants for admission to the Academic High School at the Wrocław University of Science and Technology (Polish: Liceum Akademickie PWr).To open your account, we need your forename, surname, email address and PESEL number. We do not share these data with anyone. We will process the data on the basis of your consent and for as long as you consent us to. You will be able to withdraw your consent and if there are no special circumstances, we will erase all the information that you may provide to us. Remember, however, that in such an event we will not be able to reproduce or restore your data. You may withdraw your consent by sending a relevant statement to the following email address: pomoc+jsos@pwr.edu.pl. Before we erase any data on your request, however, we will want to make sure that you are authorised to make such a request; therefore, it would be good if you gave us your telephone number and thus allow for your verification. If you sign up for recruitment with your JSOS account and you are admitted to study at the University or to attend a course, we will ask you to complete your data, and we will indicate the legal basis that authorises us to do so. We will also try to describe what will happen to your data. Part of your data will be used in the documents of the University and it will not be erased, even if you request that we do so. Moreover, if you conclude an agreement with the University, we will need your personal data for the purposes of performance of the agreement and settlement. Such documents are subject to, for example, archiving subject to the applicable laws. You have the right to be informed about our processing of your data, and you further have the right to: request access to your personal data, and request correction or rectification of your personal data, erase your data (where you withdraw your consent and there is no other legal basis for the processing), restrict the processing of your personal data if it turns out that we do not need the data, that you have objected to the processing of the data, that the data are incorrect, or that we possess the data unlawfully (however, you are not entitled to restrict the processing required for the defence of legal claims, for the protection of the rights of another person, or for reasons of important public interest), transfer the data in machine readable format, using a common transfer file - as long as we ourselves process the data in an electronic form, and if technically possible,make an objection due to your special situation if we process the data only on the basis of our legitimate data processing interest, and if we use the data for the purposes of direct marketing, you will not even have to make known any special situation.You also have the right to make a complaint to the President of the Office for Personal Data Protection if you believe that our processing of your personal data violates the applicable laws (GDPR).</div>
			        
			        
			        <div class="row userResponsibilityAgreement">
		                <input id="userResponsibilityAgreement" type="checkbox" name="userResponsibilityAgreement"/>
		                <label for="userResponsibilityAgreement">Pursuant to Article 13 of the Resolution of the European Parliament and of the Council (EU) 2016/679 of 27 April 2016 on the protection of individuals with regard to the processing of personal data, the free movement of such data and the repeal of Directive 95/46/EC (General Data Protection Regulation) (Official Journal of the European Union L.2016.119.1. as amended), hereinafter: &#039;GDPR&#039;, I declare that, by providing my personal data when setting up an account in the students&#039; service system of Wrocław University of Science and Technology, I consent to the processing of my personal data and confirm that I have read and accept the above information on the processing of my data.
</label>
			        </div>

			        <div class="row">
		                <div class="left column">
		                    <a href="error?error_redirect_url=http://edukacja.pwr.wroc.pl/EdukacjaWeb?oauth_consumer_key%3DC483406578E35464DYUVCLZPVHRCYXPB9Y3GNVXRONDQ7LOMQ2PVGPFZAIKDYQAJ6IKT03V1M7LK7OCLKH8FM5BKGOUMM7AU5YJ7PKOCABFNDSLVZSSLVL3N6FFMB6WR%26oauth_token%3DR3168907259IMXC2YYCAQP47EFEUYNDLYEC1LBRVR5T02J5KZTZJ0YIYH2U6BFQ5GLJ893XQ46AT99SE8EDYMVJFG68XRH08RD8CM3A4ZAC98ADPH85XB9KXSR50KYYWJJ5WD2I7OQ8V6X5YEDV3RL5K5ED7290ITI5MDWX6YDTI7PV7504BJ4GPXJ3FCJQI9DHKT34DQOMYA1RAFHJLEH7Q192PFOO8RA20TZKWPQ9U68ZC0M1Q0Y8BNJ99RSMIZOZ41C648TGKP732W3FGMXJEUCAKS7EOF9Y7K6H8FHAP6CDJNPPEP6WT19OTJLSN2ES9EKBBKQ6S9XYH2ZYHDBHHIN14S9WIV2ZKXPV7GV6Z3VB49NBWWA5K1TE6U7TGT5D6NTPJV5GH6SLRAC1OK13XWERRXPNA1K5QO0N4SRE23QCB5FVF9XDPJ4YKJDTWPM8VT9V23FRNSF81TM76M10LP4A8DH0IEMYWZ8E9UM21CMQDR5Q5ETHFRJ36QWLI1PKRONAO8A8ZNRYGA1DRAHX5512P4ZRVCNT19110FY42KFV1KGX1DIN6RNHSN1KKX10XSZGQ0ITVXS7PI0RIIE23AAUX2LLD050DFBSLZRWABUW9N8B5GMO7CUVVL130NU8C4ZBHSNTU9YCXJ53J79KCZV81CWMML5NFU7RGW4ZPK15VZYETAODNPHDHVX4ETG9454EF929SAP8ZTNUNKZABN1XQ4WVQL9UQ5JB90OMKDLMI484GWEPHI7V9096VC3JF9J8UBG8YLWTS9161BK74GP06TH4DR50N5UCGODEIBJ9S81ACUDZTTJM21D73M9LRR68YELJM4GWPRBINV37KPMP78KJBMZ92QIRNNUYZUVJKV4PWHFOBWAYZRSA0LSOVYNDE5HMPZQ5KRF3PZ7MIA71HA1O8MNUSJWZ0MCLG5TVNQ2ORZXJVZQC8P2NS4GHJN4KERP551I609P8AY74MD719ZMSRT3ZTYG2HSUW0FPW9FLJO9REINJSMRD5K&amp;error_redirect_url=http:/edukacja.pwr.wroc.pl/EdukacjaWeb?oauth_consumer_key%3DC483406578E35464DYUVCLZPVHRCYXPB9Y3GNVXRONDQ7LOMQ2PVGPFZAIKDYQAJ6IKT03V1M7LK7OCLKH8FM5BKGOUMM7AU5YJ7PKOCABFNDSLVZSSLVL3N6FFMB6WR%26oauth_token%3DR3168907259IMXC2YYCAQP47EFEUYNDLYEC1LBRVR5T02J5KZTZJ0YIYH2U6BFQ5GLJ893XQ46AT99SE8EDYMVJFG68XRH08RD8CM3A4ZAC98ADPH85XB9KXSR50KYYWJJ5WD2I7OQ8V6X5YEDV3RL5K5ED7290ITI5MDWX6YDTI7PV7504BJ4GPXJ3FCJQI9DHKT34DQOMYA1RAFHJLEH7Q192PFOO8RA20TZKWPQ9U68ZC0M1Q0Y8BNJ99RSMIZOZ41C648TGKP732W3FGMXJEUCAKS7EOF9Y7K6H8FHAP6CDJNPPEP6WT19OTJLSN2ES9EKBBKQ6S9XYH2ZYHDBHHIN14S9WIV2ZKXPV7GV6Z3VB49NBWWA5K1TE6U7TGT5D6NTPJV5GH6SLRAC1OK13XWERRXPNA1K5QO0N4SRE23QCB5FVF9XDPJ4YKJDTWPM8VT9V23FRNSF81TM76M10LP4A8DH0IEMYWZ8E9UM21CMQDR5Q5ETHFRJ36QWLI1PKRONAO8A8ZNRYGA1DRAHX5512P4ZRVCNT19110FY42KFV1KGX1DIN6RNHSN1KKX10XSZGQ0ITVXS7PI0RIIE23AAUX2LLD050DFBSLZRWABUW9N8B5GMO7CUVVL130NU8C4ZBHSNTU9YCXJ53J79KCZV81CWMML5NFU7RGW4ZPK15VZYETAODNPHDHVX4ETG9454EF929SAP8ZTNUNKZABN1XQ4WVQL9UQ5JB90OMKDLMI484GWEPHI7V9096VC3JF9J8UBG8YLWTS9161BK74GP06TH4DR50N5UCGODEIBJ9S81ACUDZTTJM21D73M9LRR68YELJM4GWPRBINV37KPMP78KJBMZ92QIRNNUYZUVJKV4PWHFOBWAYZRSA0LSOVYNDE5HMPZQ5KRF3PZ7MIA71HA1O8MNUSJWZ0MCLG5TVNQ2ORZXJVZQC8P2NS4GHJN4KERP551I609P8AY74MD719ZMSRT3ZTYG2HSUW0FPW9FLJO9REINJSMRD5K">
		                    	<span>I do not agree to process my personal data </span>
		                    </a>									               		
		                </div>
		                <div class="right column">
		                    <input type="submit" value="Create an account " class="button action-button" name="submitButton" id="id4"/>
		                </div>
		                
		                <div class="clear"></div>
		            </div>
           		</div>
           </div>
	    </form>
	    
	    </div>  
	    
    
             
    
    <div class="footer">
       <div class="content">
           <div class="column left">
               <span>JSOS OAuth Server v1.00</span>
           </div>
           
           <div class="column right">
               <span class="copy">copyright &copy; Sygnity S.A.</span>
           </div>
       </div>
     
    </div>
</body>
</html>