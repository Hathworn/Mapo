#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void NmDistanceGradKernel(int b, int n, const float *xyz1, int m, const float *xyz2, const float *grad_dist1, const int *idx1, float *grad_xyz1, float *grad_xyz2) {
    int batchIdx = blockIdx.x;
    int threadIdxGlobal = threadIdx.x + blockIdx.y * blockDim.x;
    
    // Iterate over batches
    for (; batchIdx < b; batchIdx += gridDim.x) {
        // Iterate over elements within a batch
        for (int j = threadIdxGlobal; j < n; j += blockDim.x * gridDim.y) {
            float x1 = xyz1[(batchIdx * n + j) * 2 + 0];
            float y1 = xyz1[(batchIdx * n + j) * 2 + 1];
            int j2 = idx1[batchIdx * n + j];
            float x2 = xyz2[(batchIdx * m + j2) * 2 + 0];
            float y2 = xyz2[(batchIdx * m + j2) * 2 + 1];
            float gradient = grad_dist1[batchIdx * n + j] * 2;
            
            // Compute gradients
            atomicAdd(&(grad_xyz1[(batchIdx * n + j) * 2 + 0]), gradient * (x1 - x2));
            atomicAdd(&(grad_xyz1[(batchIdx * n + j) * 2 + 1]), gradient * (y1 - y2));
            atomicAdd(&(grad_xyz2[(batchIdx * m + j2) * 2 + 0]), -(gradient * (x1 - x2)));
            atomicAdd(&(grad_xyz2[(batchIdx * m + j2) * 2 + 1]), -(gradient * (y1 - y2)));
        }
    }
}