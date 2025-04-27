#include "hip/hip_runtime.h"
#include "includes.h"

extern "C"
__global__ void add(int n, float *a, float *b, float *sum)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n)
    {
        // Use register for temporary storage to minimize global memory accesses
        float ai = a[i];
        float bi = b[i];
        sum[i] = ai + bi;
    }
}