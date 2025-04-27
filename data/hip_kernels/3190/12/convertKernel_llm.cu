#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void convertKernel(const short* __restrict__ idata, float* __restrict__ odata, int size)
{
    int tidx = blockIdx.x * blockDim.x + threadIdx.x; // Optimize index calculation order
    if(tidx < size) 
        odata[tidx] = __half2float(idata[tidx]); // Use half-precision conversion when applicable
}