#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void batcherBitonicMergesort64(float *d_out, const float *d_in)
{
    // __shared__ memory for thread collaboration
    extern __shared__ float sdata[];
    int tid = threadIdx.x;
    
    // Load input data into shared memory
    sdata[tid] = d_in[tid];
    __syncthreads();

    // Perform bitonic sort
    for (int stage = 0; stage <= 5; stage++)
    {
        for (int substage = stage; substage >= 0; substage--)
        {
            int partner = tid ^ (1 << substage); // Calculate partner index in bitonic way
            // Ensure partner is within bounds
            if (partner < 64) {
                if (tid < partner) {
                    if (sdata[tid] > sdata[partner]) { 
                        // Swap elements to sort
                        float temp = sdata[tid];
                        sdata[tid] = sdata[partner];
                        sdata[partner] = temp;
                    }
                } else {
                    if (sdata[tid] < sdata[partner]) {
                        // Swap elements to sort
                        float temp = sdata[tid];
                        sdata[tid] = sdata[partner];
                        sdata[partner] = temp;
                    }
                }
            }
            __syncthreads(); // Synchronize before next step
        }
    }

    // Store sorted data back to global memory
    d_out[tid] = sdata[tid];
}