#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dot_kernel(float *output, float scale, int batch, int n, int size, float *delta) {
    int index = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    int f1 = index / n;
    int f2 = index % n;
    if (f2 <= f1) return;

    // Utilize shared memory for partial results to reduce global memory accesses
    __shared__ float shared_sum[32];
    __shared__ float shared_norm1[32];
    __shared__ float shared_norm2[32];

    float sum = 0.0f;
    float norm1 = 0.0f;
    float norm2 = 0.0f;

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

    // Use atomic operations to accumulate results in shared memory
    atomicAdd(&shared_sum[threadIdx.x % 32], sum);
    atomicAdd(&shared_norm1[threadIdx.x % 32], norm1);
    atomicAdd(&shared_norm2[threadIdx.x % 32], norm2);

    // Synchronize threads to ensure shared memory is correctly updated
    __syncthreads();

    // Use thread 0 of each block to finalize the computation
    if (threadIdx.x % 32 == 0) {
        float norm1_final = sqrt(shared_norm1[threadIdx.x]);
        float norm2_final = sqrt(shared_norm2[threadIdx.x]);
        float norm = norm1_final * norm2_final;
        float sum_final = shared_sum[threadIdx.x] / norm;

        for (int b = 0; b < batch; ++b) {
            for (int i = 0; i < size; ++i) {
                int i1 = b * size * n + f1 * size + i;
                int i2 = b * size * n + f2 * size + i;
                delta[i1] += -scale * sum_final * output[i2] / norm;
                delta[i2] += -scale * sum_final * output[i1] / norm;
            }
        }
    }
}