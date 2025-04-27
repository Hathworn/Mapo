#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void lots_of_double_compute(double *inputs, int N, size_t niters, double *outputs)
{
    size_t tid = blockIdx.x * blockDim.x + threadIdx.x;
    size_t nthreads = gridDim.x * blockDim.x;

    // Use shared memory for inputs to reduce global memory access latency
    __shared__ double shared_inputs[1024];

    for (; tid < N; tid += nthreads)
    {
        size_t iter;
        double val;

        // Load inputs into shared memory
        if (threadIdx.x < N)
            shared_inputs[threadIdx.x] = inputs[tid];

        __syncthreads();  // Ensure all threads have loaded their data

        if (threadIdx.x < N)
            val = shared_inputs[threadIdx.x];  // Access shared memory

        for (iter = 0; iter < niters; iter++)
        {
            val = (val + 5.0) - 101.0;
            val = (val / 3.0) + 102.0;
            val = (val + 1.07) - 103.0;
            val = (val / 1.037) + 104.0;
            val = (val + 3.00) - 105.0;
            val = (val / 0.22) + 106.0;
        }

        // Store results in global memory
        if (threadIdx.x < N)
            outputs[tid] = val;
    }
}