#include "hip/hip_runtime.h"
#include "includes.h"

#define BLOCK_SIZE 256  // Define a block size for better parallelization

__global__ void sd_t_s1_2_kernel(size_t h1d, size_t h2d, size_t h3d, size_t p4d, size_t p6d, 
                                 size_t p4ld_t2, size_t h1ld_t2, size_t h3ld_v2, size_t h2ld_v2, 
                                 size_t p6ld_v2, size_t h3ld_t3, size_t h2ld_t3, size_t h1ld_t3, 
                                 size_t p6ld_t3, size_t p4ld_t3, double *t2_d, double *v2_d, 
                                 size_t p4, size_t total_x, double *t3d) {
    size_t h1, h2, h3, p6;
    __shared__ double t2_shm[T1 * 4 * Tcomm];

    // Load data into shared memory
    for (size_t i = threadIdx.x; i < h1d * p4d; i += blockDim.x) {
        if (i < h1d * p4d) {
            t2_shm[i] = t2_d[i];
        }
    }
    
    __syncthreads();  // Ensure shared memory is fully populated

    size_t thread_x = blockIdx.x * blockDim.x + threadIdx.x;
    size_t stride = gridDim.x * blockDim.x;  // Stride for grid parallelism

    // Optimize loop for grid-stride approach
    for (size_t i = thread_x; i < total_x; i += stride) {
        size_t rest_x = i;
        h3 = rest_x % h3d;
        rest_x /= h3d;
        h2 = rest_x % h2d;
        rest_x /= h2d;
        p6 = rest_x % p6d;

        // Loop over h1 and p4 dimensions
        for (h1 = 0; h1 < h1d; h1++) {
            for (p4 = 0; p4 < p4d; p4++) {
                // Perform the calculation
                t3d[h3 * h3ld_t3 + h2 * h2ld_t3 + h1 * h1ld_t3 + p6 * p6ld_t3 + p4 * p4ld_t3] -=
                    t2_shm[h1 * p4d + p4] * v2_d[h3 * h3ld_v2 + h2 * h2ld_v2 + p6 * p6ld_v2];
            }
        }
    }
}