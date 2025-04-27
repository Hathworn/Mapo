#include "hip/hip_runtime.h"
#include "includes.h"

// http://en.wikipedia.org/wiki/Bitonic_sort

__global__ void batcherBitonicMergesort64(float *d_out, const float *d_in)
{
    // You are guaranteed this is called with <<<1, 64, 64*4>>>
    extern __shared__ float sdata[];
    int tid = threadIdx.x;
    sdata[tid] = d_in[tid];
    __syncthreads();

    // Optimize the bitonic sort stages
    for (int stage = 0; stage <= 5; stage++)
    {
        int direction = (tid >> stage) & 1;
        for (int substage = stage; substage >= 0; substage--)
        {
            int pair_tid = tid ^ (1 << substage);
            if (pair_tid > tid)
            {
                float tmp;
                if ((sdata[tid] > sdata[pair_tid]) == direction)
                {
                    tmp = sdata[tid];
                    sdata[tid] = sdata[pair_tid];
                    sdata[pair_tid] = tmp;
                }
            }
            __syncthreads();
        }
    }

    d_out[tid] = sdata[tid];
}