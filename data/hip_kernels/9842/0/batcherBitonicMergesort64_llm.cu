#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void batcherBitonicMergesort64(float * d_out, const float * d_in)
{
    // you are guaranteed this is called with <<<1, 64, 64*4>>>
    extern __shared__ float sdata[];
    int tid = threadIdx.x;
    sdata[tid] = d_in[tid];
    __syncthreads();

    for (int stage = 0; stage <= 5; stage++)
    {
        for (int substage = stage; substage >= 0; substage--)
        {
            int pair_distance = 1 << substage;
            int compare_distance = 1 << (stage + 1);

            // Calculate the index of pairs and the direction of comparison
            int pair_l = (tid / pair_distance) * pair_distance * 2 + tid % pair_distance;
            int pair_r = pair_l + pair_distance;
            int direction = ((tid & compare_distance) == 0);

            if ((pair_r < 64) && (direction == (sdata[pair_l] > sdata[pair_r])))
            {
                // Swap elements if they are in the wrong order
                float temp = sdata[pair_l];
                sdata[pair_l] = sdata[pair_r];
                sdata[pair_r] = temp;
            }
            __syncthreads(); // Synchronize between stages
        }
    }

    d_out[tid] = sdata[tid];
}