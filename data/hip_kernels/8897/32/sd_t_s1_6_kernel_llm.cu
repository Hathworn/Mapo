#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sd_t_s1_6_kernel(int h1d, int h2d, int h3d, int p4d, int p5d, int p6d, int p4ld_t2, int h1ld_t2, int h3ld_v2, int h2ld_v2, int p6ld_v2, int p5ld_v2, int h3ld_t3, int h2ld_t3, int h1ld_t3, int p6ld_t3, int p5ld_t3, int p4ld_t3, double *t3d, double *t2_d, double *v2_d, int p4, int total_x) {
    int h1, h2, h3, p6, p5;
    __shared__ double t2_shm[T1*2*Tcomm];

    // Load t2 into shared memory more efficiently
    for(int i = threadIdx.x; i < h1d * p4d; i += blockDim.x) {
        t2_shm[i] = t2_d[i];
    }
    __syncthreads();

    int rest_x = blockIdx.x * T2 * T1 + threadIdx.x; // Calculate global thread index
    int thread_x;
    
    // Eliminate unnecessary rest_x calculations by bringing them inside the loop
    for(int i = 0; i < total_x; i += gridDim.x * blockDim.x) {
        thread_x = rest_x + i; // Update thread's execution context

        if(thread_x < total_x) {
            int tmp = thread_x;
            h3 = tmp % h3d; tmp /= h3d;
            h2 = tmp % h2d; tmp /= h2d;
            p6 = tmp % p6d; tmp /= p6d;
            p5 = tmp % p5d;

            for(h1 = 0; h1 < h1d; h1++) {
                for(p4 = 0; p4 < p4d; p4++) {
                    // Access shared memory (t2_shm) and global memory (v2_d) for t3d update
                    t3d[h3 * h3ld_t3 + h2 * h2ld_t3 + h1 * h1ld_t3 + p6 * p6ld_t3 + p5 * p5ld_t3 + p4 * p4ld_t3] -=
                        t2_shm[h1 * p4d + p4] * v2_d[h3 * h3ld_v2 + h2 * h2ld_v2 + p6 * p6ld_v2 + p5 * p5ld_v2];
                }
            }
        }
    }
    __syncthreads();
}