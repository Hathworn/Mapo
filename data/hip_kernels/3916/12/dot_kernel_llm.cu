#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dot_kernel(float *output, float scale, int batch, int n, int size, float *delta)
{
    int index = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    int f1 = index / n;
    int f2 = index % n;
    if (f2 <= f1) return;

    float sum = 0;
    float norm1 = 0;
    float norm2 = 0;

    // Unroll the batch loop for better performance
    for (int b = 0; b < batch; b += 2) {
        for (int i = 0; i < size; ++i) {
            int i1 = b * size * n + f1 * size + i;
            int i2 = b * size * n + f2 * size + i;
            float output1 = output[i1];
            float output2 = output[i2];

            sum += output1 * output2;
            norm1 += output1 * output1;
            norm2 += output2 * output2;

            if (b + 1 < batch) { // Second loop iteration manually unrolled
                i1 += size * n;
                i2 += size * n;
                output1 = output[i1];
                output2 = output[i2];

                sum += output1 * output2;
                norm1 += output1 * output1;
                norm2 += output2 * output2;
            }
        }
    }

    norm1 = sqrt(norm1);
    norm2 = sqrt(norm2);
    float norm = norm1 * norm2;
    sum = sum / norm;

    // Combine and unroll the second set of loops
    for (int b = 0; b < batch; b += 2) {
        for (int i = 0; i < size; ++i) {
            int i1 = b * size * n + f1 * size + i;
            int i2 = b * size * n + f2 * size + i;
            float output1 = output[i1];
            float output2 = output[i2];

            delta[i1] += -scale * sum * output2 / norm;
            delta[i2] += -scale * sum * output1 / norm;

            if (b + 1 < batch) { // Second loop iteration manually unrolled
                i1 += size * n;
                i2 += size * n;
                output1 = output[i1];
                output2 = output[i2];

                delta[i1] += -scale * sum * output2 / norm;
                delta[i2] += -scale * sum * output1 / norm;
            }
        }
    }
}