#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void query_ball_point_gpu(int b, int n, int m, const float *radius, int nsample, const float *xyz1, const float *xyz2, int *idx) {
    int batchIdx = blockIdx.x; // Use blockIdx for batch processing
    int threadIdxInBlock = threadIdx.x;

    xyz1 += n * 3 * batchIdx; // Fix batch offset for input point set
    xyz2 += m * 3 * batchIdx; // Fix batch offset for query point set
    idx += m * nsample * batchIdx; // Fix batch offset for indices

    for (int j = threadIdxInBlock; j < m; j += blockDim.x) { // Use all threads for processing m query points in parallel
        int cnt = 0;
        float x2 = xyz2[j * 3 + 0];
        float y2 = xyz2[j * 3 + 1];
        float z2 = xyz2[j * 3 + 2];

        for (int k = 0; k < n && cnt < nsample; ++k) { // Combine loop condition to reduce checks
            float x1 = xyz1[k * 3 + 0];
            float y1 = xyz1[k * 3 + 1];
            float z1 = xyz1[k * 3 + 2];
            float d = sqrtf((x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1) + (z2 - z1) * (z2 - z1));

            if (d < radius[0]) {
                if (cnt == 0) {
                    for (int l = 0; l < nsample; ++l)
                        idx[j * nsample + l] = k; // Fill with initial indices
                }
                idx[j * nsample + cnt] = k;
                cnt++;
            }
        }
    }
}