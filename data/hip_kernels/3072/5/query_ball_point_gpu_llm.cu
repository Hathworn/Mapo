#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void query_ball_point_gpu(int b, int n, int m, float radius, int nsample, const float *xyz1, const float *xyz2, int *idx, int *pts_cnt) {
    int batch_index = blockIdx.x;
    xyz1 += n * 3 * batch_index;
    xyz2 += m * 3 * batch_index;
    idx += m * nsample * batch_index;
    pts_cnt += m * batch_index;

    int index = threadIdx.x;
    int stride = blockDim.x;

    // Initialize shared memory for xyz2 and idx
    __shared__ float shared_xyz2[1024 * 3]; // Assuming maximum 1024 threads per block
    __shared__ int shared_idx[1024 * nsample];

    // Load xyz2 into shared memory
    if (index < m) {
        shared_xyz2[index * 3 + 0] = xyz2[index * 3 + 0];
        shared_xyz2[index * 3 + 1] = xyz2[index * 3 + 1];
        shared_xyz2[index * 3 + 2] = xyz2[index * 3 + 2];
    }
    __syncthreads(); // Ensure all threads have loaded xyz2

    for (int j = index; j < m; j += stride) {
        float x2 = shared_xyz2[j * 3 + 0];
        float y2 = shared_xyz2[j * 3 + 1];
        float z2 = shared_xyz2[j * 3 + 2];

        float nearest_d = 1.0e99;
        int nearest_k = -1;
        int cnt = 0;

        for (int k = 0; k < n; ++k) {
            float x1 = xyz1[k * 3 + 0];
            float y1 = xyz1[k * 3 + 1];
            float z1 = xyz1[k * 3 + 2];
            float d = max(sqrtf((x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1) + (z2 - z1) * (z2 - z1)), 1e-20f);

            if (d < radius) {
                if (cnt == 0) {
                    for (int l = 0; l < nsample; ++l)
                        shared_idx[j * nsample + l] = k; // Set all indices to k
                }
                if (cnt < nsample) {
                    shared_idx[j * nsample + cnt] = k;
                    cnt++;
                }
            }
            if (d < nearest_d) {
                nearest_d = d;
                nearest_k = k;
            }
        }

        if (cnt == 0) {
            for (int l = 0; l < nsample; ++l) {
                shared_idx[j * nsample + l] = nearest_k;
            }
        }

        pts_cnt[j] = cnt;

        for (int l = 0; l < nsample; ++l) {
            idx[j * nsample + l] = shared_idx[j * nsample + l]; // Write results from shared to global memory
        }
    }
}