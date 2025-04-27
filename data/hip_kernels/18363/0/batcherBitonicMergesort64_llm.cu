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

    // Perform bitonic sort using parallel threads
    for (int stage = 0; stage <= 5; stage++)
    {
        int seq_len = 1 << (stage + 1);
        for (int substage = stage; substage >= 0; substage--)
        {
            int partner_distance = 1 << substage;
            int pair_index = tid ^ partner_distance;
        
            if (pair_index > tid)
            {
                bool ascending = ((tid & seq_len) == 0);
                // Swap elements by comparing
                if ((sdata[tid] > sdata[pair_index]) == ascending)
                {
                    float temp = sdata[tid];
                    sdata[tid] = sdata[pair_index];
                    sdata[pair_index] = temp;
                }
            }
            __syncthreads();  // Ensure all comparisons and swaps in this stage are done
        }
    }

    d_out[tid] = sdata[tid];
}