#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void lots_of_float_compute(float *inputs, int N, size_t niters, float *outputs)
{
    size_t tid = blockIdx.x * blockDim.x + threadIdx.x;
    size_t nthreads = gridDim.x * blockDim.x;

    for ( ; tid < N; tid += nthreads)
    {
        float val = inputs[tid];

        // Combine constant operations outside the loop to reduce computation
        float const1 = (5.0f - 101.0f) / 3.0f + 102.0f;
        float const2 = (1.07f - 103.0f) / 1.037f + 104.0f;
        float const3 = (3.00f - 105.0f) / 0.22f + 106.0f;

        for (size_t iter = 0; iter < niters; iter++)
        {
            val = const1;
            val = const2;
            val = const3;
        }

        outputs[tid] = val;
    }
}