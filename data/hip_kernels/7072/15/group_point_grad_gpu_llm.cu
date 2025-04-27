#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void group_point_grad_gpu(int b, int n, int c, int m, int nsample, const float *grad_out, const int *idx, float *grad_points) {
    int batch_index = blockIdx.x;  // Use block index for batch iteration
    int point_index = threadIdx.x; // Use thread index for point iteration

    if (batch_index < b && point_index < m * nsample) {
        int j = point_index / nsample;
        int k = point_index % nsample;
        int ii = idx[j * nsample + k];

        for (int l = 0; l < c; ++l) {
            atomicAdd(&grad_points[ii * c + l], grad_out[j * nsample * c + k * c + l]); // Use atomicAdd for concurrency
        }
    }
}