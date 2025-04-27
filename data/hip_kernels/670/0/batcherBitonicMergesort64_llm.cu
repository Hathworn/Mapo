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

    // Optimize the nested loop structure for better performance
    for (int stage = 1; stage <= 6; ++stage) // Iterate over log2(64) stages
    {
        int stride = 1 << stage; // Calculate the stride for current stage
        for (int substage = stage; substage > 0; --substage)
        {
            int substride = 1 << substage; // Calculate the substride
            int idx = 2 * tid - (tid & (substride - 1));

            // Compare and swap elements to create bitonic sequence
            if (idx + substride < 64) {
                float a = sdata[idx];
                float b = sdata[idx + substride];
                bool dir = ((idx & stride) == 0);

                if ((a > b) == dir) { // Directional swap for sorting
                    sdata[idx] = b;
                    sdata[idx + substride] = a;
                }
            }
            __syncthreads(); // Synchronize threads after each substage
        }
    }

    d_out[tid] = sdata[tid];
}