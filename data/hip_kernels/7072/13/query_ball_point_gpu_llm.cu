#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void query_ball_point_gpu(int b, int n, int m, float radius, int nsample, const float *xyz1, const float *xyz2, int *idx) {
    int batch_idx = blockIdx.x;
    if (batch_idx >= b) return; // Check if within batch bounds

    int point_idx = threadIdx.x + blockDim.x * blockIdx.y;
    if (point_idx >= m) return; // Check if within points bounds

    const float x2 = xyz2[point_idx * 3 + 0];
    const float y2 = xyz2[point_idx * 3 + 1];
    const float z2 = xyz2[point_idx * 3 + 2];

    int cnt = 0;
    for (int k = 0; k < n && cnt < nsample; ++k) { // Stop if nsample points are found
        const float x1 = xyz1[k * 3 + 0];
        const float y1 = xyz1[k * 3 + 1];
        const float z1 = xyz1[k * 3 + 2];
        const float d = max(sqrtf((x2-x1)*(x2-x1) + (y2-y1)*(y2-y1) + (z2-z1)*(z2-z1)), 1e-20f);

        if (d < radius) {
            if (cnt == 0) {
                for (int l = 0; l < nsample; ++l)
                    idx[point_idx * nsample + l] = k; // Initialize all indices
            }
            idx[point_idx * nsample + cnt] = k;
            cnt += 1;
        }
    }
}
```
