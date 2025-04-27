#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dot_kernel(float *output, float scale, int batch, int n, int size, float *delta)
{
    // Optimize by computing 3D thread index based on batch, n, and size
    int batch_index = blockIdx.z;
    int row_index = blockIdx.y;
    int col_index = blockIdx.x * blockDim.x + threadIdx.x;

    if (row_index >= n || col_index >= n || col_index <= row_index) return;

    float sum = 0.0;
    float norm1 = 0.0;
    float norm2 = 0.0;

    // Cache indices for memory access optimization
    int row_base = batch_index * size * n + row_index * size;
    int col_base = batch_index * size * n + col_index * size;

    // Use shared memory for partial results
    __shared__ float shared_sum[1024];
    __shared__ float shared_norm1[1024];
    __shared__ float shared_norm2[1024];

    shared_sum[threadIdx.x] = 0.0;
    shared_norm1[threadIdx.x] = 0.0;
    shared_norm2[threadIdx.x] = 0.0;

    // Parallelize the dot product calculation
    for (int i = threadIdx.x; i < size; i += blockDim.x) {
        int i1 = row_base + i;
        int i2 = col_base + i;
        float val1 = output[i1];
        float val2 = output[i2];
        shared_sum[threadIdx.x] += val1 * val2;
        shared_norm1[threadIdx.x] += val1 * val1;
        shared_norm2[threadIdx.x] += val2 * val2;
    }

    // Synchronize threads before reduction
    __syncthreads();

    // Reduce shared memory results
    if (threadIdx.x == 0) {
        for (int i = 1; i < blockDim.x; i++) {
            shared_sum[0] += shared_sum[i];
            shared_norm1[0] += shared_norm1[i];
            shared_norm2[0] += shared_norm2[i];
        }

        float norm1 = sqrt(shared_norm1[0]);
        float norm2 = sqrt(shared_norm2[0]);
        float norm = norm1 * norm2;
        shared_sum[0] = shared_sum[0] / norm;

        // Update delta arrays
        for (int i = 0; i < size; ++i) {
            int i1 = row_base + i;
            int i2 = col_base + i;
            atomicAdd(&delta[i1], -scale * shared_sum[0] * output[i2] / norm);
            atomicAdd(&delta[i2], -scale * shared_sum[0] * output[i1] / norm);
        }
    }
}