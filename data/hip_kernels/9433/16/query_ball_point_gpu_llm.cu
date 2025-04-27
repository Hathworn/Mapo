#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void query_ball_point_gpu(int b, int n, int m, float radius, int nsample, const float *xyz1, const float *xyz2, int *idx) {
    int batch_index = blockIdx.x;
    int index = threadIdx.x;
    int stride = blockDim.x;
    xyz1 += n * 3 * batch_index;
    xyz2 += m * 3 * batch_index;
    idx += m * nsample * batch_index;
    
    // Use shared memory for frequently accessed data
    extern __shared__ float shared_xyz2[];

    for (int j = index; j < m; j += stride) {
        shared_xyz2[j * 3 + 0] = xyz2[j * 3 + 0];
        shared_xyz2[j * 3 + 1] = xyz2[j * 3 + 1];
        shared_xyz2[j * 3 + 2] = xyz2[j * 3 + 2];
    }
    __syncthreads();

    for (int j = index; j < m; j += stride) {
        int cnt = 0;
        float x2 = shared_xyz2[j * 3 + 0];
        float y2 = shared_xyz2[j * 3 + 1];
        float z2 = shared_xyz2[j * 3 + 2];
        for (int k = 0; k < n; ++k) {
            if (cnt == nsample)
                break; // Early termination if nsample is reached
            
            float x1 = xyz1[k * 3 + 0];
            float y1 = xyz1[k * 3 + 1];
            float z1 = xyz1[k * 3 + 2];
            float dist_squared = (x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1) + (z2 - z1) * (z2 - z1);
            
            if (dist_squared < radius * radius) { // Compare squared distances to avoid sqrt
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