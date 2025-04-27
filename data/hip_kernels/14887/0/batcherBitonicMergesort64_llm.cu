#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void batcherBitonicMergesort64(float *d_out, const float *d_in)
{
    // Shared memory allocation
    extern __shared__ float sdata[];
    int tid = threadIdx.x;
    sdata[tid] = d_in[tid];
    __syncthreads();

    // Bitonic sort algorithm stages
    for (int stage = 0; stage <= 5; stage++)
    {
        int k = 1 << stage; // Calculate power of two

        for (int substage = stage; substage >= 0; substage--)
        {
            int j = 1 << substage; // Calculate current substage offset
            int xorIdx = tid ^ j;  // Calculate paired index using XOR

            if (xorIdx > tid)
            {
                if ((tid & k) == 0)
                {
                    // Compare and swap in ascending order
                    if (sdata[tid] > sdata[xorIdx])
                    {
                        float temp = sdata[tid];
                        sdata[tid] = sdata[xorIdx];
                        sdata[xorIdx] = temp;
                    }
                }
                else
                {
                    // Compare and swap in descending order
                    if (sdata[tid] < sdata[xorIdx])
                    {
                        float temp = sdata[tid];
                        sdata[tid] = sdata[xorIdx];
                        sdata[xorIdx] = temp;
                    }
                }
            }
            __syncthreads(); // Ensure all threads complete stage/substage
        }
    }

    // Write results to output
    d_out[tid] = sdata[tid];
}