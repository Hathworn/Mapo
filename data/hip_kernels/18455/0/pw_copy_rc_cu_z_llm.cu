#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void pw_copy_rc_cu_z(const double *din, double *zout, const int n) {
    // Optimize loop with shared memory and avoid bank conflicts
    extern __shared__ double shared[];
    const int igpt =
    (gridDim.x * blockIdx.y + blockIdx.x) * blockDim.x + threadIdx.x;

    if (igpt < n) {
        shared[threadIdx.x] = din[igpt]; // Load data into shared memory
        __syncthreads(); // Synchronize threads
        const int offset = 2 * igpt;
        zout[offset] = shared[threadIdx.x]; // Write into global memory
        zout[offset + 1] = 0.0e0;
    }
}