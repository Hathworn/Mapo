#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void lots_of_double_compute(double *inputs, int N, size_t niters, double *outputs)
{
    size_t tid = blockIdx.x * blockDim.x + threadIdx.x;
    size_t nthreads = gridDim.x * blockDim.x;

    for (; tid < N; tid += nthreads)
    {
        size_t iter;
        double val = inputs[tid];

        // Consolidate calculations for reduced operations within loop
        double offset1 = (5.0 - 101.0) / 3.0 + 102.0;
        double offset2 = (1.07 - 103.0) / 1.037 + 104.0;
        double offset3 = (3.00 - 105.0) / 0.22 + 106.0;

        for (iter = 0; iter < niters; iter++)
        {
            val = ((val + offset1) + offset2) + offset3;
        }

        outputs[tid] = val;
    }
}