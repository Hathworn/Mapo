```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sd_t_s1_8_kernel(int h1d, int h2d, int h3d, int p4d, int p6d, int p4ld_t2, int h1ld_t2, int h3ld_v2, int h2ld_v2, int p6ld_v2, int h3ld_t3, int h2ld_t3, int h1ld_t3, int p6ld_t3, int p4ld_t3, double *t3d, double *t2_d, double *v2_d, int p4, int total_x) {
    int h1, h2, h3, p6;
    __shared__ double t2_shm[T1*2*Tcomm];

    // Load t2_d into shared memory
    for (int i = threadIdx.x; i < h1d * p4d; i += blockDim.x) {
        if (i < h1d * p4d)
            t2_shm[i] = t2_d[i];
    }
    __syncthreads();

    int thread_x = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Loop across work, handle thread offset
    for (int rest_x = thread_x; rest_x < total_x; rest_x += stride) {
        int tmp = rest_x;
        h3 = tmp % h3d;
        tmp /= h3d;
        h2 = tmp % h2d;
        tmp /= h2d;
        p6 = tmp % p6d;

        // Compute t3d by utilizing t2_shm (in shared memory) and v2_d
        for (h1 = 0; h1 < h1d; h1++) {
            for (int local_p4 = 0; local_p4 < p4d; local_p4++) { // Renamed loop variable to avoid name conflict
                t3d[h3 * h3ld_t3 + h2 * h2ld_t3 + h1 * h1ld_t3 + p6 * p6ld_t3 + local_p4 * p4ld_t3] -= 
                    t2_shm[h1 * p4d + local_p4] * 
                    v2_d[h3 * h3ld_v2 + h2 * h2ld_v2 + p6 * p6ld_v2];
            }
        }
    }
    __syncthreads();
}