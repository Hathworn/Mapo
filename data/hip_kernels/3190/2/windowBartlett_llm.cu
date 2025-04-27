#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void windowBartlett(float* idata, int length)
{
    int tidx = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index
    if (tidx < length)
    {
        idata[tidx] = 0; // Reset data at index to 0
    }
}