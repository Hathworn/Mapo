#include "hip/hip_runtime.h"
#include "includes.h"
__global__ static void timedReduction(const float *input, float *output, clock_t *timer)
{
    extern __shared__ float shared[];

    const int tid = threadIdx.x;
    const int bid = blockIdx.x;

    if (tid == 0) {
        // Initialize timer at the start
        timer[bid] = clock();
    }
    
    // Copy input to shared memory efficiently
    int index = bid * (2 * blockDim.x) + tid;
    shared[tid] = input[index];
    shared[tid + blockDim.x] = input[index + blockDim.x];

    // Perform reduction using shared memory
    for (int d = blockDim.x; d > 0; d >>= 1)
    {
        __syncthreads();
        
        if (tid < d)
        {
            float f0 = shared[tid];
            float f1 = shared[tid + d];
            shared[tid] = fminf(f0, f1);  // More concise operation
        }
    }

    // Write result
    if (tid == 0) {
        output[bid] = shared[0];

        // Record timer at the end
        timer[bid + gridDim.x] = clock();
    }
}