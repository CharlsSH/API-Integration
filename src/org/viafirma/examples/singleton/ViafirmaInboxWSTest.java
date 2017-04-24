package org.viafirma.examples.singleton;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.Map;

import javax.xml.namespace.QName;
import javax.xml.ws.BindingProvider;
import javax.xml.ws.Service;

import com.viafirma.tray.ws.server.ServiceWS;

public class ViafirmaInboxWSTest {
	private static ViafirmaInboxWSTest singleton;
	private String url;
	private String user;
	private String key;
	
	private ViafirmaInboxWSTest(){}
	
	public static void init(String url){
		singleton = new ViafirmaInboxWSTest();
		singleton.url = url;
		singleton.user = null;
		singleton.key = null;
	}
	
	public static void init(String url, String system, String key){
		singleton = new ViafirmaInboxWSTest();
		singleton.url = url;
		singleton.user = system;
		singleton.key = key;
	}
	
	public static ViafirmaInboxWSTest getInstance() throws Exception{
		if(singleton == null){
			throw new Exception("Call first init method");
		}
		return singleton;
	}
	
	public ServiceWS getService() throws MalformedURLException{
		QName qNameService = new QName("http://tray.viavansi.com", "ServiceWS");
		URL wsdl = new URL(url + "?wsdl");
		Service service = Service.create(wsdl, qNameService);
		ServiceWS serviceWS = service.getPort(ServiceWS.class);
		if(user != null && !user.equals("") && key != null && !key.equals("")){
			Map<String, Object> map=((BindingProvider)serviceWS).getRequestContext();
			map.put(BindingProvider.USERNAME_PROPERTY, user);
			map.put(BindingProvider.PASSWORD_PROPERTY, key);
			map.put(BindingProvider.ENDPOINT_ADDRESS_PROPERTY, url);
		}
		
		return serviceWS;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
	
}
