#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dot_kernel(float *output, float scale, int batch, int n, int size, float *delta) {
    int index = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    int f1 = index / n;
    int f2 = index % n;
    if (f2 <= f1) return;

    float sum = 0;
    float norm1 = 0;
    float norm2 = 0;
    int b, i;
    
    // Utilize shared memory for intermediate sums
    extern __shared__ float shared_mem[];
    float *shared_output = shared_mem;

    for (b = 0; b < batch; ++b) {
        float batch_norm1 = 0;
        float batch_norm2 = 0;
        float batch_sum = 0;

        for (i = 0; i < size; ++i) {
            int i1 = b * size * n + f1 * size + i;
            int i2 = b * size * n + f2 * size + i;
            shared_output[i] = output[i1];
            shared_output[size + i] = output[i2];

            batch_norm1 += shared_output[i] * shared_output[i];
            batch_norm2 += shared_output[size + i] * shared_output[size + i];
            batch_sum += shared_output[i] * shared_output[size + i];
        }

        norm1 += batch_norm1;
        norm2 += batch_norm2;
        sum += batch_sum;
    }

    norm1 = sqrt(norm1);
    norm2 = sqrt(norm2);
    float norm = norm1 * norm2;
    sum = sum / norm;

    for (b = 0; b < batch; ++b) {
        for (i = 0; i < size; ++i) {
            int i1 = b * size * n + f1 * size + i;
            int i2 = b * size * n + f2 * size + i;
            delta[i1] += -scale * sum * output[i2] / norm;
            delta[i2] += -scale * sum * output[i1] / norm;
        }
    }
}