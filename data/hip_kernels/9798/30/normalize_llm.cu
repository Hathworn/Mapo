#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize(double *g_idata, double *g_odata, unsigned int n, int maxIndx)
{
    // Load the maximum value from global to shared memory to minimize global memory access
    __shared__ double s_max;
    if (threadIdx.x == 0)
    {
        s_max = g_idata[maxIndx];
    }
    __syncthreads();

    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Check bounds before accessing global memory
    if (i < n)
    {
        g_odata[i] = exp(g_idata[i] - s_max);
    }
}