#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void group_point_grad_gpu(int b, int n, int c, int m, int nsample, const float *grad_out, const int *idx, float *grad_points) {
    // Calculate the batch index, point set index and sample index using thread and block indices
    int i = blockIdx.x;
    int j = blockIdx.y;
    int k = threadIdx.x;

    if (i < b && j < m && k < nsample) {  // Ensure indices are within bounds
        int ii = idx[j * nsample + k];
        for (int l = 0; l < c; ++l) {
            atomicAdd(&grad_points[ii * c + l], grad_out[j * nsample * c + k * c + l]);
        }
    }
}