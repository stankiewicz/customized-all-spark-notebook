FROM jupyter/all-spark-notebook
 
RUN conda install --quiet -y -p $CONDA_DIR/envs/python2 basemap
RUN conda install --quiet -y -p $CONDA_DIR/envs/python2 xgboost
RUN R -e "install.packages('readr',lib='/opt/conda/lib/R/library',repos = 'http://cran.us.r-project.org')"
RUN R -e "install.packages('dplyr',lib='/opt/conda/lib/R/library',repos = 'http://cran.us.r-project.org')"
RUN R -e "install.packages('cluster',lib='/opt/conda/lib/R/library',repos = 'http://cran.us.r-project.org')"
RUN R -e "install.packages('plot3D',lib='/opt/conda/lib/R/library',repos = 'http://cran.us.r-project.org')"

USER jovyan
# Install declarative widgets for Jupyter Notebook
RUN pip install jupyter_declarativewidgets && \
	jupyter declarativewidgets install --user --symlink && \
	jupyter nbextension enable --py declarativewidgets && \
  jupyter declarativewidgets installr --library /opt/conda/lib/R/library
