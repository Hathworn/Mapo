#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void query_ball_point_gpu(int b, int n, int m, float radius, int nsample, const float *xyz1, const float *xyz2, int *idx, int *pts_cnt) {
    int batch_index = blockIdx.x;
    xyz1 += n * 3 * batch_index;
    xyz2 += m * 3 * batch_index;
    idx += m * nsample * batch_index;
    pts_cnt += m * batch_index;

    int index = threadIdx.x;
    int stride = blockDim.x;

    for (int j = index; j < m; j += stride) {
        int cnt = 0;
        float x2 = xyz2[j * 3 + 0]; // Move these variable definitions out of the loop for optimization
        float y2 = xyz2[j * 3 + 1];
        float z2 = xyz2[j * 3 + 2];

        for (int k = 0; k < n && cnt < nsample; ++k) { // Combine loop condition with break
            float x1 = xyz1[k * 3 + 0];
            float y1 = xyz1[k * 3 + 1];
            float z1 = xyz1[k * 3 + 2];

            float distX = x2 - x1;
            float distY = y2 - y1;
            float distZ = z2 - z1;
            float d = sqrtf(distX * distX + distY * distY + distZ * distZ);

            if (d < radius) {
                if (cnt == 0) {
                    for (int l = 0; l < nsample; ++l) {
                        idx[j * nsample + l] = k;
                    }
                }
                idx[j * nsample + cnt] = k;
                cnt++;
            }
        }
        pts_cnt[j] = cnt;
    }
}