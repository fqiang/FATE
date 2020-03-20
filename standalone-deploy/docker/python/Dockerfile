#
#  Copyright 2019 The FATE Authors. All Rights Reserved.
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
#
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

FROM python:3.6

WORKDIR /fate

#COPY . /fate
ADD fate.tar /fate
ADD docker-entrypoint.sh /fate
ADD requirements.txt /fate
ADD source_debian_buster.list /etc/apt/sources.list

RUN rm /bin/sh && ln -sf /bin/bash /bin/sh

#RUN tar -xf fate.tar

#RUN rm fate.tar

COPY docker-entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENV http_proxy  http://122.40.130.79:8080
ENV https_proxy http://122.40.130.79:8080
RUN export no_proxy=`cat /etc/hosts  | tail -1 | awk '{print $1}'`
RUN apt-get update && apt-get install libgmp3-dev -y && apt-get install -y libmpfr-dev libmpfr-doc libmpfr6 && apt-get install libmpc-dev -y && apt-get install vim -y

#RUN pip install -r requirements.txt -f ./pip-dependedocker ncies --no-index
RUN pip install --retries 100 --timeout 100 -i https://pypi.tuna.tsinghua.edu.cn/simple -r requirements.txt
#RUN cat requirements.txt | while read PACKAGE; do pip install -i https://pypi.tuna.tsinghua.edu.cn/simple "$PACKAGE"; done

ENV PYTHONPATH /fate

ENTRYPOINT ["docker-entrypoint.sh"]
