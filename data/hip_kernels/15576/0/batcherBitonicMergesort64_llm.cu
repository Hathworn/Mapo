#include "hip/hip_runtime.h"
#include "includes.h"

// http://en.wikipedia.org/wiki/Bitonic_sort

__global__ void batcherBitonicMergesort64(float * d_out, const float * d_in)
{
    // you are guaranteed this is called with <<<1, 64, 64*4>>>
    extern __shared__ float sdata[];
    int tid = threadIdx.x;
    sdata[tid] = d_in[tid];
    __syncthreads();

    // Optimize sorting logic
    for (int stage = 0; stage <= 5; stage++)
    {
        int stageStep = 1 << stage;
        for (int substage = stage; substage >= 0; substage--)
        {
            int step = 1 << substage;
            int idx = 2 * tid - (tid & (step - 1));
            
            // Conditional swapping
            if ((sdata[idx] > sdata[idx + step]) == (tid & stageStep))
            {
                float temp = sdata[idx];
                sdata[idx] = sdata[idx + step];
                sdata[idx + step] = temp;
            }
        }
        __syncthreads();
    }

    d_out[tid] = sdata[tid];
}