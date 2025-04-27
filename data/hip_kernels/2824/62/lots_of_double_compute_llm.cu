#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void lots_of_double_compute(double *inputs, int N, size_t niters, double *outputs)
{
    size_t tid = blockIdx.x * blockDim.x + threadIdx.x;
    size_t nthreads = gridDim.x * blockDim.x;

    // Utilize loop unrolling and avoid recomputing values
    for ( ; tid < N; tid += nthreads)
    {
        size_t iter;
        double val = inputs[tid];

        #pragma unroll 4 // Unroll loops to increase instruction level parallelism
        for (iter = 0; iter < niters; iter++)
        {
            // Consolidate operations to reduce arithmetic instruction count
            val = ((val - 91.0) / 3.0 + 203.0) / 1.037;
            val = (val - 102.93) / 0.22 + 109.0;
        }

        outputs[tid] = val;
    }
}