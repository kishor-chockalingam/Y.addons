##########################################
#Steps for installation of the addon
##########################################

#######################################################################
#Pre-requisites:
1.	Hybris version 5.1
2.	Storefront should be up and running preferably, electronic store 
########################################################################

########################################################################
#Steps for installation:
1. Replace the acc-ant-addons.xml file inside "hybris-commerce-suite-5.1.0.3\hybris\bin\ext-addon\addonsupport\resources\addonsupport\ant" location
2. Place the qrcodeaddon, bncwebservices, bncwebserviceshmc extensions in custom folder of hybris (location:bin/custom)
3. Include the following in localextensions.xml file:
	
	<extension name="qrcodeaddon" />
	<extension name="bncwebservices" />
	<extension name="bncwebserviceshmc" />
	
4. execute ant command once after modifying local.properties 
	
5. Now perform following command to include and build qrcodeaddon and dataremovaladdon in the project.
	
	ant addoninstall -Daddonnames="qrcodeaddon" -DaddonStorefront.yacceleratorstorefront="<<storefront name e.g. bncstorefront>>"

	In case there is already a webservices and webserviceshmc extension entry in localextensions.xml, then comment those entries and enter the above.

6. Add the following entry in storefront’s spring-cms-config.xml(path->storefront\web\webroot\WEB-INF\config\spring-cms-config.xml)

	<entry key="UCOIDOnOrderConfirmationComponent" value-ref="uCOIDOnOrderConfirmationComponentRenderer"/>
	
	In the following bean entry:
	
	<alias alias="cmsComponentRendererRegistry" name="acceleratorCMSComponentRendererRegistry"/>
	 <bean id="acceleratorCMSComponentRendererRegistry" parent="defaultCMSComponentRendererRegistry">
	  <property name="renderers">
	   <map merge="true">
		<entry key="CMSLinkComponent" value-ref="cmsLinkComponentRenderer"/>
		<entry key="UCOIDOnOrderConfirmationComponent" value-ref="uCOIDOnOrderConfirmationComponentRenderer"/>
	   </map>
	  </property>
	 </bean>

7. Run ant clean all. This will build the entire project once again including your module extensions.
8.	Once the build is successful, start the hybris server using hybrisserver.bat command
9.	Once the hybris server is started, then system update is required.Update  the hybris Commerce Suite.
	The Update page opens with preconfigured settings for update. Perform the following:
	a. Deselect the checkbox stating “Create essential data”
	b. Select the checkbox next to qrcodeaddon
	c. Without changing any more settings, click the Update button. The update process starts and can take several minutes
	
10.	Once update is completed, click on continue button.
11.	Go to HMC 
	1)	Access HMC using url: http://localhost:9001/hmc/hybris
	Login: admin
	Password: nimda
	
12.	Click on Catalog -> Catalog Management Tools on left hand side navigation menu and click on “Synchronization”
13.	A pop-up window will open. Select electronicsContentCatalog Staged->Target and click on Next
14.	Click on start for starting the synchronization
######################################################################################################