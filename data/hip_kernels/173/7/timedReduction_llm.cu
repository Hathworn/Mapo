```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void timedReduction(const float *input, float *output, clock_t *timer)
{
    extern __shared__ float shared[];

    const int tid = threadIdx.x;
    const int bid = blockIdx.x;
    const int idx = tid + 2 * bid * blockDim.x;

    if (tid == 0) timer[bid] = clock();

    // Copy input using stride to improve memory access pattern
    shared[tid] = input[idx];
    shared[tid + blockDim.x] = input[idx + blockDim.x];

    // Perform reduction to find minimum with improved stride
    for (int d = blockDim.x; d > 0; d >>= 1) // Use bit shift for division by 2
    {
        __syncthreads();

        if (tid < d)
        {
            float f0 = shared[tid];
            float f1 = shared[tid + d];

            // Min operation in a single statement
            shared[tid] = fminf(f0, f1);
        }
    }

    // Write result.
    if (tid == 0) output[bid] = shared[0];

    __syncthreads();

    if (tid == 0) timer[bid+gridDim.x] = clock();
}