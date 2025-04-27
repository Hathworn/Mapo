#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void timedReduction(const float *input, float *output, clock_t *timer)
{
    extern __shared__ float shared[];

    const int tid = threadIdx.x;
    const int bid = blockIdx.x;
    const int gridSize = blockDim.x * 2;

    if (tid == 0) timer[bid] = clock(); // Start timer

    // Copy input.
    shared[tid] = input[tid + bid * gridSize];
    shared[tid + blockDim.x] = input[tid + blockDim.x + bid * gridSize];
  
    // Perform reduction to find minimum.
    for (int stride = blockDim.x; stride > 0; stride >>= 1) 
    {
        __syncthreads(); // Ensure all threads have updated shared memory

        if (tid < stride)
        {
            float f0 = shared[tid];
            float f1 = shared[tid + stride];

            // Assign minimum value
            shared[tid] = f1 < f0 ? f1 : f0;
        }
    }

    // Write result.
    if (tid == 0) output[bid] = shared[0]; // Store minimum in output

    __syncthreads();

    if (tid == 0) timer[bid + gridDim.x] = clock(); // End timer
}