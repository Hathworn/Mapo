#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void NmDistanceGradKernel(int b, int n, const float *xyz1, int m, const float *xyz2, const float *grad_dist1, const int *idx1, float *grad_xyz1, float *grad_xyz2) {
    // Optimize index calculations using reusable variables
    int batchIdx = blockIdx.x * gridDim.y + blockIdx.y;
    if (batchIdx >= b) return;

    int pointIdx = threadIdx.x + blockIdx.y * blockDim.x;
    while (pointIdx < n) {
        int idx1_offset = batchIdx * n + pointIdx;
        int idx2 = idx1[idx1_offset];
        
        float x1 = xyz1[idx1_offset * 2];
        float y1 = xyz1[idx1_offset * 2 + 1];
        float x2 = xyz2[(batchIdx * m + idx2) * 2];
        float y2 = xyz2[(batchIdx * m + idx2) * 2 + 1];
        
        float g = grad_dist1[idx1_offset] * 2;

        // Reduce global memory access and improve data locality
        atomicAdd(&grad_xyz1[idx1_offset * 2], g * (x1 - x2));
        atomicAdd(&grad_xyz1[idx1_offset * 2 + 1], g * (y1 - y2));
        atomicAdd(&grad_xyz2[(batchIdx * m + idx2) * 2], -(g * (x1 - x2)));
        atomicAdd(&grad_xyz2[(batchIdx * m + idx2) * 2 + 1], -(g * (y1 - y2)));

        pointIdx += blockDim.x * gridDim.y;
    }
}