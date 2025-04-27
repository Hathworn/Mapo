#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copy_u(const int x_inner, const int y_inner, const int halo_depth, const double* __restrict__ src, double* __restrict__ dest)
{
    // Use shared memory to optimize data access
    extern __shared__ double shared_src[];
    
    const int gid = threadIdx.x + blockIdx.x * blockDim.x;
    const int x = x_inner + 2 * halo_depth;
    
    if (gid < x_inner * y_inner) {
        const int col = gid % x_inner;
        const int row = gid / x_inner;
        const int off0 = halo_depth * (x + 1);
        const int index = off0 + col + row * x;

        // Load data into shared memory
        shared_src[threadIdx.x] = src[index];
        __syncthreads();

        // Write data from shared memory to destination
        dest[index] = shared_src[threadIdx.x];
    }
}