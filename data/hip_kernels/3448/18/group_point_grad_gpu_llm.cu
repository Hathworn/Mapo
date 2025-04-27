#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void group_point_grad_gpu(int b, int n, int c, int m, int nsample, const float *grad_out, const int *idx, float *grad_points) {
    int batch_idx = blockIdx.x;
    int point_idx = threadIdx.x + blockIdx.y * blockDim.x;

    if (point_idx < m) {
        idx += batch_idx * m * nsample;
        grad_out += batch_idx * m * nsample * c;
        grad_points += batch_idx * n * c;

        for (int k = 0; k < nsample; ++k) {
            int ii = idx[point_idx * nsample + k];
            for (int l = 0; l < c; ++l) {
                atomicAdd(&grad_points[ii * c + l], grad_out[point_idx * nsample * c + k * c + l]);
                // Optimized with atomicAdd to prevent race conditions and improve performance
            }
        }
    }
}