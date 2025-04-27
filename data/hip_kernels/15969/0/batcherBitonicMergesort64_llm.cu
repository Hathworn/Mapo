#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void batcherBitonicMergesort64(float * d_out, const float * d_in)
{
    // you are guaranteed this is called with <<<1, 64, 64*4>>>
    extern __shared__ float sdata[];
    int tid = threadIdx.x;
    sdata[tid] = d_in[tid];
    __syncthreads();

    for (int stage = 0; stage <= 5; stage++)
    {
        // Calculate the distance for the current stage
        int distance = 1 << stage;
        for (int substage = stage; substage >= 0; substage--)
        {
            // Calculate the bitonic merge index
            int index = 1 << substage;

            // Calculate the condition for swapping
            int pair_index = tid ^ index;
            if (substage == stage || (pair_index > tid && pair_index < 64))
            {
                // Perform comparison and swapping
                if ((tid & distance) == 0)
                {
                    if (sdata[tid] > sdata[pair_index])
                    {
                        float temp = sdata[tid];
                        sdata[tid] = sdata[pair_index];
                        sdata[pair_index] = temp;
                    }
                }
                else
                {
                    if (sdata[tid] < sdata[pair_index])
                    {
                        float temp = sdata[tid];
                        sdata[tid] = sdata[pair_index];
                        sdata[pair_index] = temp;
                    }
                }
            }
            __syncthreads(); // Ensure all threads complete swap before next iteration
        }
    }

    d_out[tid] = sdata[tid];
}