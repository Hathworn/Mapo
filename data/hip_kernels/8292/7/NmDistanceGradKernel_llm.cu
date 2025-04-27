#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void NmDistanceGradKernel(int b, int n, const float * xyz1, int m, const float * xyz2, const float * grad_dist1, const int * idx1, float * grad_xyz1, float * grad_xyz2) {
    // Get block and thread indices
    int batch_idx = blockIdx.x;
    int thread_idx = threadIdx.x + blockIdx.y * blockDim.x;

    // Loop through batches
    for (int i = batch_idx; i < b; i += gridDim.x) {
        // Loop through points
        for (int j = thread_idx; j < n; j += blockDim.x * gridDim.y) {
            // Load xyz1 data
            float x1 = xyz1[(i * n + j) * 3 + 0];
            float y1 = xyz1[(i * n + j) * 3 + 1];
            float z1 = xyz1[(i * n + j) * 3 + 2];
            
            // Fetch corresponding index
            int j2 = idx1[i * n + j];

            // Load xyz2 data
            float x2 = xyz2[(i * m + j2) * 3 + 0];
            float y2 = xyz2[(i * m + j2) * 3 + 1];
            float z2 = xyz2[(i * m + j2) * 3 + 2];

            // Calculate gradient magnitude
            float g = grad_dist1[i * n + j] * 2;

            // Update gradients for xyz1 using atomic addition
            atomicAdd(&grad_xyz1[(i * n + j) * 3 + 0], g * (x1 - x2));
            atomicAdd(&grad_xyz1[(i * n + j) * 3 + 1], g * (y1 - y2));
            atomicAdd(&grad_xyz1[(i * n + j) * 3 + 2], g * (z1 - z2));

            // Update gradients for xyz2 using atomic addition
            atomicAdd(&grad_xyz2[(i * m + j2) * 3 + 0], -(g * (x1 - x2)));
            atomicAdd(&grad_xyz2[(i * m + j2) * 3 + 1], -(g * (y1 - y2)));
            atomicAdd(&grad_xyz2[(i * m + j2) * 3 + 2], -(g * (z1 - z2)));
        }
    }
}