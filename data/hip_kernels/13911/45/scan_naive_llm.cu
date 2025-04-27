#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scan_naive(float *g_odata, float *g_idata, int n)
{
    // Dynamically allocated shared memory for scan kernels
    extern __shared__ float temp[];

    int thid = threadIdx.x;

    int pout = 0;
    int pin = 1;
    
    // Efficiently initialize shared memory
    temp[thid] = (thid > 0) ? g_idata[thid - 1] : 0;
    __syncthreads();

    // In-place scan using shared memory
    for (int offset = 1; offset < n; offset *= 2)
    {
        float val = temp[thid];
        if (thid >= offset)
            val += temp[thid - offset];
        __syncthreads();
        temp[thid] = val;
        __syncthreads();
    }

    // Write the result to global memory
    g_odata[thid] = temp[thid];
}