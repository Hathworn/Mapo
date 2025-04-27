#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void batcherBitonicMergesort64(float * d_out, const float * d_in)
{
    // you are guaranteed this is called with <<<1, 64, 64*4>>>
    extern __shared__ float sdata[];
    int tid  = threadIdx.x;
    sdata[tid] = d_in[tid];
    __syncthreads();

    // Assuming input is 64 elements
    for (int stage = 0; stage <= 5; stage++)
    {
        int int_stage = 1 << stage;
        for (int substage = stage; substage >= 0; substage--)
        {
            int stride = 1 << substage;  // Calculate stride
            int pair = tid ^ stride;

            // Ensure valid pair and compare & swap
            if (pair > tid)
            {
                if ((tid & int_stage) == 0)
                {
                    if (sdata[tid] > sdata[pair])
                    {
                        float temp = sdata[tid];
                        sdata[tid] = sdata[pair];
                        sdata[pair] = temp;
                    }
                }
                else
                {
                    if (sdata[tid] < sdata[pair])
                    {
                        float temp = sdata[tid];
                        sdata[tid] = sdata[pair];
                        sdata[pair] = temp;
                    }
                }
            }
            __syncthreads();  // Synchronize threads
        }
    }

    d_out[tid] = sdata[tid];
}