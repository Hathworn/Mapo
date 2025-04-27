#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void query_ball_point_gpu(int b, int n, int m, float radius, int nsample, const float *xyz1, const float *xyz2, int *idx) {
    // Calculate thread index
    int batch_index = blockIdx.x;
    int point_index = blockIdx.y * blockDim.x + threadIdx.x;

    if (batch_index < b && point_index < m) {
        int cnt = 0;
        float x2 = xyz2[point_index * 3 + 0];
        float y2 = xyz2[point_index * 3 + 1];
        float z2 = xyz2[point_index * 3 + 2];

        for (int k = 0; k < n && cnt < nsample; ++k) {
            float x1 = xyz1[k * 3 + 0];
            float y1 = xyz1[k * 3 + 1];
            float z1 = xyz1[k * 3 + 2];
            float d = sqrtf((x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1) + (z2 - z1) * (z2 - z1));

            if (d < radius) {
                if (cnt == 0) { 
                    // Duplicate index initialization for valid cases
                    for (int l = 0; l < nsample; ++l)
                        idx[point_index * nsample + l] = k;
                }
                idx[point_index * nsample + cnt] = k;
                cnt++;
            }
        }
    }
}