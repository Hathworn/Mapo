#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sum3(double *d_result, double *d_a, double *d_b, double *d_c, int dSize) {
    // Use shared memory to optimize data access
    extern __shared__ double shared_mem[];
    double *s_a = &shared_mem[0];
    double *s_b = &shared_mem[blockDim.x];
    double *s_c = &shared_mem[2 * blockDim.x];

    int tid = threadIdx.x + blockIdx.x * blockDim.x;

    // Load data into shared memory
    if (tid < dSize) {
        s_a[threadIdx.x] = d_a[tid];
        s_b[threadIdx.x] = d_b[tid];
        s_c[threadIdx.x] = d_c[tid];
    }

    __syncthreads(); // Ensure all loads are complete

    // Compute sum using shared memory
    if (tid < dSize) {
        d_result[tid] = s_a[threadIdx.x] + s_b[threadIdx.x] + s_c[threadIdx.x];
    }
}