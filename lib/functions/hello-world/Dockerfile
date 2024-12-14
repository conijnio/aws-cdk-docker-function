FROM public.ecr.aws/lambda/python:3.12
COPY requirements.txt .
COPY hello_world ${LAMBDA_TASK_ROOT}/hello_world
RUN pip install --no-cache-dir -r requirements.txt
CMD ["hello_world.handler"]
