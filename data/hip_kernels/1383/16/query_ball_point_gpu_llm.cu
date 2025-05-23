#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void query_ball_point_gpu(int b, int n, int m, float radius, int nsample, const float *xyz1, const float *xyz2, int *idx) {
    int index = threadIdx.x + blockIdx.x * blockDim.x; // Use thread and block index for proper parallelization
    if (index >= b) return; // Ensure index doesn't exceed bounds

    xyz1 += n * 3 * index;
    xyz2 += m * 3 * index;
    idx += m * nsample * index;

    for (int j = 0; j < m; ++j) {
        int cnt = 0;
        float x2 = xyz2[j * 3 + 0];
        float y2 = xyz2[j * 3 + 1];
        float z2 = xyz2[j * 3 + 2];

        for (int k = 0; k < n; ++k) {
            if (cnt == nsample) break; // only pick the FIRST nsample points in the ball

            float x1 = xyz1[k * 3 + 0];
            float y1 = xyz1[k * 3 + 1];
            float z1 = xyz1[k * 3 + 2];
            float d = sqrtf((x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1) + (z2 - z1) * (z2 - z1));
            if (d < radius) {
                if (cnt == 0) { // set ALL indices to k, for valid (repeating) indices
                    for (int l = 0; l < nsample; ++l)
                        idx[j * nsample + l] = k;
                }
                idx[j * nsample + cnt] = k;
                cnt += 1;
            }
        }
    }
}