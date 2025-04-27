#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void group_point_grad_gpu(int b, int n, int c, int m, int nsample, const float *grad_out, const int *idx, float *grad_points) {
    int index = threadIdx.x + blockIdx.x * blockDim.x;  // Calculate the global thread index

    if (index >= b) return;  // Ensure thread index is within bounds

    // Offset pointers by batch index
    idx += m * nsample * index;
    grad_out += m * nsample * c * index;
    grad_points += n * c * index;

    for (int j = 0; j < m; ++j) {
        for (int k = 0; k < nsample; ++k) {
            int ii = idx[j * nsample + k];
            for (int l = 0; l < c; ++l) {
                atomicAdd(&grad_points[ii * c + l], grad_out[j * nsample * c + k * c + l]); // Use atomic operation for safety
            }
        }
    }
}