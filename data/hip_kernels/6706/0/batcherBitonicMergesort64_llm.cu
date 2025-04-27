#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void batcherBitonicMergesort64(float * d_out, const float * d_in)
{
    // Load input into shared memory, one element per thread
    extern __shared__ float sdata[];
    int tid = threadIdx.x;
    sdata[tid] = d_in[tid];
    __syncthreads();

    // Bitonic sorting network
    for (int stage = 0; stage <= 5; stage++)
    {
        for (int substage = stage; substage >= 0; substage--)
        {
            int pair_distance = 1 << substage;
            int block_distance = 1 << (stage + 1);

            int compare_index = 2 * pair_distance * (tid / (2 * pair_distance)) + (tid % pair_distance);
            int first_index = compare_index + pair_distance;
            int second_index = first_index + pair_distance;

            if ((tid % block_distance) < block_distance / 2)
            {
                if (sdata[first_index] > sdata[second_index])
                {
                    // Swap elements to sort in ascending order
                    float temp = sdata[first_index];
                    sdata[first_index] = sdata[second_index];
                    sdata[second_index] = temp;
                }
            }
            else
            {
                if (sdata[first_index] < sdata[second_index])
                {
                    // Swap elements to sort in descending order
                    float temp = sdata[first_index];
                    sdata[first_index] = sdata[second_index];
                    sdata[second_index] = temp;
                }
            }
            __syncthreads();
        }
    }

    // Write sorted data to global memory
    d_out[tid] = sdata[tid];
}