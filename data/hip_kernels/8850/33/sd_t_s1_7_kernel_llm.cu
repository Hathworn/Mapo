#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sd_t_s1_7_kernel(int h1d,int h2d,int h3d,int p4d,int p6d,int p4ld_t2,int h1ld_t2,int h3ld_v2,int h2ld_v2,int p6ld_v2,int h3ld_t3,int h2ld_t3,int h1ld_t3,int p6ld_t3,int p4ld_t3,double *t3d, double *t2_d, double *v2_d,int p4, int total_x) {
    int h1, h2, h3, p6;
    extern __shared__ double t2_shm[]; // Dynamic shared memory allocation

    // Load t2_d into shared memory
    for(int i = threadIdx.x; i < h1d * p4d; i += blockDim.x) {
        if(i < h1d * p4d) {
            t2_shm[i] = t2_d[i];
        }
    }
    __syncthreads();

    int thread_x = blockIdx.x * blockDim.x + threadIdx.x;

    if (thread_x < total_x) {
        // Calculate the initial indices
        int index = thread_x;
        h3 = index % h3d;
        index /= h3d;
        h2 = index % h2d;
        index /= h2d;
        p6 = index % p6d;

        // Iterate over tile group
        for(h1 = 0; h1 < h1d; h1++) {
            for(int p4_local = 0; p4_local < p4d; p4_local++) {
                atomicAdd(&t3d[h3 * h3ld_t3 + h2 * h2ld_t3 + h1 * h1ld_t3 + p6 * p6ld_t3 + p4_local * p4ld_t3], 
                          t2_shm[h1 * p4d + p4_local] * v2_d[h3 * h3ld_v2 + h2 * h2ld_v2 + p6 * p6ld_v2]);
            }
        }
    }
}