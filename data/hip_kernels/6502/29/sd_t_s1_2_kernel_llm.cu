```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sd_t_s1_2_kernel(int h1d, int h2d, int h3d, int p4d, int p6d, int p4ld_t2, int h1ld_t2, int h3ld_v2, int h2ld_v2, int p6ld_v2, int h3ld_t3, int h2ld_t3, int h1ld_t3, int p6ld_t3, int p4ld_t3, double *t2_d, double *v2_d, int p4, int total_x, double* t3d) {
    int h1, h2, h3, p6;
    __shared__ double t2_shm[T1 * 2 * Tcomm];
    
    // Load t2_d into shared memory in a coalesced manner
    int t2_shm_index = threadIdx.x;
    while (t2_shm_index < h1d * p4d) {
        t2_shm[t2_shm_index] = t2_d[t2_shm_index];
        t2_shm_index += blockDim.x;
    }
    __syncthreads();
    
    // Calculate global thread index
    int rest_x = blockIdx.x;
    int thread_x = T2 * T1 * rest_x + threadIdx.x;
    
    // Loop over the grid to ensure all elements are processed
    for (int i = 0; i < total_x; i += gridDim.x * blockDim.x) {
        if (thread_x + i >= total_x) continue;  // Skip out-of-bound threads

        // Calculate indices h3, h2, h1, p6
        int idx = thread_x + i;
        h3 = idx % h3d;
        idx /= h3d;
        h2 = idx % h2d;
        idx /= h2d;
        p6 = idx % p6d;

        // Iterate over h1 and p4 and update t3d
        for (h1 = 0; h1 < h1d; h1++) {
            for (p4 = 0; p4 < p4d; p4++) {
                atomicSub(&t3d[h3 * h3ld_t3 + h2 * h2ld_t3 + h1 * h1ld_t3 + p6 * p6ld_t3 + p4 * p4ld_t3],
                          t2_shm[h1 * p4d + p4] * v2_d[h3 * h3ld_v2 + h2 * h2ld_v2 + p6 * p6ld_v2]);
            }
        }
    }
    __syncthreads();
}