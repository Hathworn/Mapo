#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void query_ball_point_gpu(int b, int n, int m, float radius, int nsample, const float *xyz1, const float *xyz2, int *idx, int *pts_cnt) {
    int batch_index = blockIdx.x;
    xyz1 += n*3*batch_index;
    xyz2 += m*3*batch_index;
    idx += m*nsample*batch_index;
    pts_cnt += m*batch_index;

    int index = threadIdx.x; 
    int stride = blockDim.x;
    
    __shared__ float s_xyz2[1024 * 3]; // Utilize shared memory for xyz2
    
    for (int j = index; j < m; j += stride) {
        int cnt = 0;
        if(threadIdx.x < m) {
            s_xyz2[threadIdx.x * 3 + 0] = xyz2[j * 3 + 0];
            s_xyz2[threadIdx.x * 3 + 1] = xyz2[j * 3 + 1];
            s_xyz2[threadIdx.x * 3 + 2] = xyz2[j * 3 + 2];
        }
        __syncthreads(); // Synchronize shared memory load
        
        float x2 = s_xyz2[threadIdx.x * 3 + 0];
        float y2 = s_xyz2[threadIdx.x * 3 + 1];
        float z2 = s_xyz2[threadIdx.x * 3 + 2];
        
        for (int k = 0; k < n; ++k) {
            if (cnt == nsample) break;
            float x1 = xyz1[k * 3 + 0];
            float y1 = xyz1[k * 3 + 1];
            float z1 = xyz1[k * 3 + 2];
            float dx = x2 - x1;
            float dy = y2 - y1;
            float dz = z2 - z1;
            float d2 = dx * dx + dy * dy + dz * dz;
            if (d2 < radius * radius) {
                if (cnt == 0) {
                    for (int l = 0; l < nsample; ++l)
                        idx[j * nsample + l] = k;
                }
                idx[j * nsample + cnt] = k;
                cnt += 1;
            }
        }
        pts_cnt[j] = cnt;
        __syncthreads(); // Ensure completion before next iteration
    }
}