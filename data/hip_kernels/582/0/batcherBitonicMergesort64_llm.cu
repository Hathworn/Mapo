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

    // Calculate the offset based on the stage and substage       
    for (int stage = 0; stage <= 5; stage++)
    {
        for (int substage = stage; substage >= 0; substage--)
        {
            int pairDistance = 1 << substage;  // Calculate pair distance    
            int blockDistance = 1 << stage;    // Calculate block distance  
            
            int idx =  tid ^ pairDistance;     // Determine comparison index using xor 
            float temp;

            // Ensure accessing valid indices with ordered element comparisons
            if (idx > tid)
            {
                if ((tid & blockDistance) == 0)
                {
                    if (sdata[tid] > sdata[idx])
                    {
                        temp = sdata[tid];
                        sdata[tid] = sdata[idx];
                        sdata[idx] = temp;
                    }
                }
                else
                {
                    if (sdata[tid] < sdata[idx])
                    {
                        temp = sdata[tid];
                        sdata[tid] = sdata[idx];
                        sdata[idx] = temp;
                    }
                }
            }
            __syncthreads();
        }
    }

    d_out[tid] = sdata[tid];
}