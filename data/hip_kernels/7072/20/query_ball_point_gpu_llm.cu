```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void query_ball_point_gpu(int b, int n, int m, float radius, int nsample, const float *xyz1, const float *xyz2, int *idx) {
    int batch_idx = blockIdx.x;
    int thread_idx = threadIdx.x;
    int stride = blockDim.x;

    xyz1 += n * 3 * batch_idx;
    xyz2 += m * 3 * batch_idx;
    idx += m * nsample * batch_idx;

    for (int j = thread_idx; j < m; j += stride) {  // Parallel loop over m
        int cnt = 0;
        
        float x2 = xyz2[j * 3 + 0];
        float y2 = xyz2[j * 3 + 1];
        float z2 = xyz2[j * 3 + 2];

        for (int k = 0; k < n; ++k) {
            if (cnt == nsample) break;

            float x1 = xyz1[k * 3 + 0];
            float y1 = xyz1[k * 3 + 1];
            float z1 = xyz1[k * 3 + 2];
            float d = sqrtf((x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1) + (z2 - z1) * (z2 - z1));

            if (d < radius) {
                if (cnt == 0) {
                    for (int l = 0; l < nsample; ++l)
                        idx[j * nsample + l] = k;
                }
                idx[j * nsample + cnt] = k;
                cnt += 1;
            }
        }
    }
}