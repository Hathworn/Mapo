#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"

__global__ void rsub_double(int n, double *a, double *b, double *sum)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n)
    {
        sum[i] = b[i] - a[i];
    }
    // No loop unrolling needed as each thread handles one element for efficiency
}