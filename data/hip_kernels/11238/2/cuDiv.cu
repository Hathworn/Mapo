#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"

extern "C"

extern "C"

extern "C"

__global__ void cuDiv(int n, float *a, float *b, float *result)
{
int i = blockIdx.x * blockDim.x + threadIdx.x;
if (i<n)
{
result[i] = a[i] / b[i];
}

}