#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sd_t_s1_6_kernel(int h1d, int h2d, int h3d, int p4d, int p5d, int p6d, 
                                 int p4ld_t2, int h1ld_t2, int h3ld_v2, int h2ld_v2, 
                                 int p6ld_v2, int p5ld_v2, int h3ld_t3, int h2ld_t3, 
                                 int h1ld_t3, int p6ld_t3, int p5ld_t3, int p4ld_t3, 
                                 double *t3d, double *t2_d, double *v2_d, int p4, int total_x) {
    int h1, h2, h3, p6, p5;
    __shared__ double t2_shm[T1 * 2 * Tcomm];

    // Load data into shared memory efficiently using coalesced memory access
    int idx = threadIdx.x;
    while (idx < h1d * p4d) {
        t2_shm[idx] = t2_d[idx];
        idx += blockDim.x;
    }
    __syncthreads();

    // Calculate thread-specific indices for processing
    int rest_x = blockIdx.x;
    int thread_x = T2 * T1 * rest_x + threadIdx.x;
    rest_x = thread_x;

    // Begin loop for computation, optimizing with coalesced memory access
    for (int i = 0; i < total_x; i += gridDim.x * blockDim.x) {
        rest_x += i;
        h3 = rest_x % h3d;
        rest_x /= h3d;
        h2 = rest_x % h2d;
        rest_x /= h2d;
        p6 = rest_x % p6d;
        rest_x /= p6d;
        p5 = rest_x % p5d;

        if ((thread_x + i) < total_x) {
            for (h1 = 0; h1 < h1d; h1++) {
                for (p4 = 0; p4 < p4d; p4++) {
                    // Cache-aware operations to minimize latency
                    int t3_index = h3 * h3ld_t3 + h2 * h2ld_t3 + h1 * h1ld_t3 +
                                   p6 * p6ld_t3 + p5 * p5ld_t3 + p4 * p4ld_t3;
                    int t2_index = h1 * p4d + p4;
                    int v2_index = h3 * h3ld_v2 + h2 * h2ld_v2 + p6 * p6ld_v2 + p5 * p5ld_v2;
                    t3d[t3_index] -= t2_shm[t2_index] * v2_d[v2_index];
                }
            }
        }
    }
    __syncthreads();
}