#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void lots_of_float_compute(float *inputs, int N, size_t niters, float *outputs)
{
    size_t tid = blockIdx.x * blockDim.x + threadIdx.x;
    size_t nthreads = gridDim.x * blockDim.x;

    for (; tid < N; tid += nthreads)
    {
        size_t iter;
        float val = inputs[tid];

        // Pre-calculate constants outside the loop
        const float const1 = 1.0f / 3.0f;
        const float const2 = 1.0f / 1.037f;
        const float const3 = 1.0f / 0.22f;
        const float offset1 = 5.0f - 101.0f;
        const float offset2 = 102.0f - 103.0f;
        const float offset3 = 104.0f - 105.0f;
        const float offset4 = 106.0f;

        for (iter = 0; iter < niters; iter++)
        {
            // Consolidate operations to reduce instruction count
            val = ((val + offset1) * const1 + offset2) * const2 + offset3;
            val = val * const3 + offset4;
        }

        outputs[tid] = val;
    }
}