#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void NmDistanceGradKernel(int b, int n, const float *xyz1, int m, const float *xyz2, const float *grad_dist1, const int *idx1, float *grad_xyz1, float *grad_xyz2) {
  // Calculate batch and point indices
  int batch = blockIdx.x;
  int point = threadIdx.x + blockIdx.y * blockDim.x;

  // Ensure thread within bounds
  if (batch < b && point < n) {
    float x1 = xyz1[(batch * n + point) * 3 + 0];
    float y1 = xyz1[(batch * n + point) * 3 + 1];
    float z1 = xyz1[(batch * n + point) * 3 + 2];
    int j2 = idx1[batch * n + point];
    float x2 = xyz2[(batch * m + j2) * 3 + 0];
    float y2 = xyz2[(batch * m + j2) * 3 + 1];
    float z2 = xyz2[(batch * m + j2) * 3 + 2];
    float g = grad_dist1[batch * n + point] * 2;

    // Use atomicAdd for thread safety
    atomicAdd(&(grad_xyz1[(batch * n + point) * 3 + 0]), g * (x1 - x2));
    atomicAdd(&(grad_xyz1[(batch * n + point) * 3 + 1]), g * (y1 - y2));
    atomicAdd(&(grad_xyz1[(batch * n + point) * 3 + 2]), g * (z1 - z2));
    atomicAdd(&(grad_xyz2[(batch * m + j2) * 3 + 0]), -(g * (x1 - x2)));
    atomicAdd(&(grad_xyz2[(batch * m + j2) * 3 + 1]), -(g * (y1 - y2)));
    atomicAdd(&(grad_xyz2[(batch * m + j2) * 3 + 2]), -(g * (z1 - z2)));
  }
}