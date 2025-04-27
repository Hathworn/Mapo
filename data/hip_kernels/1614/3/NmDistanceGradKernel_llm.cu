#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void NmDistanceGradKernel(int b,int n,const float * xyz1,int m,const float * xyz2,const float * grad_dist1,const int * idx1,float * grad_xyz1,float * grad_xyz2){
    // Calculate global indices for batch and point
    int batch_idx = blockIdx.x + blockIdx.y * gridDim.x;
    int point_idx = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Bounds check to ensure safe indexing
    if (batch_idx < b && point_idx < n) {
        // Precompute indices for faster access
        int xyz1_idx = (batch_idx * n + point_idx) * 5;
        int j2 = idx1[batch_idx * n + point_idx];
        int xyz2_idx = (batch_idx * m + j2) * 5;

        // Load values into registers for faster access
        float x1 = xyz1[xyz1_idx + 0];
        float y1 = xyz1[xyz1_idx + 1];
        float r1 = xyz1[xyz1_idx + 2];
        float g1 = xyz1[xyz1_idx + 3];
        float b1 = xyz1[xyz1_idx + 4];

        float x2 = xyz2[xyz2_idx + 0];
        float y2 = xyz2[xyz2_idx + 1];
        float r2 = xyz2[xyz2_idx + 2];
        float g2 = xyz2[xyz2_idx + 3];
        float b2 = xyz2[xyz2_idx + 4];

        float g = grad_dist1[batch_idx * n + point_idx] * 2;

        // Perform atomic updates for gradients
        atomicAdd(&grad_xyz1[xyz1_idx + 0], g * (x1 - x2));
        atomicAdd(&grad_xyz1[xyz1_idx + 1], g * (y1 - y2));
        atomicAdd(&grad_xyz1[xyz1_idx + 2], g * (r1 - r2));
        atomicAdd(&grad_xyz1[xyz1_idx + 3], g * (g1 - g2));
        atomicAdd(&grad_xyz1[xyz1_idx + 4], g * (b1 - b2));

        atomicAdd(&grad_xyz2[xyz2_idx + 0], -(g * (x1 - x2)));
        atomicAdd(&grad_xyz2[xyz2_idx + 1], -(g * (y1 - y2)));
        atomicAdd(&grad_xyz2[xyz2_idx + 2], -(g * (r1 - r2)));
        atomicAdd(&grad_xyz2[xyz2_idx + 3], -(g * (g1 - g2)));
        atomicAdd(&grad_xyz2[xyz2_idx + 4], -(g * (b1 - b2)));
    }
}