#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sd_t_s1_8_kernel(int h1d, int h2d, int h3d, int p4d, int p6d, int p4ld_t2, int h1ld_t2, int h3ld_v2, int h2ld_v2, int p6ld_v2, int h3ld_t3, int h2ld_t3, int h1ld_t3, int p6ld_t3, int p4ld_t3, double *t3d, double *t2_d, double *v2_d, int p4, int total_x) {
  int h1, h2, h3, p6;
  __shared__ double t2_shm[T1 * 2 * Tcomm];

  // Load t2_d into shared memory
  for (int i = threadIdx.x; i < h1d * p4d; i += blockDim.x)
    if (i < h1d * p4d)
      t2_shm[i] = t2_d[i];
  __syncthreads(); // Ensure all threads have loaded t2_d

  int rest_x = blockIdx.x * blockDim.x + threadIdx.x;
  
  // Loop to cover total_x
  for (int offset = rest_x; offset < total_x; offset += gridDim.x * blockDim.x) {
    int idx = offset;
    h3 = idx % h3d;
    idx /= h3d;
    h2 = idx % h2d;
    idx /= h2d;
    p6 = idx % p6d;

    // Compute inside the bounds of total_x
    if (offset < total_x) {
      double v2_val = v2_d[h3 * h3ld_v2 + h2 * h2ld_v2 + p6 * p6ld_v2]; // Pre-compute v2 lookup
      for (h1 = 0; h1 < h1d; h1++) {
        for (p4 = 0; p4 < p4d; p4++) {
          // Update t3d with pre-computed value
          t3d[h3 * h3ld_t3 + h2 * h2ld_t3 + h1 * h1ld_t3 + p6 * p6ld_t3 + p4 * p4ld_t3] -= t2_shm[h1 * p4d + p4] * v2_val;
        }
      }
    }
  }
  __syncthreads(); // Ensure all threads finish computation before ending kernel
}