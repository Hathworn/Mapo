#include "hip/hip_runtime.h"
#include "includes.h"
__global__ static void timedReduction(const float *input, float *output, clock_t *timer)
{
    extern __shared__ float shared[];

    const int tid = threadIdx.x;
    const int bid = blockIdx.x;

    if (tid == 0) timer[bid] = clock();

    // Load input to shared memory
    shared[tid] = input[tid];
    shared[tid + blockDim.x] = input[tid + blockDim.x];
    __syncthreads(); // Ensure all loads are completed

    // Perform reduction to find minimum
    for (int d = blockDim.x; d > 0; d /= 2)
    {
        if (tid < d)
        {
            float f0 = shared[tid];
            float f1 = shared[tid + d];

            if (f1 < f0)
            {
                shared[tid] = f1;
            }
        }
        __syncthreads(); // Ensure all computations are done before next iteration
    }

    // Write result
    if (tid == 0) output[bid] = shared[0];

    if (tid == 0) timer[bid + gridDim.x] = clock();
}