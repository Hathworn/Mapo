#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void NmDistanceGradKernel(int b, int n, const float *xyz1, int m, const float *xyz2, const float *grad_dist1, const int *idx1, float *grad_xyz1, float *grad_xyz2) {
    // Optimize grid-stride loop for better code efficiency
    int batch_index = blockIdx.x;
    while (batch_index < b) {
        int index = threadIdx.x + blockIdx.y * blockDim.x;
        int stride = blockDim.x * gridDim.y;
        while (index < n) {
            float x1 = xyz1[(batch_index * n + index) * 2 + 0];
            float y1 = xyz1[(batch_index * n + index) * 2 + 1];
            int j2 = idx1[batch_index * n + index];
            float x2 = xyz2[(batch_index * m + j2) * 2 + 0];
            float y2 = xyz2[(batch_index * m + j2) * 2 + 1];
            float g = grad_dist1[batch_index * n + index] * 2;
            atomicAdd(&(grad_xyz1[(batch_index * n + index) * 2 + 0]), g * (x1 - x2));
            atomicAdd(&(grad_xyz1[(batch_index * n + index) * 2 + 1]), g * (y1 - y2));
            atomicAdd(&(grad_xyz2[(batch_index * m + j2) * 2 + 0]), -(g * (x1 - x2)));
            atomicAdd(&(grad_xyz2[(batch_index * m + j2) * 2 + 1]), -(g * (y1 - y2)));
            index += stride;
        }
        batch_index += gridDim.x;
    }
}