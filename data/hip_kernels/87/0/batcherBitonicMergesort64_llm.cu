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
        for (int substage = stage; substage >= 0; substage--)
        {
            // Define the comparator distance
            int comparatorDistance = 1 << substage;

            // Calculate the indices to compare
            int index = tid ^ comparatorDistance;

            // Only perform comparisons within bounds and when index > tid
            if (index > tid)
            {
                // Ascend for even indexed sequences and descend for odd indexed
                if ((tid & (1 << stage)) == 0)
                {
                    // Ascending order
                    if (sdata[tid] > sdata[index])
                    {
                        // Swap if out of order
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
                        // Swap if out of order
                        float temp = sdata[tid];
                        sdata[tid] = sdata[index];
                        sdata[index] = temp;
                    }
                }
            }
            __syncthreads(); // Ensure threads are synchronized between stages
        }
    }
    
    d_out[tid] = sdata[tid];
}