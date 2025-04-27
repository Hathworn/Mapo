#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gradient_and_subtract_kernel(float * in, float * grad_x, float * grad_y, float * grad_z)
{
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int j = blockIdx.y * blockDim.y + threadIdx.y;
    unsigned int k = blockIdx.z * blockDim.z + threadIdx.z;

    // Exit if out of bounds
    if (i >= c_Size.x || j >= c_Size.y || k >= c_Size.z) return;

    long int id = (k * c_Size.y + j) * c_Size.x + i;

    // Pre-calculate boundary checks and positions
    bool inside_x = (i < c_Size.x - 1);
    bool inside_y = (j < c_Size.y - 1);
    bool inside_z = (k < c_Size.z - 1);

    if (inside_x) {
        long int id_x = id + 1;
        grad_x[id] -= ((in[id_x] - in[id]) / c_Spacing.x); // Calculate gradient in x direction
    }
    if (inside_y) {
        long int id_y = id + c_Size.x;
        grad_y[id] -= ((in[id_y] - in[id]) / c_Spacing.y); // Calculate gradient in y direction
    }
    if (inside_z) {
        long int id_z = id + c_Size.x * c_Size.y;
        grad_z[id] -= ((in[id_z] - in[id]) / c_Spacing.z); // Calculate gradient in z direction
    }
}