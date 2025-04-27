#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void NmDistanceGradKernel(int b, int n, const float* xyz1, int m, const float* xyz2, const float* grad_dist1, const int* idx1, float* grad_xyz1, float* grad_xyz2) {
    // Calculate unique thread index within a block
    int batchId = blockIdx.x;
    int threadId = threadIdx.x + blockIdx.y * blockDim.x;

    for (int i = batchId; i < b; i += gridDim.x) {
        for (int j = threadId; j < n; j += blockDim.x * gridDim.y) {
            // Precompute indices and load values into registers
            int index1 = (i * n + j) * 3;
            float x1 = xyz1[index1];
            float y1 = xyz1[index1 + 1];
            float z1 = xyz1[index1 + 2];
            int j2 = idx1[i * n + j];
            int index2 = (i * m + j2) * 3;
            float x2 = xyz2[index2];
            float y2 = xyz2[index2 + 1];
            float z2 = xyz2[index2 + 2];
            float g = grad_dist1[i * n + j] * 2;

            // Use register values and reduce atomic operations
            float dx = g * (x1 - x2);
            float dy = g * (y1 - y2);
            float dz = g * (z1 - z2);

            atomicAdd(&grad_xyz1[index1], dx);
            atomicAdd(&grad_xyz1[index1 + 1], dy);
            atomicAdd(&grad_xyz1[index1 + 2], dz);
            atomicAdd(&grad_xyz2[index2], -dx);
            atomicAdd(&grad_xyz2[index2 + 1], -dy);
            atomicAdd(&grad_xyz2[index2 + 2], -dz);
        }
    }
}