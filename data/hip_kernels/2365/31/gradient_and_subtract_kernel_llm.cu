#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gradient_and_subtract_kernel(float * in, float * grad_x, float * grad_y, float * grad_z)
{
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int j = blockIdx.y * blockDim.y + threadIdx.y;
    unsigned int k = blockIdx.z * blockDim.z + threadIdx.z;

    if (i >= c_Size.x || j >= c_Size.y || k >= c_Size.z)
        return;

    long int id = (k * c_Size.y + j) * c_Size.x + i;

    // Use shared memory for coalesced global memory access
    extern __shared__ float s_data[];
    s_data[threadIdx.z * blockDim.y * blockDim.x + threadIdx.y * blockDim.x + threadIdx.x] = in[id];
    __syncthreads();

    float val = s_data[threadIdx.z * blockDim.y * blockDim.x + threadIdx.y * blockDim.x + threadIdx.x];
    if (i != (c_Size.x - 1)) {
        float neighbor_x = s_data[threadIdx.z * blockDim.y * blockDim.x + threadIdx.y * blockDim.x + threadIdx.x + 1];
        grad_x[id] -= ((neighbor_x - val) / c_Spacing.x);
    }
    if (j != (c_Size.y - 1)) {
        float neighbor_y = s_data[threadIdx.z * blockDim.y * blockDim.x + (threadIdx.y + 1) * blockDim.x + threadIdx.x];
        grad_y[id] -= ((neighbor_y - val) / c_Spacing.y);
    }
    if (k != (c_Size.z - 1)) {
        float neighbor_z = s_data[(threadIdx.z + 1) * blockDim.y * blockDim.x + threadIdx.y * blockDim.x + threadIdx.x];
        grad_z[id] -= ((neighbor_z - val) / c_Spacing.z);
    }
}