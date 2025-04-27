#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ThresholdKernel(float min, float max, int mode, float* input, float* output, int size, int count)
{
    int id = blockDim.x * blockIdx.y * gridDim.x
    + blockDim.x * blockIdx.x
    + threadIdx.x;

    __shared__ float delta;

    if(threadIdx.x == 0) {
        delta = (max - min) / count; // Compute delta once using shared memory
    }
    __syncthreads();

    if(id < size) {
        for (int i = 0; i < count; i++) {
            output[i * size + id] = 0.0f; // Initialize output using floating point number
        }

        int idx;
        float fidx = ((input[id] - min) / delta);

        switch (mode)
        {
        case 0: // consider values outside of the interval <min,max>
            idx = (int)floor(fmaxf(0.0f, fminf(fidx, count - 1))); // Use consistent fmaxf and fminf
            break;
        case 1: // strict threshold
            if (fidx < 0.0f || fidx >= count) {
                return;
            }
            idx = (int)fidx;
            break;
        }
        output[idx * size + id] = 1.0f; // Write to output only at valid position
    }
}