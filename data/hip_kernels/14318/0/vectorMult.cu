#include "hip/hip_runtime.h"
#include "includes.h"


__global__ void vectorMult(float *a, float *b, float *c, int n)
{

int i = blockIdx.x * blockDim.x + threadIdx.x;

while (i < n)
{
c[i] = a[i] * b[i];
i+= blockDim.x * gridDim.x;
}
}