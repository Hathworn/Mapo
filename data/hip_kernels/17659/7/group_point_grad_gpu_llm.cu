#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void group_point_grad_gpu(int b, int n, int c, int m, int nsample, const float *grad_out, const int *idx, float *grad_points) {
    // Calculate global thread index directly
    int batch_index = blockIdx.x;
    idx += m * nsample * batch_index;
    grad_out += m * nsample * c * batch_index;
    grad_points += n * c * batch_index;

    // Pre-compute threads and limits
    int global_thread_index = threadIdx.x + blockDim.x * blockIdx.x;
    int total_threads = gridDim.x * blockDim.x;

    // Traverse elements using global index stride pattern
    for (int j = global_thread_index; j < m; j += total_threads) {
        for (int k = 0; k < nsample; ++k) {
            int ii = idx[j * nsample + k];
            for (int l = 0; l < c; ++l) {
                // Utilize atomicAdd for safe updates to shared memory
                atomicAdd(&grad_points[ii * c + l], grad_out[j * nsample * c + k * c + l]);
            }
        }
    }
}