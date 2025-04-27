#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void query_ball_point_gpu(int b, int n, int m, float radius, int nsample, const float *xyz1, const float *xyz2, int *idx) {
  // Get the block and thread index
  int batch_idx = blockIdx.x;
  int point_idx = blockIdx.y * blockDim.x + threadIdx.x;

  // Ensure within bounds
  if (batch_idx < b && point_idx < m) {
    float x2 = xyz2[point_idx * 3 + 0];
    float y2 = xyz2[point_idx * 3 + 1];
    float z2 = xyz2[point_idx * 3 + 2];
    int cnt = 0;
    for (int k=0; k<n; ++k) {
      if (cnt == nsample) break; // only pick the FIRST nsample points in the ball
      float x1 = xyz1[k * 3 + 0];
      float y1 = xyz1[k * 3 + 1];
      float z1 = xyz1[k * 3 + 2];
      float d = max(sqrtf((x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1) + (z2 - z1) * (z2 - z1)), 1e-20f);
      if (d < radius) {
        if (cnt == 0) {
          // set ALL indices to k, to ensure we have valid (repeating) indices
          for (int l = 0; l < nsample; ++l)
            idx[point_idx * nsample + l] = k;
        }
        idx[point_idx * nsample + cnt] = k;
        cnt += 1;
      }
    }
  }
}