#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void query_ball_point_gpu(int b, int n, int m, const float *radius, int nsample, const float *xyz1, const float *xyz2, int *idx) {
    int batch_index = blockIdx.x;
    xyz1 += n * 3 * batch_index;
    xyz2 += m * 3 * batch_index;
    idx += m * nsample * batch_index;

    int j = blockDim.x * blockIdx.y + threadIdx.x;
    if (j >= m) return; // Exit if thread is out of bounds for m
    
    float x2 = xyz2[j * 3 + 0];
    float y2 = xyz2[j * 3 + 1];
    float z2 = xyz2[j * 3 + 2];
    int cnt = 0;

    for (int k = 0; k < n; ++k) {
        if (cnt == nsample) break; // Only pick the FIRST nsample points in the ball
        float x1 = xyz1[k * 3 + 0];
        float y1 = xyz1[k * 3 + 1];
        float z1 = xyz1[k * 3 + 2];
        float dx = x2 - x1;
        float dy = y2 - y1;
        float dz = z2 - z1;
        float d = sqrtf(dx * dx + dy * dy + dz * dz);

        if (d < radius[0]) {
            if (cnt == 0) { // Initialize indices to k
                for (int l = 0; l < nsample; ++l) {
                    idx[j * nsample + l] = k;
                }
            }
            idx[j * nsample + cnt] = k;
            cnt += 1;
        }
    }
}