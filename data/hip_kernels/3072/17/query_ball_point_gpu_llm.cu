#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void query_ball_point_gpu(int b, int n, int m, float radius, int nsample, const float *xyz1, const float *xyz2, int *idx) {
    // Calculate global index for each thread
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure index is within bounds
    if (index >= b) return;

    // Offset pointers based on index
    xyz1 += n * 3 * index;
    xyz2 += m * 3 * index;
    idx += m * nsample * index;

    // Iterate over each query point
    for (int j = 0; j < m; ++j) {
        int cnt = 0;
        float x2 = xyz2[j * 3 + 0];
        float y2 = xyz2[j * 3 + 1];
        float z2 = xyz2[j * 3 + 2];

        // Iterate over all points to find neighbors
        for (int k = 0; k < n; ++k) {
            if (cnt == nsample)
                break; // only pick the FIRST nsample points in the ball

            float x1 = xyz1[k * 3 + 0];
            float y1 = xyz1[k * 3 + 1];
            float z1 = xyz1[k * 3 + 2];
            float dx = x2 - x1;
            float dy = y2 - y1;
            float dz = z2 - z1;
            float d = max(sqrtf(dx * dx + dy * dy + dz * dz), 1e-20f);

            if (d < radius) {
                if (cnt == 0) { 
                    // Set ALL indices to k to ensure valid indices
                    for (int l = 0; l < nsample; ++l)
                        idx[j * nsample + l] = k;
                }
                idx[j * nsample + cnt] = k;
                cnt += 1;
            }
        }
    }
}