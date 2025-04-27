#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dot_kernel(float *output, float scale, int batch, int n, int size, float *delta)
{
    // Calculate index, f1, and f2 for the matrix element
    int index = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    int f1 = index / n;
    int f2 = index % n;
    if (f2 <= f1) return;

    float sum = 0;
    float norm1 = 0;
    float norm2 = 0;

    // Combined loops to maximize data access coalescing
    for (int b = 0; b < batch; ++b) {
        for (int i = 0; i < size; ++i) {
            int i1 = b * size * n + f1 * size + i;
            int i2 = b * size * n + f2 * size + i;
            float val1 = output[i1];
            float val2 = output[i2];
            sum += val1 * val2;
            norm1 += val1 * val1;
            norm2 += val2 * val2;
        }
    }

    // Moved square root calculation outside the loop to reduce redundant calculations
    norm1 = sqrtf(norm1);
    norm2 = sqrtf(norm2);
    float norm = norm1 * norm2;

    // Prevent division by zero if norm is zero
    if (norm == 0.0f) return;

    sum /= norm;

    // Combined loops for delta updates to improve memory access patterns
    for (int b = 0; b < batch; ++b) {
        for (int i = 0; i < size; ++i) {
            int i1 = b * size * n + f1 * size + i;
            int i2 = b * size * n + f2 * size + i;
            float scaleSumOutput2 = -scale * sum * output[i2] / norm;
            float scaleSumOutput1 = -scale * sum * output[i1] / norm;
            delta[i1] += scaleSumOutput2;
            delta[i2] += scaleSumOutput1;
        }
    }
}