#include "hip/hip_runtime.h"
#include "includes.h"


//!!nvcc -c  test.cu --compiler-options -fPIC
//!g++ -o program -L/usr/local/cuda/lib64 main.cpp test.o -lcuda -lcudart








__global__ void sub(float *a,float *b,float *c)
{
*c = *a -*b;
}