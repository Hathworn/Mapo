#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void _bcnn_forward_softmax_layer_kernel(int n, int batch, float *input, float *output)
{
    float sum = 0.0f;
    float largest = -INFINITY;
    int b = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if this thread's task is in range
    if (b >= batch) return;

    // Calculate the offset for this batch
    int offset = b * n;

    // Find the largest value for numerical stability
    for (int i = 0; i < n; ++i) {
        float val = input[i + offset];
        largest = fmaxf(val, largest);
    }

    // Calculate the exponentials sum
    for (int i = 0; i < n; ++i) {
        sum += expf(input[i + offset] - largest);
    }

    // Calculate the normalization factor
    float norm_factor = (sum != 0.0f) ? (largest + logf(sum)) : (largest - 100.0f);

    // Normalize the softmax output
    for (int i = 0; i < n; ++i) {
        output[i + offset] = expf(input[i + offset] - norm_factor);
    }
}