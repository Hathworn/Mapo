#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void dot_kernel(float *output, float scale, int batch, int n, int size, float *delta)
{
    // Calculate global thread index
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;  // Stride for grid-striding loop

    for (; index < batch * n * (n - 1) / 2 * size; index += stride) {
        int f1 = (int)floor((-1 + sqrt(1 + 8 * index / size)) / 2);
        int f2 = index / size - (f1 * (f1 + 1)) / 2;
        if (f2 <= f1) continue;

        float sum = 0.0f;
        float norm1 = 0.0f;
        float norm2 = 0.0f;

        // Unroll loops for better performance if possible
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

        norm1 = rsqrtf(norm1);  // Use rsqrtf for faster calculation
        norm2 = rsqrtf(norm2);
        float norm = norm1 * norm2 / sum;
        
        for (int b = 0; b < batch; ++b) {
            for (int i = 0; i < size; ++i) {
                int i1 = b * size * n + f1 * size + i;
                int i2 = b * size * n + f2 * size + i;
                float val = scale * norm;
                atomicAdd(&delta[i1], -val * output[i2]);
                atomicAdd(&delta[i2], -val * output[i1]);
            }
        }
    }
}