#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void magnitude_threshold_kernel(float *grad_x, float *grad_y, float *grad_z, float gamma)
{
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int j = blockIdx.y * blockDim.y + threadIdx.y;
    unsigned int k = blockIdx.z * blockDim.z + threadIdx.z;

    // Exit early if out of bounds
    if (i >= c_Size.x || j >= c_Size.y || k >= c_Size.z) return;

    long int id = (k * c_Size.y + j) * c_Size.x + i;

    // Use hypot for potential performance gain and numerical stability
    float norm = hypot(hypot(grad_x[id], grad_y[id]), grad_z[id]);
    if (norm > gamma)
    {
        float ratio = gamma / norm;
        grad_x[id] *= ratio;
        grad_y[id] *= ratio;
        grad_z[id] *= ratio;
    }
}