# Demo project to show client integration against Viafirma Inbox API

## Disclaimer

**This is a sample app** to demonstrate how to integrate with Viafirma Inbox API. Please note that this is not a final product, just a demo. Feel free to send issues or pull requests to improve it.

## Sample data

This demo app integrates with a Viafirma Inbox instance installed in: http://testservices.viafirma.com/inbox/app/default

Please, request API integration keys in order to use it [by sending us an e-Mail](mailto:soporte@viafirma.com).

Samples will be run with the Viafirma Inbox user with ID "99331100" and password "123456" (email: inbox@viafirma.com). To sign with this user, you can use the certificate found in `src/main/resources/demo_viafirma_inbox_123456.p12` (with PIN: "123456").

## Usage

Run `mvn tomcat7:run -Dsystem=[YOUR_SYSTEM] -Dapikey=[YOUR_API_KEY]` to start the demo. Open `http://localhost:8080/viafirma-inbox-sample` to start browsing.

If you want to deploy this app inside your own Tomcat, just package the WAR using `mvn package` and use the context file under `src/main/webapp/META-INF/context.xml`, updating the parameters `system` and `apikey`.
