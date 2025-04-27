#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void query_ball_point_gpu(int b, int n, int m, const float *radius, int nsample, const float *xyz1, const float *xyz2, int *idx, int *pts_cnt) {
    int batch_index = blockIdx.x;
    xyz1 += n * 3 * batch_index;
    xyz2 += m * 3 * batch_index;
    idx += m * nsample * batch_index;
    pts_cnt += m * batch_index;

    int index = threadIdx.x;
    int stride = blockDim.x;
    
    // Pre-compute radius square for comparison
    float r2 = radius[0] * radius[0];

    for (int j = index; j < m; j += stride) {
        float x2 = xyz2[j * 3 + 0];
        float y2 = xyz2[j * 3 + 1];
        float z2 = xyz2[j * 3 + 2];
        int cnt = 0;
        
        for (int k = 0; k < n && cnt < nsample; ++k) {
            float x1 = xyz1[k * 3 + 0];
            float y1 = xyz1[k * 3 + 1];
            float z1 = xyz1[k * 3 + 2];
            
            // Calculate distance squared and compare with pre-computed radius squared
            float d2 = (x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1) + (z2 - z1) * (z2 - z1);
            
            if (d2 < r2) {
                if (cnt == 0) {
                    int nsample3 = nsample * j;
                    for (int l = 0; l < nsample; ++l)
                        idx[nsample3 + l] = k;
                }
                idx[j * nsample + cnt] = k;
                cnt += 1;
            }
        }
        
        pts_cnt[j] = cnt;
    }
}