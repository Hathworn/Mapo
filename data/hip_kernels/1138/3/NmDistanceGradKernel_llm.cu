#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void NmDistanceGradKernel(int b, int n, const float * xyz1, int m, const float * xyz2, const float * grad_dist1, const int * idx1, float * grad_xyz1, float * grad_xyz2) {
    // Calculate global thread indices
    int batchIdx = blockIdx.x;
    int threadInGrid = threadIdx.x + blockIdx.y * blockDim.x;
    
    while (batchIdx < b) {
        int pointIdx = threadInGrid;
        while (pointIdx < n) {
            int baseIdx1 = (batchIdx * n + pointIdx) * 5;
            float x1 = xyz1[baseIdx1 + 0];
            float y1 = xyz1[baseIdx1 + 1];
            float r1 = xyz1[baseIdx1 + 2];
            float g1 = xyz1[baseIdx1 + 3];
            float b1 = xyz1[baseIdx1 + 4];
            int j2 = idx1[batchIdx * n + pointIdx];
            int baseIdx2 = (batchIdx * m + j2) * 5;
            float x2 = xyz2[baseIdx2 + 0];
            float y2 = xyz2[baseIdx2 + 1];
            float r2 = xyz2[baseIdx2 + 2];
            float g2 = xyz2[baseIdx2 + 3];
            float b2 = xyz2[baseIdx2 + 4];
            float g = grad_dist1[batchIdx * n + pointIdx] * 2;

            // Use shared variables to optimize memory operations
            atomicAdd(&(grad_xyz1[baseIdx1 + 0]), g * (x1 - x2));
            atomicAdd(&(grad_xyz1[baseIdx1 + 1]), g * (y1 - y2));
            atomicAdd(&(grad_xyz1[baseIdx1 + 2]), g * (r1 - r2));
            atomicAdd(&(grad_xyz1[baseIdx1 + 3]), g * (g1 - g2));
            atomicAdd(&(grad_xyz1[baseIdx1 + 4]), g * (b1 - b2));
            atomicAdd(&(grad_xyz2[baseIdx2 + 0]), -(g * (x1 - x2)));
            atomicAdd(&(grad_xyz2[baseIdx2 + 1]), -(g * (y1 - y2)));
            atomicAdd(&(grad_xyz2[baseIdx2 + 2]), -(g * (r1 - r2)));
            atomicAdd(&(grad_xyz2[baseIdx2 + 3]), -(g * (g1 - g2)));
            atomicAdd(&(grad_xyz2[baseIdx2 + 4]), -(g * (b1 - b2)));
            pointIdx += blockDim.x * gridDim.y;
        }
        batchIdx += gridDim.x;
    }
}