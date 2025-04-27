#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sd_t_s1_2_kernel(int h1d, int h2d, int h3d, int p4d, int p6d, int p4ld_t2, int h1ld_t2, int h3ld_v2, int h2ld_v2, int p6ld_v2, int h3ld_t3, int h2ld_t3, int h1ld_t3, int p6ld_t3, int p4ld_t3, double *t2_d, double *v2_d, int p4, int total_x, double* t3d) {
    int h1, h2, h3, p6;
    __shared__ double t2_shm[T1 * 2 * Tcomm];

    // Efficiently load t2_d into shared memory using all threads
    for (int i = threadIdx.x; i < h1d * p4d; i += blockDim.x) {
        t2_shm[i] = t2_d[i];
    }
    __syncthreads();
  
    int thread_x = blockIdx.x * blockDim.x + threadIdx.x;

    for (int base_idx = thread_x; base_idx < total_x; base_idx += gridDim.x * blockDim.x) {
        int idx = base_idx;
        
        h3 = idx % h3d;
        idx /= h3d;
        
        h2 = idx % h2d;
        idx /= h2d;
        
        p6 = idx % p6d;

        for (h1 = 0; h1 < h1d; h1++) {
            for (p4 = 0; p4 < p4d; p4++) {
                // Optimize data access by computing only required indices
                int t3d_idx = h3 * h3ld_t3 + h2 * h2ld_t3 + h1 * h1ld_t3 + p6 * p6ld_t3 + p4 * p4ld_t3;
                int t2_shm_idx = h1 * p4d + p4;
                int v2_d_idx = h3 * h3ld_v2 + h2 * h2ld_v2 + p6 * p6ld_v2;

                t3d[t3d_idx] -= t2_shm[t2_shm_idx] * v2_d[v2_d_idx];
            }
        }
    }
}