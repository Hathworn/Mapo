```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void group_point_grad_gpu(int b, int n, int c, int m, int nsample, const float *grad_out, const int *idx, float *grad_points) {
    int batch_idx = blockIdx.x;
    int thread_idx = threadIdx.x;

    // Adjust pointers for batch handling
    idx += m * nsample * batch_idx;
    grad_out += m * nsample * c * batch_idx;
    grad_points += n * c * batch_idx;

    // Parallelize over 'm' using blockDim.y
    for (int j = thread_idx; j < m; j += blockDim.y) {
        for (int k = 0; k < nsample; ++k) {
            int ii = idx[j * nsample + k];
            for (int l = 0; l < c; ++l) {
                atomicAdd(&grad_points[ii * c + l], grad_out[j * nsample * c + k * c + l]);
            }
        }
    }
}