#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_set_vector_to_zero(double *d_vec, int dimension)
{
    int gid = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread ID

    if (gid < dimension) {
        d_vec[gid] = 0.0; // Use 0.0 for consistency with double precision
    }
}