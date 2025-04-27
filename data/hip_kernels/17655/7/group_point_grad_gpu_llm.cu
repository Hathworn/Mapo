#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void group_point_grad_gpu(int b, int n, int c, int m, int nsample, const float *grad_out, const int *idx, float *grad_points) {
    int batch_index = blockIdx.x;
    idx += m * nsample * batch_index;
    grad_out += m * nsample * c * batch_index;
    grad_points += n * c * batch_index;

    int index = blockDim.x * blockIdx.y + threadIdx.x; // Improved indexing with additional grid dimension
    int stride = blockDim.x * gridDim.y;

    for (int j = index; j < m * nsample; j += stride) { // Unrolled j-loop for better coalescing
        int sample_idx = j / nsample;
        int local_k = j % nsample;
        int ii = idx[sample_idx * nsample + local_k];
        for (int l = 0; l < c; ++l) {
            atomicAdd(&grad_points[ii * c + l], grad_out[sample_idx * nsample * c + local_k * c + l]);
        }
    }
}