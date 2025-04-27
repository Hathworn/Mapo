#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void group_point_grad_gpu(int b, int n, int c, int m, int nsample, const float *grad_out, const int *idx, float *grad_points) {
    int batch_index = blockIdx.x;
    int index = threadIdx.x + blockDim.x * blockIdx.y;
    
    if (index < m * nsample) {
        int j = index / nsample;
        int k = index % nsample;
        
        idx += m * nsample * batch_index;
        grad_out += m * nsample * c * batch_index;
        grad_points += n * c * batch_index;
        
        int ii = idx[j * nsample + k];
        for (int l = 0; l < c; ++l) {
            atomicAdd(&grad_points[ii * c + l], grad_out[j * nsample * c + k * c + l]); // Use atomicAdd to avoid race conditions
        }
    }
}