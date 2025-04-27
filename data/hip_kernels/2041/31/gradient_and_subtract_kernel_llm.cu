#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gradient_and_subtract_kernel(float *in, float *grad_x, float *grad_y, float *grad_z)
{
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int j = blockIdx.y * blockDim.y + threadIdx.y;
    unsigned int k = blockIdx.z * blockDim.z + threadIdx.z;

    if (i >= c_Size.x || j >= c_Size.y || k >= c_Size.z) return;

    long int id = (k * c_Size.y + j) * c_Size.x + i;

    // Avoid redundant memory access by using shared memory for neighboring elements
    __shared__ float s_in_x[BLOCK_SIZE_X + 1];
    __shared__ float s_in_y[BLOCK_SIZE_Y + 1];
    __shared__ float s_in_z[BLOCK_SIZE_Z + 1];

    if (i < (c_Size.x - 1))
        s_in_x[threadIdx.x] = in[id + 1];
    if (j < (c_Size.y - 1))
        s_in_y[threadIdx.y] = in[id + c_Size.x];
    if (k < (c_Size.z - 1))
        s_in_z[threadIdx.z] = in[id + c_Size.x * c_Size.y];

    __syncthreads();

    if (i < (c_Size.x - 1))
        grad_x[id] -= ((s_in_x[threadIdx.x] - in[id]) / c_Spacing.x);
    if (j < (c_Size.y - 1))
        grad_y[id] -= ((s_in_y[threadIdx.y] - in[id]) / c_Spacing.y);
    if (k < (c_Size.z - 1))
        grad_z[id] -= ((s_in_z[threadIdx.z] - in[id]) / c_Spacing.z);
}