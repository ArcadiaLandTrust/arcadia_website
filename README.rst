This is a manual for maintaining and deploying the website of Arcadia, a community land trust based in Ashland City, TN.

The site was initially generated using cookiecutter-django, and uses node/gulp for task-running, docker-compose/machine for deployment, caddy for the server, django 1.11, sentry, mailhog, bootstrap, and sass, among other things.
.. image:: https://img.shields.io/badge/built%20with-Cookiecutter%20Django-ff69b4.svg
     :target: https://github.com/pydanny/cookiecutter-django/
     :alt: Built with Cookiecutter Django


:License: MIT


Settings
--------


Basic Commands
--------------


Setting Up Your Users
^^^^^^^^^^^^^^^^^^^^^

* To create an **superuser account**, use this command::

    $ python manage.py createsuperuser

For convenience, you can keep your normal user logged in on Chrome and your superuser logged in on Firefox (or similar), so that you can see how the site behaves for both kinds of users.

Test coverage
^^^^^^^^^^^^^

To run the tests, check your test coverage, and generate an HTML coverage report::

    $ coverage run manage.py test
    $ coverage html
    $ open htmlcov/index.html

Running tests with py.test
~~~~~~~~~~~~~~~~~~~~~~~~~~

::

  $ py.test

Email Server
^^^^^^^^^^^^

In development, it is often nice to be able to see emails that are being sent from your application. For that reason local SMTP server `MailHog`_ with a web interface is available as docker container.

Container mailhog will start automatically when you will run all docker containers.

With MailHog running, to view messages that are sent by your application, open your browser and go to ``http://127.0.0.1:8025``

.. _mailhog: https://github.com/mailhog/MailHog



Sentry
^^^^^^


Deployment
----------

How to deploy the application from your local computer::

    $ eval $(docker-machine env prod)
    $ docker-compose -f production.yml build
    $ docker-compose -f production.yml up
TODO: add supervisor and other necessary prod commands


Docker
^^^^^^

Custom Bootstrap Compilation
^^^^^^

The generated CSS is set up with automatic Bootstrap recompilation with variables of your choice.
Bootstrap v4 is installed using npm and customised by tweaking your variables in ``static/sass/custom_bootstrap_vars``.

You can find a list of available variables `in the bootstrap source`_, or get explanations on them in the `Bootstrap docs`_.

Bootstrap's javascript as well as its dependencies is concatenated into a single file: ``static/js/vendors.js``.

.. _in the bootstrap source: https://github.com/twbs/bootstrap/blob/v4-dev/scss/_variables.scss
.. _Bootstrap docs: https://getbootstrap.com/docs/4.0/getting-started/theming/


venv/ folder
^^^^^^
