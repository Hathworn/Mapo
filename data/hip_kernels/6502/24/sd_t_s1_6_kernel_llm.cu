#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sd_t_s1_6_kernel(size_t h1d, size_t h2d, size_t h3d, size_t p4d, size_t p5d, size_t p6d, size_t p4ld_t2, size_t h1ld_t2, size_t h3ld_v2, size_t h2ld_v2, size_t p6ld_v2, size_t p5ld_v2, size_t h3ld_t3, size_t h2ld_t3, size_t h1ld_t3, size_t p6ld_t3, size_t p5ld_t3, size_t p4ld_t3, double *t3d, double *t2_d, double *v2_d, size_t p4, size_t total_x) {
    size_t h1, h2, h3, p6, p5;
    __shared__ double t2_shm[T1 * 4 * Tcomm];

    // Load t2_d into shared memory efficiently
    for(size_t i = threadIdx.x; i < h1d * p4d; i += blockDim.x) {
        if(i < h1d * p4d)
            t2_shm[i] = t2_d[i];
    }

    size_t rest_x = blockIdx.x * blockDim.x + threadIdx.x;
    __syncthreads();  // Ensure all data is loaded before computation

    // Adjust loop to avoid exceeding total_x
    while (rest_x < total_x) {
        size_t tmp = rest_x;
        h3 = tmp % h3d; tmp /= h3d;
        h2 = tmp % h2d; tmp /= h2d;
        p6 = tmp % p6d; tmp /= p6d;
        p5 = tmp % p5d;

        for(h1 = 0; h1 < h1d; h1++) {
            for(size_t p4_idx = 0; p4_idx < p4d; p4_idx++) {
                // Use loop unrolling or other optimizations here if beneficial
                t3d[h3 * h3ld_t3 + h2 * h2ld_t3 + h1 * h1ld_t3 + p6 * p6ld_t3 + p5 * p5ld_t3 + p4_idx * p4ld_t3] -=
                    t2_shm[h1 * p4d + p4_idx] * v2_d[h3 * h3ld_v2 + h2 * h2ld_v2 + p6 * p6ld_v2 + p5 * p5ld_v2];
            }
        }
        rest_x += gridDim.x * blockDim.x;  // Move to the next batch
    }
    __syncthreads();
}