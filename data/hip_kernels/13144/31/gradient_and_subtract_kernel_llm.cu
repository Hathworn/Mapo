#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gradient_and_subtract_kernel(float *in, float *grad_x, float *grad_y, float *grad_z)
{
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int j = blockIdx.y * blockDim.y + threadIdx.y;
    unsigned int k = blockIdx.z * blockDim.z + threadIdx.z;

    // Early exit for out-of-bound indices
    if (i >= c_Size.x || j >= c_Size.y || k >= c_Size.z)
        return;
    
    long int id = (k * c_Size.y + j) * c_Size.x + i;

    // Calculate gradients conditionally
    if (i < c_Size.x - 1)
        grad_x[id] -= ((in[id + 1] - in[id]) / c_Spacing.x);
    if (j < c_Size.y - 1)
        grad_y[id] -= ((in[id + c_Size.x] - in[id]) / c_Spacing.y);
    if (k < c_Size.z - 1)
        grad_z[id] -= ((in[id + c_Size.x * c_Size.y] - in[id]) / c_Spacing.z);
}