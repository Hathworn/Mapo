#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sd_t_s1_7_kernel(size_t h1d,size_t h2d,size_t h3d,size_t p4d,size_t p6d,size_t p4ld_t2,size_t h1ld_t2,size_t h3ld_v2,size_t h2ld_v2,size_t p6ld_v2,size_t h3ld_t3,size_t h2ld_t3,size_t h1ld_t3,size_t p6ld_t3,size_t p4ld_t3,double *t3d, double *t2_d, double *v2_d,size_t p4, size_t total_x) {
    size_t h1, h2, h3, p6;
    __shared__ double t2_shm[T1 * 4 * Tcomm];

    // Efficient block-wide memory copy to shared memory
    for (size_t i = threadIdx.x; i < h1d * p4d; i += blockDim.x) {
        if (i < h1d * p4d) {
            t2_shm[i] = t2_d[i];
        }
    }
    __syncthreads();

    size_t rest_x = blockIdx.x;
    size_t thread_x = T2 * T1 * rest_x + threadIdx.x;

    for (size_t i = thread_x; i < total_x; i += gridDim.x * blockDim.x) {
        size_t ix = i;  // Use local copy of loop index

        // Unrolled compound assignments for rest_x decomposition
        h3 = ix % h3d; ix /= h3d;
        h2 = ix % h2d; ix /= h2d;
        p6 = ix % p6d;

        for (h1 = 0; h1 < h1d; ++h1) {
            for (p4 = 0; p4 < p4d; ++p4) {
                // Optimize by using registers for frequently accessed indexes
                double t2_val = t2_shm[h1 * p4d + p4];
                double v2_val = v2_d[h3 * h3ld_v2 + h2 * h2ld_v2 + p6 * p6ld_v2];
                
                // Accumulate results into global memory
                atomicAdd(&t3d[h3 * h3ld_t3 + h2 * h2ld_t3 + h1 * h1ld_t3 + p6 * p6ld_t3 + p4 * p4ld_t3], 
                          t2_val * v2_val);
            }
        }
    }
}
```
