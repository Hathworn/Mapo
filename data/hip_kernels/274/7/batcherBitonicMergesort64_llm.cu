#include "hip/hip_runtime.h"
#include "includes.h"
__device__ void swap(float& a, float& b)
{
    float temp = a;
    a = b;
    b = temp;
}
__global__ void batcherBitonicMergesort64(float * d_out, const float * d_in)
{
    // you are guaranteed this is called with <<<1, 64, 64*4>>>
    extern __shared__ float sdata[];
    int tid  = threadIdx.x;
    sdata[tid] = d_in[tid];
    __syncthreads();

    for (int stage = 0; stage <= 5; stage++)
    {
        int div = 1 << (stage + 1); // Precompute division factor for indexing
        for (int substage = stage; substage >= 0; substage--)
        {
            int distance = 1 << substage; // Distance to value to be compared
            int comparison = tid - distance; // Value to be compared
            // Skip values not required for comparison; optimize by calculating division once
            if (comparison >= 0 && (comparison / div) == (tid / div)) {
                bool up = (comparison / div) % 2 == 1;
                // Use ternary operations for compact comparison and swapping
                if ((up && sdata[tid] > sdata[comparison]) || (!up && sdata[tid] < sdata[comparison])) {
                    swap(sdata[tid], sdata[comparison]);
                }
            }
        }
        __syncthreads();
    }

    d_out[tid] = sdata[tid];
}