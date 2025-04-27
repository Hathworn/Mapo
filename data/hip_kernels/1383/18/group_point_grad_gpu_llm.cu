#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void group_point_grad_gpu(int b, int n, int c, int m, int nsample, const float *grad_out, const int *idx, float *grad_points) {
    // Calculate global thread index
    int batch_index = blockIdx.x;
    int thread_index = threadIdx.x;

    // Adjust pointers to this batch
    idx += batch_index * m * nsample;
    grad_out += batch_index * m * nsample * c;
    grad_points += batch_index * n * c;

    // Use shared memory to optimize access (assumed cumulative initialization outside kernel)
    __shared__ float shared_grad_out[1024];  // Size depending on actual use case
    __shared__ int shared_idx[1024];         // Size depending on actual use case

    for (int j = thread_index; j < m; j += blockDim.x) {
        for (int k = 0; k < nsample; ++k) {
            int point_idx = shared_idx[j * nsample + k];
            for (int l = 0; l < c; ++l) {
                // Optimize by using shared memory and coalesced access
                atomicAdd(&grad_points[point_idx * c + l], shared_grad_out[j * nsample * c + k * c + l]);
            }
        }
    }
}