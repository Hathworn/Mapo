```c
#include "hip/hip_runtime.h"
#include "includes.h"

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
            // Calculate index for comparison
            int index1 = (tid >> (substage + 1)) << (substage + 1) | (tid & ((1 << substage)-1));
            int index2 = index1 | (1 << substage);

            // Conditionally swap elements
            if (tid < index2)
            {
                bool direction = ((tid >> stage) & 1) == 0;
                if ((sdata[index1] > sdata[index2]) == direction)
                {
                    float temp = sdata[index1];
                    sdata[index1] = sdata[index2];
                    sdata[index2] = temp;
                }
            }
            __syncthreads(); // Ensure all swaps are completed
        }
    }

    d_out[tid] = sdata[tid];
}