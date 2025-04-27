#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void query_ball_point_gpu(int b, int n, int m, float radius, int nsample, const float *xyz1, const float *xyz2, int *idx) {
    int batch_index = blockIdx.x;
    xyz1 += n*3*batch_index;
    xyz2 += m*3*batch_index;
    idx += m*nsample*batch_index;

    int index = threadIdx.x;
    int stride = blockDim.x;

    float radius2 = radius * radius; // Precompute radius squared

    for (int j = index; j < m; j += stride) {
        int cnt = 0;
        float x2 = xyz2[j*3+0];
        float y2 = xyz2[j*3+1];
        float z2 = xyz2[j*3+2];

        #pragma unroll  // Unroll the loop
        for (int k = 0; k < n; ++k) {
            if (cnt == nsample)
                break;  // Stop if nsample points are found
            float x1 = xyz1[k*3+0];
            float y1 = xyz1[k*3+1];
            float z1 = xyz1[k*3+2];
            float dx = x2 - x1;
            float dy = y2 - y1;
            float dz = z2 - z1;
            float d2 = dx*dx + dy*dy + dz*dz; // Calculate squared distance

            if (d2 < radius2) { // Compare squared distance
                if (cnt == 0) { // Pre-fill indices
                    for (int l = 0; l < nsample; ++l) {
                        idx[j*nsample+l] = k;
                    }
                }
                idx[j*nsample+cnt] = k;
                cnt += 1;
            }
        }
    }
}