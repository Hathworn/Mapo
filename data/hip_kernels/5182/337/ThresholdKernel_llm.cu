#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ThresholdKernel(float min, float max, int mode, float* input, float* output, int size, int count)
{
    int id = blockDim.x * blockIdx.y * gridDim.x
           + blockDim.x * blockIdx.x
           + threadIdx.x;

    // Use shared memory efficiently
    __shared__ float delta;

    if(id < size)
    {
        // Initialize delta once per block
        if (threadIdx.x == 0)
            delta = (max - min) / count;
        __syncthreads();

        // Unroll loop for performance
        #pragma unroll
        for (int i = 0; i < count; i++)
            output[i * size + id] = 0;

        int idx;
        float fidx = ((input[id] - min) / delta);

        // Simplify switch-case logic using ternary operator
        idx = (mode == 0)
            ? (int)floor(fmaxf(0, fminf(fidx, count - 1)))
            : ((fidx < 0.0f || fidx >= count) ? -1 : (int)fidx);

        if (idx != -1) // Ensure index is valid for mode 1
            output[idx * size + id] = 1.0f;
    }
}