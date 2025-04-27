```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sd_t_s1_4_kernel(int h1d, int h2d, int h3d, int p4d, int p5d, int p6d, int p4ld_t2, int h1ld_t2, int h3ld_v2, int h2ld_v2, int p6ld_v2, int p5ld_v2, int h3ld_t3, int h2ld_t3, int h1ld_t3, int p6ld_t3, int p5ld_t3, int p4ld_t3, double *t3d, double *t2_d, double *v2_d, int p4, int total_x) {
    int h1, h2, h3, p6, p5;
    __shared__ double t2_shm[T1 * 2 * Tcomm];

    for (int i = threadIdx.x; i < h1d * p4d; i += blockDim.x) {
        if (i < h1d * p4d)
            t2_shm[i] = t2_d[i];
    }
    __syncthreads(); // Ensure shared memory is ready before proceeding

    int rest_x = blockIdx.x * blockDim.x + threadIdx.x;
  
    // Calculate offset only once and use stride for iteration
    const int stride = gridDim.x * blockDim.x;
    for (int thread_x = rest_x; thread_x < total_x; thread_x += stride) {
        int temp = thread_x;
        
        h3 = temp % h3d;
        temp /= h3d;
        h2 = temp % h2d;
        temp /= h2d;
        p6 = temp % p6d;
        temp /= p6d;
        p5 = temp % p5d;

        for (h1 = 0; h1 < h1d; h1++) {
            for (p4 = 0; p4 < p4d; p4++) {
                // Avoid repetitive memory access by computing offsets once
                int t2_shm_index = h1 * p4d + p4;
                int v2_d_index = h3 * h3ld_v2 + h2 * h2ld_v2 + p6 * p6ld_v2 + p5 * p5ld_v2;
                int t3d_index = h3 * h3ld_t3 + h2 * h2ld_t3 + h1 * h1ld_t3 + p6 * p6ld_t3 + p5 * p5ld_t3 + p4 * p4ld_t3;

                t3d[t3d_index] -= t2_shm[t2_shm_index] * v2_d[v2_d_index];
            }
        }
    }
    __syncthreads();
}