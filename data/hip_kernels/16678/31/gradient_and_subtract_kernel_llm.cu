#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gradient_and_subtract_kernel(float *in, float *grad_x, float *grad_y, float *grad_z)
{
    // Calculate flattened global index
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int j = blockIdx.y * blockDim.y + threadIdx.y;
    unsigned int k = blockIdx.z * blockDim.z + threadIdx.z;

    // Boundary check
    if (i >= c_Size.x || j >= c_Size.y || k >= c_Size.z) return;

    // Precompute index multiplier
    long int xStride = c_Size.x;
    long int yStride = c_Size.y * xStride;
    
    // Calculate linear index for 3D array
    long int id = k * yStride + j * xStride + i;

    // Calculate neighboring indices only once
    long int id_x = id + 1;
    long int id_y = id + xStride;
    long int id_z = id + yStride;

    // Compute gradients and subtract based on boundary conditions
    if (i < c_Size.x - 1)
        grad_x[id] -= (in[id_x] - in[id]) / c_Spacing.x;
    if (j < c_Size.y - 1)
        grad_y[id] -= (in[id_y] - in[id]) / c_Spacing.y;
    if (k < c_Size.z - 1)
        grad_z[id] -= (in[id_z] - in[id]) / c_Spacing.z;
}