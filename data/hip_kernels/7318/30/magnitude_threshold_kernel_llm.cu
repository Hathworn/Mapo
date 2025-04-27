#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void magnitude_threshold_kernel(float * grad_x, float * grad_y, float * grad_z, float gamma)
{
    // Use fast math functions for efficiency
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int j = blockIdx.y * blockDim.y + threadIdx.y;
    unsigned int k = blockIdx.z * blockDim.z + threadIdx.z;

    // Early exit to reduce register pressure
    if (i >= c_Size.x || j >= c_Size.y || k >= c_Size.z) return;

    long int id = (k * c_Size.y + j) * c_Size.x + i;

    // Compute squared norm to avoid an extra sqrt operation
    float norm_sqr = grad_x[id] * grad_x[id] + grad_y[id] * grad_y[id] + grad_z[id] * grad_z[id];
    float gamma_sqr = gamma * gamma;

    if (norm_sqr > gamma_sqr)
    {
        // Avoid division by using reciprocal and multiplication
        float ratio = rsqrtf(norm_sqr) * gamma;
        grad_x[id] *= ratio;
        grad_y[id] *= ratio;
        grad_z[id] *= ratio;
    }
}