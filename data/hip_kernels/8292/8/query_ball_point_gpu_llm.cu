#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void query_ball_point_gpu(int b, int n, int m, const float* radius, int nsample, const float *xyz1, const float *xyz2, int *idx) {
    int batch_idx = blockIdx.x;
    int point_idx = threadIdx.x;
    if(batch_idx < b && point_idx < m) { // Ensure within bounds
        const float* current_xyz1 = xyz1 + batch_idx * n * 3;
        const float* current_xyz2 = xyz2 + batch_idx * m * 3;
        int* current_idx = idx + batch_idx * m * nsample;
        float x2 = current_xyz2[point_idx * 3 + 0];
        float y2 = current_xyz2[point_idx * 3 + 1];
        float z2 = current_xyz2[point_idx * 3 + 2];
        int cnt = 0;
        
        for (int k = 0; k < n && cnt < nsample; ++k) {
            float x1 = current_xyz1[k * 3 + 0];
            float y1 = current_xyz1[k * 3 + 1];
            float z1 = current_xyz1[k * 3 + 2];
            float d_sq = (x2-x1)*(x2-x1) + (y2-y1)*(y2-y1) + (z2-z1)*(z2-z1);
            if (d_sq < radius[0] * radius[0]) {
                if (cnt == 0) { // Set default indices
                    for (int l = 0; l < nsample; ++l)
                        current_idx[point_idx * nsample + l] = k;
                }
                current_idx[point_idx * nsample + cnt] = k;
                cnt++;
            }
        }
    }
}