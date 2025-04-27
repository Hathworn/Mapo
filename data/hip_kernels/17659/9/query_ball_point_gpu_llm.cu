#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void query_ball_point_gpu(int b, int n, int m, float radius, int nsample, const float *xyz1, const float *xyz2, int *idx) {
    // Use blockIdx.x for batch index (i) and blockIdx.y for the point index (j) in xyz2
    int i = blockIdx.x;
    int j = blockIdx.y;
    
    if (i < b && j < m) {
        int cnt = 0;
        float x2 = xyz2[j * 3 + 0];
        float y2 = xyz2[j * 3 + 1];
        float z2 = xyz2[j * 3 + 2];

        for (int k = 0; k < n; ++k) {
            if (cnt == nsample) break; // Stop when nsample points are collected

            float x1 = xyz1[k * 3 + 0];
            float y1 = xyz1[k * 3 + 1];
            float z1 = xyz1[k * 3 + 2];
            // Compute squared distance to avoid sqrt computation
            float d2 = (x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1) + (z2 - z1) * (z2 - z1);
            if (d2 < radius * radius) {
                if (cnt == 0) { // Initialize all indices to k
                    for (int l = 0; l < nsample; ++l) {
                        idx[j * nsample + l] = k;
                    }
                }
                idx[j * nsample + cnt] = k;
                cnt += 1;
            }
        }
    }
}