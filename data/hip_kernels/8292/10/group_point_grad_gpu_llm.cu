#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void group_point_grad_gpu(int b, int n, int c, int m, int nsample, const float *grad_out, const int *idx, float *grad_points) {
    int batch_index = blockIdx.x;
    int sample_index = blockIdx.y * blockDim.x + threadIdx.x;  // Flatten threadIdx for better grid usage
    
    if (batch_index < b && sample_index < m * nsample) {
        int j = sample_index / nsample;
        int k = sample_index % nsample;
        int ii = idx[j * nsample + k];
        
        for (int l = 0; l < c; ++l) {
            atomicAdd(&grad_points[ii * c + l], grad_out[j * nsample * c + k * c + l]);  // Use atomic add for concurrent writes
        }
    }
}