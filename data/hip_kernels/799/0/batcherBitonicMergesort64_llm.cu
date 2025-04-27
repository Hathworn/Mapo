#include "hip/hip_runtime.h"
#include "includes.h"

// http://en.wikipedia.org/wiki/Bitonic_sort

__global__ void batcherBitonicMergesort64(float *d_out, const float *d_in)
{
    // you are guaranteed this is called with <<<1, 64, 64*4>>>
    extern __shared__ float sdata[];
    int tid = threadIdx.x;
    sdata[tid] = d_in[tid];
    __syncthreads();

    for (int stage = 0; stage <= 5; ++stage)
    {
        int increment = 1 << stage;
        for (int substage = stage; substage >= 0; --substage)
        {
            // Efficient sorting within each stage and substage
            int subincrement = 1 << substage;
            int pairIdx = tid ^ subincrement;
            if (pairIdx > tid)
            {
                if ((tid & increment) == 0)
                {
                    if (sdata[tid] > sdata[pairIdx])
                    {
                        float temp = sdata[tid];
                        sdata[tid] = sdata[pairIdx];
                        sdata[pairIdx] = temp;
                    }
                }
                else
                {
                    if (sdata[tid] < sdata[pairIdx])
                    {
                        float temp = sdata[tid];
                        sdata[tid] = sdata[pairIdx];
                        sdata[pairIdx] = temp;
                    }
                }
            }
            __syncthreads(); // Synchronize within stages
        }
    }

    d_out[tid] = sdata[tid];
}