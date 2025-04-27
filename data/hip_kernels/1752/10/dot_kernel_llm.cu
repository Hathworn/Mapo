#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dot_kernel(float *output, float scale, int batch, int n, int size, float *delta)
{
    // Calculate global index for unique thread identification
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int f1 = index / n;
    int f2 = index % n;

    // Exit if f2 is not greater than f1
    if (f2 <= f1) return;

    // Initialize variables for sum and norms
    float sum = 0;
    float norm1 = 0;
    float norm2 = 0;

    // Iterate over the batch and size to compute sum and norms
    for (int b = 0; b < batch; ++b) {
        for (int i = 0; i < size; ++i) {
            int i1 = b * size * n + f1 * size + i;
            int i2 = b * size * n + f2 * size + i;
            float val1 = output[i1];
            float val2 = output[i2];

            // Accumulate sum and norms
            sum += val1 * val2;
            norm1 += val1 * val1;
            norm2 += val2 * val2;
        }
    }

    // Calculate the norms and adjust the sum
    norm1 = rsqrtf(norm1);  // Use fast rsqrt approximation
    norm2 = rsqrtf(norm2);  // Use fast rsqrt approximation
    float norm = norm1 * norm2;
    sum *= norm;

    // Update delta values with the computed scale, sum, and output adjustments
    for (int b = 0; b < batch; ++b) {
        for (int i = 0; i < size; ++i) {
            int i1 = b * size * n + f1 * size + i;
            int i2 = b * size * n + f2 * size + i;
            float scaledSum = scale * sum;
            atomicAdd(&delta[i1], -scaledSum * output[i2]);
            atomicAdd(&delta[i2], -scaledSum * output[i1]);
        }
    }
}