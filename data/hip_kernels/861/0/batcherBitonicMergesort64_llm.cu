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

    for (int stage = 0; stage <= 5; stage++)
    {
        int distance = 1 << stage;
        for (int substage = stage; substage >= 0; substage--)
        {
            int pairDistance = distance >> substage;
            int index = tid ^ pairDistance;
            
            // Ensure index is in bounds and that values should indeed be swapped
            if (index > tid)
            {
                // Swap elements based on direction
                if ((tid & distance) == 0)
                {
                    // Ascending order
                    if (sdata[tid] > sdata[index])
                    {
                        float temp = sdata[tid];
                        sdata[tid] = sdata[index];
                        sdata[index] = temp;
                    }
                }
                else
                {
                    // Descending order
                    if (sdata[tid] < sdata[index])
                    {
                        float temp = sdata[tid];
                        sdata[tid] = sdata[index];
                        sdata[index] = temp;
                    }
                }
            }
            __syncthreads();  // Synchronize at each substage
        }
    }

    d_out[tid] = sdata[tid];
}