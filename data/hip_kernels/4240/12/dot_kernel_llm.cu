#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dot_kernel(float *output, float scale, int batch, int n, int size, float *delta)
{
    // Calculate unique thread index
    int index = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    int f1 = index / n;
    int f2 = index % n;
    if (f2 <= f1) return;

    // Initialize accumulators
    float sum = 0.0f;
    float norm1 = 0.0f;
    float norm2 = 0.0f;

    // Loop unrolling potential inside inner loop
    for(int b = 0; b < batch; ++b) {
        for(int i = 0; i < size; ++i) {
            int i1 = b * size * n + f1 * size + i;
            int i2 = b * size * n + f2 * size + i;
            float out_i1 = output[i1]; // Cache output[i1]
            float out_i2 = output[i2]; // Cache output[i2]
            sum += out_i1 * out_i2;
            norm1 += out_i1 * out_i1;
            norm2 += out_i2 * out_i2;
        }
    }

    // Calculating norms outside loops
    norm1 = sqrt(norm1);
    norm2 = sqrt(norm2);
    float norm = norm1 * norm2;
    sum /= norm;

    for(int b = 0; b < batch; ++b) {
        for(int i = 0; i < size; ++i) {
            int i1 = b * size * n + f1 * size + i;
            int i2 = b * size * n + f2 * size + i;
            delta[i1] += -scale * sum * output[i2] / norm;
            delta[i2] += -scale * sum * output[i1] / norm;
        }
    }
}