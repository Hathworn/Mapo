```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void pw_copy_cr_cu_z(const double *zin, double *dout, const int n) {
    // Use shared memory for better memory coalescing
    extern __shared__ double sharedMem[];

    const int igpt = (gridDim.x * blockIdx.y + blockIdx.x) * blockDim.x + threadIdx.x;

    if (igpt < n) {
        // Load data into shared memory
        sharedMem[threadIdx.x] = zin[2 * igpt];
        __syncthreads();
        
        // Write back to global memory
        dout[igpt] = sharedMem[threadIdx.x];
    }
}