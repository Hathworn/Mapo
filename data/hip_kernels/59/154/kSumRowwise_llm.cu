#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize: Use parallel reduction within each block to calculate row sums
__global__ void kSumRowwise(float* mat, float* target, unsigned int width, unsigned int height, float mult, float p) {
    extern __shared__ float sum_vals[];
    const int row = blockIdx.x;
    const int tid = threadIdx.x;

    if (row < height) {
        float sum = 0;
        float *data = mat + row;

        // Each thread processes multiple elements
        for (unsigned int i = tid; i < width; i += blockDim.x) {
            sum += data[i * height];
        }

        sum_vals[tid] = sum;
        __syncthreads();

        // Perform reduction to compute the total sum for the row
        for (unsigned int stride = blockDim.x / 2; stride > 0; stride /= 2) {
            if (tid < stride) {
                sum_vals[tid] += sum_vals[tid + stride];
            }
            __syncthreads();
        }

        // The first thread in the block writes the result
        if (tid == 0) {
            target[row] = p * target[row] + mult * sum_vals[0];
        }
    }
}