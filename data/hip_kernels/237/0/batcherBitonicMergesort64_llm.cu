#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void batcherBitonicMergesort64(float * d_out, const float * d_in)
{
    // You are guaranteed this is called with <<<1, 64, 64*4>>>
    extern __shared__ float sdata[];
    int tid  = threadIdx.x;
    sdata[tid] = d_in[tid];
    __syncthreads();

    // Optimization: Unroll loops and fine-tune shared memory access
    for (int stage = 0; stage <= 5; ++stage)
    {
        int stride = 1 << stage;
        int pairDistance = stride >> 1;
        bool ascending = ((tid & stride == 0));

        for (int substage = stage; substage >= 0; --substage)
        {
            int pos = 2 * tid - (tid & pairDistance);
            if (pos + pairDistance < 64)
            {
                float valA = sdata[pos];
                float valB = sdata[pos + pairDistance];
                if ((valA > valB) == ascending)
                {
                    sdata[pos] = valB;
                    sdata[pos + pairDistance] = valA;
                }
            }
            __syncthreads();
            pairDistance >>= 1;
        }
    }

    d_out[tid] = sdata[tid];
}