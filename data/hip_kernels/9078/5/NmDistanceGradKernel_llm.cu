#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void NmDistanceGradKernel(int b, int n, const float * xyz1, int m, const float * xyz2, const float * grad_dist1, const int * idx1, float * grad_xyz1, float * grad_xyz2) {
    int i = blockIdx.x;  // Each block works on its own batch
    int j_start = threadIdx.x + blockIdx.y * blockDim.x; // Calculate starting index for this thread

    for (int j = j_start; j < n; j += blockDim.x * gridDim.y) {
        float x1 = xyz1[(i * n + j) * 3 + 0];
        float y1 = xyz1[(i * n + j) * 3 + 1];
        float z1 = xyz1[(i * n + j) * 3 + 2];
        
        int j2 = idx1[i * n + j];
        
        float x2 = xyz2[(i * m + j2) * 3 + 0];
        float y2 = xyz2[(i * m + j2) * 3 + 1];
        float z2 = xyz2[(i * m + j2) * 3 + 2];
        
        float g = grad_dist1[i * n + j] * 2;
        
        // Precompute g * (x1 - x2), g * (y1 - y2), g * (z1 - z2) to avoid redundancy
        float diff_x = g * (x1 - x2);
        float diff_y = g * (y1 - y2);
        float diff_z = g * (z1 - z2);
        
        atomicAdd(&(grad_xyz1[(i * n + j) * 3 + 0]), diff_x);
        atomicAdd(&(grad_xyz1[(i * n + j) * 3 + 1]), diff_y);
        atomicAdd(&(grad_xyz1[(i * n + j) * 3 + 2]), diff_z);
        
        atomicAdd(&(grad_xyz2[(i * m + j2) * 3 + 0]), -diff_x);
        atomicAdd(&(grad_xyz2[(i * m + j2) * 3 + 1]), -diff_y);
        atomicAdd(&(grad_xyz2[(i * m + j2) * 3 + 2]), -diff_z);
    }
}