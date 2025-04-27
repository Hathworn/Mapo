#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void query_ball_point_gpu(int b, int n, int m, float radius, int nsample, const float *xyz1, const float *xyz2, int *idx) {
    // Thread indices for batch and points
    int batchIdx = blockIdx.x; // Assign each block to handle a batch
    int pointIdx = threadIdx.x; // Each thread handles a different point in the batch

    if (batchIdx < b && pointIdx < m) {
        const float *current_xyz1 = xyz1 + batchIdx * n * 3;
        const float *current_xyz2 = xyz2 + batchIdx * m * 3;
        int *current_idx = idx + batchIdx * m * nsample;
        
        float x2 = current_xyz2[pointIdx * 3 + 0];
        float y2 = current_xyz2[pointIdx * 3 + 1];
        float z2 = current_xyz2[pointIdx * 3 + 2];

        int cnt = 0;
        for (int k = 0; k < n; ++k) {
            if (cnt == nsample)
                break; // Break if nsample points are already selected

            float x1 = current_xyz1[k * 3 + 0];
            float y1 = current_xyz1[k * 3 + 1];
            float z1 = current_xyz1[k * 3 + 2];
            float d = max(sqrtf((x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1) + (z2 - z1) * (z2 - z1)), 1e-20f);
            
            if (d < radius) {
                if (cnt == 0) {
                    for (int l = 0; l < nsample; ++l)
                        current_idx[pointIdx * nsample + l] = k; // Fill all with the first valid point
                }
                current_idx[pointIdx * nsample + cnt] = k;
                cnt += 1;
            }
        }
    }
}