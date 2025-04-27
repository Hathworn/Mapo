```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSumRowwise(float* mat, float* target, unsigned int width, unsigned int height, float mult, float p) {
    extern __shared__ float sum_vals[];
    const int row = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;

    // Ensure the row is within bounds
    if (row < height) {
        float sum = 0.0f;
        // Load row base address
        float *data = mat + row;

        // Loop unrolling for improved performance
        for (unsigned int i = 0; i < width; i+=4) {
            if (i < width) sum += data[i * height];
            if (i+1 < width) sum += data[(i+1) * height];
            if (i+2 < width) sum += data[(i+2) * height];
            if (i+3 < width) sum += data[(i+3) * height];
        }

        // Wait for all threads to synchronize (not actually needed here since we are working on independent rows)
        __syncthreads();

        // Write the result to the target
        target[row] = p * target[row] + mult * sum;
    }
}