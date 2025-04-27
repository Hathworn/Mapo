#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_set_vector_to_zero(double *d_vec, int dimension)
{
    // Calculate global thread ID
    int gid = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure gid is within bounds and set the vector element to zero
    if (gid < dimension) {
        d_vec[gid] = 0.0;
    }
}