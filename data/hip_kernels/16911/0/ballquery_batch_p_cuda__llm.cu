#include "hip/hip_runtime.h"
#include "includes.h"

/* ================================== ballquery_batch_p ================================== */

__global__ void ballquery_batch_p_cuda_(int n, int meanActive, float radius, const float *xyz, const int *batch_idxs, const int *batch_offsets, int *idx, int *start_len, int *cumsum) {
    int pt_idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (pt_idx >= n) return;

    start_len += (pt_idx * 2);
    int idx_temp[1000];

    float radius2 = radius * radius;
    float o_x = xyz[pt_idx * 3 + 0];
    float o_y = xyz[pt_idx * 3 + 1];
    float o_z = xyz[pt_idx * 3 + 2];

    int batch_idx = batch_idxs[pt_idx];
    int start = batch_offsets[batch_idx];
    int end = batch_offsets[batch_idx + 1];

    int cnt = 0;

    // Optimize: Use shared memory to cache xyz data for better memory access pattern
    extern __shared__ float shared_xyz[];
    for(int k = start + threadIdx.x; k < end; k += blockDim.x) {
        shared_xyz[threadIdx.x * 3 + 0] = xyz[k * 3 + 0];
        shared_xyz[threadIdx.x * 3 + 1] = xyz[k * 3 + 1];
        shared_xyz[threadIdx.x * 3 + 2] = xyz[k * 3 + 2];
        __syncthreads();

        for(int j = 0; j < blockDim.x && (start + j) < end; ++j) {
            float x = shared_xyz[j * 3 + 0];
            float y = shared_xyz[j * 3 + 1];
            float z = shared_xyz[j * 3 + 2];
            float d2 = (o_x - x) * (o_x - x) + (o_y - y) * (o_y - y) + (o_z - z) * (o_z - z);
            if(d2 < radius2) {
                if(cnt < 1000) {
                    idx_temp[cnt] = start + j;
                }
                else{
                    break;
                }
                ++cnt;
            }
        }
        __syncthreads();
    }

    start_len[0] = atomicAdd(cumsum, cnt);
    start_len[1] = cnt;

    int thre = n * meanActive;
    if(start_len[0] >= thre) return;

    idx += start_len[0];
    if(start_len[0] + cnt >= thre) cnt = thre - start_len[0];

    for(int k = 0; k < cnt; k++) {
        idx[k] = idx_temp[k];
    }
}