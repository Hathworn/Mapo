#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void jacobi_copy_u(const int x_inner, const int y_inner, const double* __restrict__ src, double* __restrict__ dest)
{
    const int gid = threadIdx.x + blockIdx.x * blockDim.x;

    // Unroll loop for better memory coalescing
    if (gid < x_inner * y_inner) {
        #pragma unroll
        for (int i = gid; i < x_inner * y_inner; i += blockDim.x * gridDim.x) {
            dest[i] = src[i];
        }
    }
}