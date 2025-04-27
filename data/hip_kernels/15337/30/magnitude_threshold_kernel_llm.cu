#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void magnitude_threshold_kernel(float * grad_x, float * grad_y, float * grad_z, float gamma)
{
    // Calculate global thread ID
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int j = blockIdx.y * blockDim.y + threadIdx.y;
    unsigned int k = blockIdx.z * blockDim.z + threadIdx.z;

    // Check if within bounds
    if (i >= c_Size.x || j >= c_Size.y || k >= c_Size.z)
        return;

    // Calculate linear index
    long int id = (k * c_Size.y + j) * c_Size.x + i;

    // Calculate square of the gradient magnitude
    float norm_sq = grad_x[id] * grad_x[id] + grad_y[id] * grad_y[id] + grad_z[id] * grad_z[id];

    // Compare squared magnitude against squared gamma to avoid sqrt
    float gamma_sq = gamma * gamma;
    if (norm_sq > gamma_sq)
    {
        // Calculate ratio safely without sqrt
        float ratio = gamma / sqrt(norm_sq);
        grad_x[id] *= ratio;
        grad_y[id] *= ratio;
        grad_z[id] *= ratio;
    }
}