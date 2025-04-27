#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void batcherBitonicMergesort64(float * d_out, const float * d_in)
{
    extern __shared__ float sdata[];
    int tid = threadIdx.x;
    sdata[tid] = d_in[tid];
    __syncthreads();

    // Perform bitonic sort
    for (int stage = 0; stage <= 5; stage++)
    {
        for (int substage = stage; substage >= 0; substage--)
        {
            int pos = 1 << substage; // Calculate position offset
            int j = (tid >> substage) << (substage + 1); // Calculate pair index
            int direction = (((tid >> stage) & 2) == 0); // Determine direction

            // Compare and swap if needed based on direction
            if ((j + pos) < 64) // Ensure within bounds
            {
                if ((sdata[j] > sdata[j + pos]) == direction)
                {
                    float temp = sdata[j];
                    sdata[j] = sdata[j + pos];
                    sdata[j + pos] = temp;
                }
            }
            __syncthreads();
        }
    }

    d_out[tid] = sdata[tid]; // Store sorted data to output
}