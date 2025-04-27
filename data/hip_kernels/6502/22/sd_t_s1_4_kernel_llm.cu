#include "hip/hip_runtime.h"
#include "includes.h"

#define T1 128  // Example value for T1
#define T2 128  // Example value for T2
#define Tcomm 128  // Example value for Tcomm

__global__ void sd_t_s1_4_kernel(size_t h1d, size_t h2d, size_t h3d, size_t p4d, size_t p5d, size_t p6d, size_t p4ld_t2, size_t h1ld_t2, size_t h3ld_v2, size_t h2ld_v2, size_t p6ld_v2, size_t p5ld_v2, size_t h3ld_t3, size_t h2ld_t3, size_t h1ld_t3, size_t p6ld_t3, size_t p5ld_t3, size_t p4ld_t3, double *t3d, double *t2_d, double *v2_d, size_t p4, size_t total_x) {
    size_t h1,h2,h3,p6,p5;
    __shared__ double t2_shm[T1*4*Tcomm];

    // Load t2_d data into shared memory
    for (size_t i = threadIdx.x; i < h1d * p4d; i += blockDim.x) {
        if (i < h1d * p4d) {
            t2_shm[i] = t2_d[i];
        }
    }
    
    size_t rest_x = blockIdx.x;
    size_t thread_x = T2 * T1 * rest_x + threadIdx.x;
    rest_x = thread_x;
    __syncthreads();

    // Main loop for computation
    for (size_t i = thread_x; i < total_x; i += gridDim.x * blockDim.x) {
        rest_x = i;
        h3 = rest_x % h3d;
        rest_x /= h3d;
        h2 = rest_x % h2d;
        rest_x /= h2d;
        p6 = rest_x % p6d;
        rest_x /= p6d;
        p5 = rest_x % p5d;

        if (i < total_x) {
            for (h1 = 0; h1 < h1d; h1++) {
                for (p4 = 0; p4 < p4d; p4++) {
                    // Use indices directly for computation reduction
                    double t2_value = t2_shm[h1 * p4d + p4];
                    double v2_value = v2_d[h3 * h3ld_v2 + h2 * h2ld_v2 + p6 * p6ld_v2 + p5 * p5ld_v2];
                    t3d[h3 * h3ld_t3 + h2 * h2ld_t3 + h1 * h1ld_t3 + p6 * p6ld_t3 + p5 * p5ld_t3 + p4 * p4ld_t3] -= t2_value * v2_value;
                }
            }
        }
    }
    __syncthreads();
}