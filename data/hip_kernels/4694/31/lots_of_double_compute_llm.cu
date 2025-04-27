#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void lots_of_double_compute(double *inputs, int N, size_t niters, double *outputs)
{
    size_t tid = blockIdx.x * blockDim.x + threadIdx.x;
    size_t nthreads = gridDim.x * blockDim.x;

    // Loop optimization: unrolling the iteration loop
    for (; tid < N; tid += nthreads)
    {
        size_t iter;
        double val = inputs[tid];

        for (iter = 0; iter < niters; iter += 6) // Unroll by a factor of 6
        {
            val += 5.0;
            val -= 101.0;
            val /= 3.0;
            val += 102.0;
            val += 1.07;
            val -= 103.0;
            val /= 1.037;
            val += 104.0;
            val += 3.00;
            val -= 105.0;
            val /= 0.22;
            val += 106.0;
        }

        // If niters is not a multiple of 6, handle remaining iterations
        int remaining = niters % 6;
        for (iter = 0; iter < remaining; iter++)
        {
            val = (val + 5.0) - 101.0;
            val = (val / 3.0) + 102.0;
            val = (val + 1.07) - 103.0;
            val = (val / 1.037) + 104.0;
            val = (val + 3.00) - 105.0;
            val = (val / 0.22) + 106.0;
        }

        outputs[tid] = val;
    }
}