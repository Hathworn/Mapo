#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gradient_and_subtract_kernel(float * in, float * grad_x, float * grad_y, float * grad_z)
{
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int j = blockIdx.y * blockDim.y + threadIdx.y;
    unsigned int k = blockIdx.z * blockDim.z + threadIdx.z;

    // Use a single return to check bounds; saves unnecessary calculations
    if (i >= c_Size.x || j >= c_Size.y || k >= c_Size.z)
        return;

    // Calculate base index once for reuse; avoids redundant calculations
    long int base_id = (k * c_Size.y + j) * c_Size.x + i;

    // Only compute required indices if within bounds
    if (i < c_Size.x - 1) {
        long int id_x = base_id + 1;
        grad_x[base_id] -= ((in[id_x] - in[base_id]) / c_Spacing.x);
    }
    if (j < c_Size.y - 1) {
        long int id_y = base_id + c_Size.x;
        grad_y[base_id] -= ((in[id_y] - in[base_id]) / c_Spacing.y);
    }
    if (k < c_Size.z - 1) {
        long int id_z = base_id + (c_Size.y * c_Size.x);
        grad_z[base_id] -= ((in[id_z] - in[base_id]) / c_Spacing.z);
    }
}