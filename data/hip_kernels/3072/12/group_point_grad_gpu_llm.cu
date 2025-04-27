#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void group_point_grad_gpu(int b, int n, int c, int m, int nsample, const float *grad_out, const int *idx, float *grad_points) {
    int batch_index = blockIdx.x;  // Each block handles one batch
    int sample_index = threadIdx.x;  // Each thread handles one sample

    if (batch_index < b && sample_index < nsample) {
        const int *idx_batch = idx + batch_index * m * nsample;
        const float *grad_out_batch = grad_out + batch_index * m * nsample * c;
        float *grad_points_batch = grad_points + batch_index * n * c;
        
        for (int j = 0; j < m; ++j) {
            int ii = idx_batch[j * nsample + sample_index];
            for (int l = 0; l < c; ++l) {
                atomicAdd(&grad_points_batch[ii * c + l], grad_out_batch[j * nsample * c + sample_index * c + l]);  // Use atomicAdd for safe updates
            }
        }
    }
}