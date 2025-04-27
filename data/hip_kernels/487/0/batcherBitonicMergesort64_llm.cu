#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void batcherBitonicMergesort64(float * d_out, const float * d_in)
{
    extern __shared__ float sdata[];
    int tid  = threadIdx.x;
    sdata[tid] = d_in[tid];
    __syncthreads();

    for (int stage = 0; stage <= 5; stage++)
    {
        for (int substage = stage; substage >= 0; substage--)
        {
            int pairDistance = 1 << substage;
            int blockSize = 1 << (stage + 1);
            int pairFilter = blockSize / 2;

            int sortedDirection = ((tid & pairFilter) == 0) ? 1 : -1;
            int compareIndex = tid ^ pairDistance;

            if (compareIndex > tid) 
            {
                float val1 = sdata[tid];
                float val2 = sdata[compareIndex];
                // Swap if needed
                if ((val1 > val2 && sortedDirection == 1) || (val1 < val2 && sortedDirection == -1)) 
                {
                    sdata[tid] = val2;
                    sdata[compareIndex] = val1;
                }
            }
            __syncthreads(); // Ensure all threads have written
        }
    }

    d_out[tid] = sdata[tid];
}