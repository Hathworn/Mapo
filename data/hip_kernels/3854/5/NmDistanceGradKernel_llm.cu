#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void NmDistanceGradKernel(int b, int n, const float *xyz1, int m, const float *xyz2, const float *grad_dist1, const int *idx1, float *grad_xyz1, float *grad_xyz2) {
    // Calculate block and thread indices for accessing data
    int batch_index = blockIdx.x;
    int point_index = threadIdx.x + blockIdx.y * blockDim.x;

    // Parallelize processing for all batches and points
    if (batch_index < b && point_index < n) {
        // Use registers to optimize memory access
        float x1 = xyz1[(batch_index * n + point_index) * 3 + 0];
        float y1 = xyz1[(batch_index * n + point_index) * 3 + 1];
        float z1 = xyz1[(batch_index * n + point_index) * 3 + 2];
        int j2 = idx1[batch_index * n + point_index];
        float x2 = xyz2[(batch_index * m + j2) * 3 + 0];
        float y2 = xyz2[(batch_index * m + j2) * 3 + 1];
        float z2 = xyz2[(batch_index * m + j2) * 3 + 2];
        float g = grad_dist1[batch_index * n + point_index] * 2;

        // Minimize atomic operations for faster performance
        float delta_x = g * (x1 - x2);
        float delta_y = g * (y1 - y2);
        float delta_z = g * (z1 - z2);

        atomicAdd(&(grad_xyz1[(batch_index * n + point_index) * 3 + 0]), delta_x);
        atomicAdd(&(grad_xyz1[(batch_index * n + point_index) * 3 + 1]), delta_y);
        atomicAdd(&(grad_xyz1[(batch_index * n + point_index) * 3 + 2]), delta_z);
        atomicAdd(&(grad_xyz2[(batch_index * m + j2) * 3 + 0]), -delta_x);
        atomicAdd(&(grad_xyz2[(batch_index * m + j2) * 3 + 1]), -delta_y);
        atomicAdd(&(grad_xyz2[(batch_index * m + j2) * 3 + 2]), -delta_z);
    }
}