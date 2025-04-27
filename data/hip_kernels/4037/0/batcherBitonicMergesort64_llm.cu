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

    for (int stage = 0; stage <= 5; stage++)
    {
        // Set mask to identify elements within this stage
        int mask = (1 << (stage + 1)) - 1;

        for (int substage = stage; substage >= 0; substage--)
        {
            // Calculate partner index
            int partner = tid ^ (1 << substage);

            // Ensure partner is within bounds and works in synchronized threads
            if (partner < 64)
            {
                // Compare and swap
                if ((tid & mask) == 0)
                {
                    if (sdata[tid] > sdata[partner])
                    {
                        // Swap if out of order
                        float temp = sdata[tid];
                        sdata[tid] = sdata[partner];
                        sdata[partner] = temp;
                    }
                }
                else
                {
                    if (sdata[tid] < sdata[partner])
                    {
                        // Swap if out of order
                        float temp = sdata[tid];
                        sdata[tid] = sdata[partner];
                        sdata[partner] = temp;
                    }
                }
            }
            __syncthreads(); // Ensure all swaps complete before next substage
        }
    }
    d_out[tid] = sdata[tid]; // Output the sorted data
}