```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gradient_and_subtract_kernel(float * in, float * grad_x, float * grad_y, float * grad_z)
{
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int j = blockIdx.y * blockDim.y + threadIdx.y;
    unsigned int k = blockIdx.z * blockDim.z + threadIdx.z;

    // Exit directly if the current thread is out of bounds
    if (i >= c_Size.x || j >= c_Size.y || k >= c_Size.z)
        return;

    // Precompute strides to optimize index calculations
    long int stride_y = c_Size.x; // Number of elements across x
    long int stride_z = c_Size.y * stride_y; // Total number of elements in xy plane

    long int id = k * stride_z + j * stride_y + i;
    long int id_x = id + 1; // Reuse id for x index calculation
    long int id_y = id + stride_y; // Compute y index using precomputed stride
    long int id_z = id + stride_z; // Compute z index using precomputed stride

    // Optimize gradient computations by checking boundaries first
    if (i != (c_Size.x - 1))
        grad_x[id] -= ((in[id_x] - in[id]) / c_Spacing.x);
    if (j != (c_Size.y - 1))
        grad_y[id] -= ((in[id_y] - in[id]) / c_Spacing.y);
    if (k != (c_Size.z - 1))
        grad_z[id] -= ((in[id_z] - in[id]) / c_Spacing.z);
}