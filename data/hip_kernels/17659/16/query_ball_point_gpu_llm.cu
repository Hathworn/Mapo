#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void query_ball_point_gpu(int b, int n, int m, float radius, int nsample, const float *xyz1, const float *xyz2, int *idx) {
    int index = blockIdx.x * blockDim.x + threadIdx.x; // Use global index for parallel execution
    if (index >= b) return; // Exit if index exceeds bounds

    xyz1 += n * 3 * index;
    xyz2 += m * 3 * index;
    idx += m * nsample * index;

    for (int j = 0; j < m; ++j) {
        int cnt = 0;
        float x2 = xyz2[j * 3 + 0];
        float y2 = xyz2[j * 3 + 1];
        float z2 = xyz2[j * 3 + 2];

        for (int k = 0; k < n; ++k) {
            if (cnt == nsample) break; // Break if nsample points are found

            float x1 = xyz1[k * 3 + 0];
            float y1 = xyz1[k * 3 + 1];
            float z1 = xyz1[k * 3 + 2];
            float dx = x2 - x1;
            float dy = y2 - y1;
            float dz = z2 - z1; // Calculate differences
            float d = sqrtf(dx * dx + dy * dy + dz * dz);

            if (d < radius) {
                if (cnt == 0) {
                    for (int l = 0; l < nsample; ++l) {
                        idx[j * nsample + l] = k; // Initialize all indices
                    }
                }
                idx[j * nsample + cnt] = k; // Assign index
                cnt += 1;
            }
        }
    }
}