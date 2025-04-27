#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void query_ball_point_gpu(int b, int n, int m, float radius, int nsample, const float *xyz1, const float *xyz2, int *idx) {
    // Use blockIdx, blockDim, and threadIdx for parallel indexing
    int bs_index = blockIdx.x; // batch size index
    int pt_index = blockIdx.y * blockDim.x + threadIdx.x; // point index for xyz2

    if (bs_index < b && pt_index < m) {
        int cnt = 0;
        float x2 = xyz2[pt_index * 3 + 0];
        float y2 = xyz2[pt_index * 3 + 1];
        float z2 = xyz2[pt_index * 3 + 2];

        for (int k = 0; k < n; ++k) {
            if (cnt == nsample) break; // Stop if nsample points are found

            float x1 = xyz1[k * 3 + 0];
            float y1 = xyz1[k * 3 + 1];
            float z1 = xyz1[k * 3 + 2];
            float d = max(sqrtf((x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1) + (z2 - z1) * (z2 - z1)), 1e-20f);

            if (d < radius) {
                if (cnt == 0) {
                    // Initialize indices to k for valid repeating indices
                    for (int l = 0; l < nsample; ++l)
                        idx[pt_index * nsample + l] = k;
                }
                idx[pt_index * nsample + cnt] = k;
                cnt += 1;
            }
        }
    }
}