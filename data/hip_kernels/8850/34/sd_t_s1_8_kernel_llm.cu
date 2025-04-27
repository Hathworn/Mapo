#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sd_t_s1_8_kernel(int h1d, int h2d, int h3d, int p4d, int p6d, int p4ld_t2, int h1ld_t2, int h3ld_v2, int h2ld_v2, int p6ld_v2, int h3ld_t3, int h2ld_t3, int h1ld_t3, int p6ld_t3, int p4ld_t3, double *t3d, double *t2_d, double *v2_d, int p4, int total_x) {
  int h1, h2, h3, p6;
  __shared__ double t2_shm[T1 * 2 * Tcomm];

  // Use a loop enclosing conditional to prevent unnecessary extra operations
  for (int i = threadIdx.x; i < h1d * p4d; i += blockDim.x) {
    t2_shm[i] = t2_d[i];
  }
  __syncthreads();
  
  // Optimize the division and modulus with simpler operations
  int rest_x = blockIdx.x;
  int thread_x = T2 * T1 * rest_x + threadIdx.x;
  
  // Move the computation into loop avoiding extraneous calculation
  for (int i = thread_x; i < total_x; i += gridDim.x * blockDim.x) {
    int temp_x = i;
    h3 = temp_x % h3d; temp_x /= h3d;
    h2 = temp_x % h2d; temp_x /= h2d;
    p6 = temp_x % p6d;

    if ((thread_x + i) < total_x) {
      for (h1 = 0; h1 < h1d; h1++) {
        for (p4 = 0; p4 < p4d; p4++) {
          // Reduce the number of memory accesses by calculating indices once
          int idx_t3 = h3 * h3ld_t3 + h2 * h2ld_t3 + h1 * h1ld_t3 + p6 * p6ld_t3 + p4 * p4ld_t3;
          int idx_t2 = h1 * p4d + p4;
          int idx_v2 = h3 * h3ld_v2 + h2 * h2ld_v2 + p6 * p6ld_v2;
          t3d[idx_t3] -= t2_shm[idx_t2] * v2_d[idx_v2];
        }
      }
    }
  }
  __syncthreads();
}