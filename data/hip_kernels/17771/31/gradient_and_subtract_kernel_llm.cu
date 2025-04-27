#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void gradient_and_subtract_kernel(float *in, float *grad_x, float *grad_y, float *grad_z)
{
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int j = blockIdx.y * blockDim.y + threadIdx.y;
    unsigned int k = blockIdx.z * blockDim.z + threadIdx.z;

    // Check if the indices are within bounds
    if (i >= c_Size.x || j >= c_Size.y || k >= c_Size.z)
        return;

    // Calculate linear index
    long int id = (k * c_Size.y + j) * c_Size.x + i;

    // Prefetching adjacent indices for x, y, z directions
    long int id_x = id + 1;
    long int id_y = id + c_Size.x;
    long int id_z = id + c_Size.x * c_Size.y;

    // Compute gradients and subtract only if within bounds
    if (i < c_Size.x - 1)
        grad_x[id] -= (in[id_x] - in[id]) / c_Spacing.x;
    if (j < c_Size.y - 1)
        grad_y[id] -= (in[id_y] - in[id]) / c_Spacing.y;
    if (k < c_Size.z - 1)
        grad_z[id] -= (in[id_z] - in[id]) / c_Spacing.z;
}