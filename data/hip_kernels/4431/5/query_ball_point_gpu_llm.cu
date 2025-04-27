#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void query_ball_point_gpu(int b, int n, int m, float radius, int nsample, const float *xyz1, const float *xyz2, int *idx, int *pts_cnt) {
    int batch_index = blockIdx.x;
    xyz1 += n * 3 * batch_index;
    xyz2 += m * 3 * batch_index;
    idx += m * nsample * batch_index;
    pts_cnt += m * batch_index;

    int index = threadIdx.x + blockIdx.x * blockDim.x;
    if (index >= m) return;  // Exit if thread index exceeds m

    float x2 = xyz2[index * 3 + 0];
    float y2 = xyz2[index * 3 + 1];
    float z2 = xyz2[index * 3 + 2];

    int cnt = 0;
    for (int k = 0; k < n; ++k) {
        if (cnt == nsample) break;
        
        float x1 = xyz1[k * 3 + 0];
        float y1 = xyz1[k * 3 + 1];
        float z1 = xyz1[k * 3 + 2];
        float d = sqrtf((x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1) + (z2 - z1) * (z2 - z1));
        
        if (d < radius) {
            if (cnt == 0) {
                for (int l = 0; l < nsample; ++l)
                    idx[index * nsample + l] = k; // Initialize all indices to k
            }
            idx[index * nsample + cnt] = k;
            cnt += 1;
        }
    }
    pts_cnt[index] = cnt;
}