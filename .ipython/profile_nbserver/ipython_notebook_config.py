# use jupytext instead of the following

# If you want to auto-save .html and .py versions of your notebook:
# https://jupytext.readthedocs.io/en/latest/config.html

# modified from: https://github.com/ipython/ipython/issues/8009
# Adding post-save hook to convert ipynb files to py and html.
# See https://www.svds.com/jupyter-notebook-best-practices-for-data-science

# import os
# from subprocess import check_call
#
#
#  def post_save(model, os_path, contents_manager):
#      """post-save hook for converting notebooks to .py scripts"""
#      if model['type'] != 'notebook':
#          return # only do this for notebooks
#      d, fname = os.path.split(os_path)
#      check_call(['ipython', 'nbconvert', '--to', 'script', fname], cwd=d)
#      check_call(['ipython', 'nbconvert', '--to', 'html', fname], cwd=d)
#
# c.FileContentsManager.post_save_hook = post_save
