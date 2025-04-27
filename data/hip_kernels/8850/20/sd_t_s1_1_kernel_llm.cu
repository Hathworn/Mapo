#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sd_t_s1_1_kernel(int h1d, int h2d, int h3d, int p4d, int p6d, int p4ld_t2, int h1ld_t2, int h3ld_v2, int h2ld_v2, int p6ld_v2, int h3ld_t3, int h2ld_t3, int h1ld_t3, int p6ld_t3, int p4ld_t3, double *t2_d, double *v2_d, int p4, int total_x, double* t3d) {
    int h1, h2, h3, p6;
    __shared__ double t2_shm[T1 * 2 * Tcomm];

    // Efficient global memory to shared memory transfer
    for (int i = threadIdx.x; i < h1d * p4d; i += blockDim.x) {
        t2_shm[i] = t2_d[i];
    }
    
    __syncthreads(); // Ensure shared memory is fully populated

    int thread_x = T2 * T1 * blockIdx.x + threadIdx.x;
    int numThreads = gridDim.x * blockDim.x;
    
    // Loop unrolled over potential threads
    for (int i = thread_x; i < total_x; i += numThreads) {
        int rest_x = i;
        h3 = rest_x % h3d;
        rest_x /= h3d;
        h2 = rest_x % h2d;
        rest_x /= h2d;
        p6 = rest_x % p6d;

        // Perform computation directly with the correct index
        for (h1 = 0; h1 < h1d; h1++) {
            for (p4 = 0; p4 < p4d; p4++) {
                t3d[h3 * h3ld_t3 + h2 * h2ld_t3 + h1 * h1ld_t3 + p6 * p6ld_t3 + p4 * p4ld_t3] += 
                    t2_shm[h1 * p4d + p4] * v2_d[h3 * h3ld_v2 + h2 * h2ld_v2 + p6 * p6ld_v2];
            }
        }
    }
}