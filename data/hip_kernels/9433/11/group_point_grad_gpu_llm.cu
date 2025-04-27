#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void group_point_grad_gpu(int b, int n, int c, int m, int nsample, const float *grad_out, const int *idx, float *grad_points) {
    int j = blockIdx.x;
    int k = threadIdx.x;

    if (j < m && k < nsample) {
        for (int i = 0; i < b; ++i) {
            int ii = idx[j * nsample + k];
            for (int l = 0; l < c; ++l) {
                atomicAdd(&grad_points[ii * c + l], grad_out[j * nsample * c + k * c + l]);
            }
            idx += m * nsample;
            grad_out += m * nsample * c;
            grad_points += n * c;
        }
    }
}