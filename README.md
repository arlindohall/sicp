Structure and Interpretation of Computer Programs
=================================================

This project consists of the worked example questions in the MIT
introductory programming text
[SICP](https://mitpress.mit.edu/sicp/full-text/book/book.html), which I
am using to learn Scheme.

I'm not including full answers to the question that are purely
text-based, for example the questions that ask you to expand a program
fully as lines of text or as a tree. These I will give a brief answer
to, showing the beginning of the solution, but I won't work out
completely, and so if there is a question along the lines of "how many
steps are in this execution" then I'll just move on, since my focus is
on getting the code into the notebook.

Setup
-----

I was having issues using python 3.5 to run this project, and the error
I was getting looked like the following:

``` {.bash}
jupyter nbconvert --to notebook --execute Chapter1.ipynb
[NbConvertApp] Converting notebook Chapter1.ipynb to notebook
[NbConvertApp] ERROR | Failed to run command:
['/usr/local/opt/python3/bin/python3.6', '-m', 'calysto_scheme', '-f', '/var/folders/dx/3lddj0qs7pb92yqd84ck_7wsqmfdnp/T/tmpm0tgeim3.json']
    PATH='/usr/local/bin...'
    with kwargs:
{'stdin': -1, 'stdout': None, 'stderr': None, 'cwd': None, 'start_new_session': True}

Traceback (most recent call last):
  File "/usr/local/bin/jupyter-nbconvert", line 11, in <module>
    sys.exit(main())
  File "/usr/local/lib/python3.7/site-packages/jupyter_core/application.py", line 266, in launch_instance
    return super(JupyterApp, cls).launch_instance(argv=argv, **kwargs)
  File "/usr/local/lib/python3.7/site-packages/traitlets/config/application.py", line 658, in launch_instance
    app.start()
  File "/usr/local/lib/python3.7/site-packages/nbconvert/nbconvertapp.py", line 337, in start
    self.convert_notebooks()
  File "/usr/local/lib/python3.7/site-packages/nbconvert/nbconvertapp.py", line 507, in convert_notebooks
    self.convert_single_notebook(notebook_filename)
  File "/usr/local/lib/python3.7/site-packages/nbconvert/nbconvertapp.py", line 478, in convert_single_notebook
    output, resources = self.export_single_notebook(notebook_filename, resources, input_buffer=input_buffer)
  File "/usr/local/lib/python3.7/site-packages/nbconvert/nbconvertapp.py", line 407, in export_single_notebook
    output, resources = self.exporter.from_filename(notebook_filename, resources=resources)
  File "/usr/local/lib/python3.7/site-packages/nbconvert/exporters/exporter.py", line 178, in from_filename
    return self.from_file(f, resources=resources, **kw)
  File "/usr/local/lib/python3.7/site-packages/nbconvert/exporters/exporter.py", line 196, in from_file
    return self.from_notebook_node(nbformat.read(file_stream, as_version=4), resources=resources, **kw)
  File "/usr/local/lib/python3.7/site-packages/nbconvert/exporters/notebook.py", line 32, in from_notebook_node
    nb_copy, resources = super(NotebookExporter, self).from_notebook_node(nb, resources, **kw)
  File "/usr/local/lib/python3.7/site-packages/nbconvert/exporters/exporter.py", line 138, in from_notebook_node
    nb_copy, resources = self._preprocess(nb_copy, resources)
  File "/usr/local/lib/python3.7/site-packages/nbconvert/exporters/exporter.py", line 315, in _preprocess
    nbc, resc = preprocessor(nbc, resc)
  File "/usr/local/lib/python3.7/site-packages/nbconvert/preprocessors/base.py", line 47, in __call__
    return self.preprocess(nb, resources)
  File "/usr/local/lib/python3.7/site-packages/nbconvert/preprocessors/execute.py", line 359, in preprocess
    with self.setup_preprocessor(nb, resources, km=km):
  File "/usr/local/Cellar/python/3.7.0/Frameworks/Python.framework/Versions/3.7/lib/python3.7/contextlib.py", line 112, in __enter__
    return next(self.gen)
  File "/usr/local/lib/python3.7/site-packages/nbconvert/preprocessors/execute.py", line 304, in setup_preprocessor
    self.km, self.kc = self.start_new_kernel(cwd=path)
  File "/usr/local/lib/python3.7/site-packages/nbconvert/preprocessors/execute.py", line 253, in start_new_kernel
    km.start_kernel(extra_arguments=self.extra_arguments, **kwargs)
  File "/usr/local/lib/python3.7/site-packages/jupyter_client/manager.py", line 259, in start_kernel
    **kw)
  File "/usr/local/lib/python3.7/site-packages/jupyter_client/manager.py", line 204, in _launch_kernel
    return launch_kernel(kernel_cmd, **kw)
  File "/usr/local/lib/python3.7/site-packages/jupyter_client/launcher.py", line 128, in launch_kernel
    proc = Popen(cmd, **kwargs)
  File "/usr/local/Cellar/python/3.7.0/Frameworks/Python.framework/Versions/3.7/lib/python3.7/subprocess.py", line 756, in __init__
    restore_signals, start_new_session)
  File "/usr/local/Cellar/python/3.7.0/Frameworks/Python.framework/Versions/3.7/lib/python3.7/subprocess.py", line 1499, in _execute_child
    raise child_exception_type(errno_num, err_msg, err_filename)
FileNotFoundError: [Errno 2] No such file or directory: '/usr/local/opt/python3/bin/python3.6': '/usr/local/opt/python3/bin/python3.6'
```

I ran the following commands which fixed it, although I'm not sure this
is really a long term solution that I want. It will work as long as I've
got `pyenv` installed.

``` {.bash}
pyenv install 3.6.0
pyenv local 3.6.0
ln -s /Users/millerah/.pyenv/shims/python3.6 /usr/local/opt/python3/bin/python3.6
```

Corrections
-----------

Please feel free to make a pull request or issue for any problems you
see in my code. The goal is to have a working jupyter notebook with the
whole book worked out correctly. Even though this is a problem solving
exercise for me, I'm glad to have any feedback to reach the main goal.
