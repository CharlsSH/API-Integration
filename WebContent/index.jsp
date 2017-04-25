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
            <dd>Comunicación para preparar una petición con un solo firmante; el usuario firmante es redirigido desde la aplicación origen a Viafirma Inbox, allí firma la petición recién creada, y es redirigido de vuelta a la aplicación origen.</dd>
            
            <dt><a href="examples/sign-workflow-request.jsp">Prepare workflow request</a></dt>
            <dd>Esta opción es similar a la anterior, pero permite además especificar un flujo global existente a priori en la instancia de Viafirma Inbox.</dd>
        </dl>
      </div>
    </div>
</section>

<%@include file="includes/footer.jsp" %>