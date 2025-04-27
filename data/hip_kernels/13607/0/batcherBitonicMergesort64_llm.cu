#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void batcherBitonicMergesort64(float * d_out, const float * d_in)
{
    // you are guaranteed this is called with <<<1, 64, 64*4>>>
    extern __shared__ float sdata[];
    int tid  = threadIdx.x;
    // Load input into shared memory
    sdata[tid] = d_in[tid];
    __syncthreads();

    // Perform bitonic sort
    for (int stage = 0; stage <= 5; stage++)
    {
        for (int substage = stage; substage >= 0; substage--)
        {
            int pairDistance = 1 << substage;                // Calculate distance of pair
            int index = (2 * pairDistance * (tid / pairDistance)) + (tid % pairDistance); // Compute index of the element to compare with
            if (index < tid)
            {
                if ((tid & pairDistance) == 0)               // Compare and swap for ascending order
                {
                    if (sdata[tid] > sdata[tid + pairDistance])
                    {
                        float temp = sdata[tid];
                        sdata[tid] = sdata[tid + pairDistance];
                        sdata[tid + pairDistance] = temp;
                    }
                }
                else                                         // Compare and swap for descending order
                {
                    if (sdata[tid] < sdata[tid + pairDistance])
                    {
                        float temp = sdata[tid];
                        sdata[tid] = sdata[tid + pairDistance];
                        sdata[tid + pairDistance] = temp;
                    }
                }
            }
            __syncthreads();
        }
    }
    // Copy result to output
    d_out[tid] = sdata[tid];
}