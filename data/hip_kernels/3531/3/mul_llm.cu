#include "hip/hip_runtime.h"
#include "includes.h"

//!!nvcc -c  test.cu --compiler-options -fPIC
//!g++ -o program -L/usr/local/cuda/lib64 main.cpp test.o -lcuda -lcudart

__global__ void mul(float *a, float *b, float *c)
{
    // Use thread ID as an index for parallel operations
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    // Perform multiplication using indexed access
    c[idx] = a[idx] * b[idx];
}