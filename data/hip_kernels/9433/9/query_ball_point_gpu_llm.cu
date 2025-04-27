#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void query_ball_point_gpu(int b, int n, int m, float radius, int nsample, const float *xyz1, const float *xyz2, int *idx) {
    int batch_id = blockIdx.x; // Assign unique ID for each batch
    int point_id = blockIdx.y * blockDim.x + threadIdx.x; // Assign unique ID for each point in xyz2 using thread index

    if (batch_id < b && point_id < m) {
        int cnt = 0;
        float x2 = xyz2[point_id * 3 + 0];
        float y2 = xyz2[point_id * 3 + 1];
        float z2 = xyz2[point_id * 3 + 2];
        
        for (int k = 0; k < n; ++k) {
            if (cnt == nsample)
                break; // only pick the FIRST nsample points in the ball

            float x1 = xyz1[k * 3 + 0];
            float y1 = xyz1[k * 3 + 1];
            float z1 = xyz1[k * 3 + 2];
            float d_sq = (x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1) + (z2 - z1) * (z2 - z1);
            
            if (d_sq < radius * radius) {
                if (cnt == 0) { // set ALL indices to k, if less points in ball than nsample, use valid indices
                    for (int l = 0; l < nsample; ++l)
                        idx[point_id * nsample + l] = k;
                }
                idx[point_id * nsample + cnt] = k;
                cnt += 1;
            }
        }
    }
}