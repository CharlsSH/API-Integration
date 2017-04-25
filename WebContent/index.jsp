<%@include file="includes/header.jsp" %>

<section>
    <h2>Examples</h2>

    <div class="panel panel-primary">
      <div class="panel-heading">
        <h3 class="panel-title">Use cases</h3>
      </div>
      <div class="panel-body">
        <dl>
            <dt><a href="examples/sign-request.jsp">Prepare sign request</a></dt>
            <dd>Comunicaci�n para preparar una petici�n con un solo firmante; el usuario firmante es redirigido desde la aplicaci�n origen a Viafirma Inbox, all� firma la petici�n reci�n creada, y es redirigido de vuelta a la aplicaci�n origen.</dd>
            
            <dt><a href="examples/sign-workflow-request.jsp">Prepare workflow request</a></dt>
            <dd>Esta opci�n es similar a la anterior, pero permite adem�s especificar un flujo global existente a priori en la instancia de Viafirma Inbox.</dd>
        </dl>
      </div>
    </div>
</section>

<%@include file="includes/footer.jsp" %>