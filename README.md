# Descripción del proyecto. Apuntes importantes a tener en cuenta

### Configuración de entorno antes de ejecutar app en localhost


Dentro la carpeta del proyecto corro la sequencia de comandos en siguiente orden:

```sh
$ bundle install
$ rails db:migrate
```

**db/seed.rb** <- revisar y completar categorías
```sh
$ rails db:seed
```

Luego, hay que configurar secret token. Copiar y pegar en **config/secrets.yml**:

```sh
$ rails secret
```

Despues es necesario configurar APIs para redes sociales. Ver archivo **config/initializers/devise.rb**, linea 251:

```sh
config.omniauth :facebook, "KEY", "SECRET"
config.omniauth :twitter, "KEY", "SECRET"
config.omniauth :linked_in, "KEY", "SECRET"
```

Por útlimo, configrar Mailer en **config/environments/$RAILS_ENV.rb**:

```sh
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address:              'smtp.gmail.com',
    port:                 587,
    domain:               'localhost:3000',
    user_name:            'usuario@gmail.com',
    password:             'password',
    authentication:       'plain',
    enable_starttls_auto: true
  }
```



```sh
$ rails server
```


### Otras cosas a tener en cuenta:


Para cambiar tema de Bootstrap, revisar ficheros:

```sh
app/assets/stylesheets/application.css.scss
app/assets/stylesheets/project.css.scss
app/assets/javascripts/application.js
```

Para actualizar imagenes y miniaturas de Paperclip:

```sh
$ rails paperclip:refresh CLASS=Aviso
```


### Mecanismos principales de la app y arquitectura

La aplicación permite crear usuarios de 2 tipos de cuentas. Uno para publicar (anunciante) y otro para contactarse con anunciantes. Según quien corresponda se habilitan ciertas funciones. Por ejemplo, solo anunciante puede crear un aviso.

El mecanismo de roles se basa en 3 modulos:

  - Devise
  - CanCanCan
  - Rolify

Devise esta ampliado por un controlador **User::Registrations** que mantiene registro con email. Por otro lado, por un controlador **Omniauth_callbacks** cuya función es mantener callbacks para proveedores de OmniAuth


### Funcionamiento de Mailer

El Mailer esta configurado por un controlador y un pseudo-modelo. Ambos se llaman **Communicate**

Al enviar mensaje desde la pagina, se ejecuta un POST en forma remota y lo procesa controlador (respuesta JS):


```sh
def create
  @communicate = Communicate.new(communicate_params)

  respond_to do |format|
    if @communicate.save
      format.js

      CommunicateMailer.send_aviso_message(@communicate).deliver_now
    else
      format.json { render json: @communicate.errors, status: :unprocessable_entity }
    end
  end
end
```


Para configurar Mailer mirar archivo:
app/mailers/communicate_mailer.rb

```sh
class CommunicateMailer < ApplicationMailer
  default from: 'notifications@wences.com'

  def send_aviso_message(communicate)
    @sender = User.find(communicate.sender_id)
    @publisher = User.find(communicate.publisher_id)
    @aviso = Aviso.find(communicate.aviso_id)
    @message = communicate.message

    @url  = 'http://example.com/login'
    subject = "#{@sender.name} te mando un mensaje"
    mail(to: @publisher.email, subject: subject)
  end
end
```


