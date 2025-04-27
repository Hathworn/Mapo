#include "hip/hip_runtime.h"
#include "includes.h"

// http://en.wikipedia.org/wiki/Bitonic_sort

__global__ void batcherBitonicMergesort64(float * d_out, const float * d_in)
{
    // you are guaranteed this is called with <<<1, 64, 64*4>>>
    extern __shared__ float sdata[];
    int tid  = threadIdx.x;
    sdata[tid] = d_in[tid];
    __syncthreads();

    // Iterate over sorting stages
    for (int k = 2; k <= 64; k <<= 1) 
    {
        for (int j = k >> 1; j > 0; j >>= 1) 
        {
            // Calculate the index for comparison based on thread ID
            int ixj = tid ^ j;
            // Perform comparison and conditional swap
            if (ixj > tid) 
            {
                if ((tid & k) == 0) 
                {
                    if (sdata[tid] > sdata[ixj]) 
                    {
                        float temp = sdata[tid];
                        sdata[tid] = sdata[ixj];
                        sdata[ixj] = temp;
                    }
                } 
                else 
                {
                    if (sdata[tid] < sdata[ixj]) 
                    {
                        float temp = sdata[tid];
                        sdata[tid] = sdata[ixj];
                        sdata[ixj] = temp;
                    }
                }
            }
            __syncthreads(); // Ensure all threads complete the swap before proceeding
        }
    }

    // Write result from shared memory to output
    d_out[tid] = sdata[tid];
}