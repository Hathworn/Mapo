#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void query_ball_point_gpu(int b, int n, int m, float radius, int nsample, const float *xyz1, const float *xyz2, int *idx, int *pts_cnt) {
    // Calculate batch offset
    int batch_index = blockIdx.x;
    xyz1 += n * 3 * batch_index;
    xyz2 += m * 3 * batch_index;
    idx += m * nsample * batch_index;
    pts_cnt += m * batch_index; // Count how many unique points selected in local region

    // Calculate thread-specific index and stride for loop parallelism
    int index = threadIdx.x;
    int stride = blockDim.x;

    for (int j = index; j < m; j += stride) {
        int cnt = 0;
        float x2 = xyz2[j * 3 + 0];
        float y2 = xyz2[j * 3 + 1];
        float z2 = xyz2[j * 3 + 2];

        // Loop over all points within range
        for (int k = 0; k < n; ++k) {
            if (cnt == nsample) break; // Only pick the FIRST nsample points in the ball
            float x1 = xyz1[k * 3 + 0];
            float y1 = xyz1[k * 3 + 1];
            float z1 = xyz1[k * 3 + 2];
            float dist2 = (x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1) + (z2 - z1) * (z2 - z1);
            if (dist2 < radius * radius) {  // Use squared distance to avoid sqrt
                if (cnt == 0) { // Set ALL indices to k; if fewer points in ball than nsample, ensure valid (repeating) indices
                    for (int l = 0; l < nsample; ++l)
                        idx[j * nsample + l] = k;
                }
                idx[j * nsample + cnt] = k;
                cnt += 1;
            }
        }
        pts_cnt[j] = cnt;
    }
}