#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void global_reduce_kernel(float *d_out, float *d_in)
{
    extern __shared__ float sdata[]; // allocate shared memory
    
    int myId = threadIdx.x + blockDim.x * blockIdx.x;
    int tid  = threadIdx.x;

    sdata[tid] = d_in[myId];  // load shared mem from global mem
    __syncthreads();          // ensure all loads complete

    // do reduction in shared memory
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1)
    {
        if (tid < s)
        {
            sdata[tid] += sdata[tid + s];
        }
        __syncthreads();    // ensure all adds at one stage are done
    }

    // only thread 0 writes result for this block back to global mem
    if (tid == 0)
    {
        d_out[blockIdx.x] = sdata[0];
    }
}