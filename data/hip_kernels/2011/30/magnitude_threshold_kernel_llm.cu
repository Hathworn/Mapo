#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void magnitude_threshold_kernel(float * grad_x, float * grad_y, float * grad_z, float gamma)
{
    // Calculate linear thread index
    unsigned long long int id = (blockIdx.z * blockDim.z + threadIdx.z) * (c_Size.y * c_Size.x) 
                                + (blockIdx.y * blockDim.y + threadIdx.y) * c_Size.x 
                                + (blockIdx.x * blockDim.x + threadIdx.x);

    // Terminate if index is out of bounds
    if (blockIdx.x * blockDim.x + threadIdx.x >= c_Size.x || 
        blockIdx.y * blockDim.y + threadIdx.y >= c_Size.y || 
        blockIdx.z * blockDim.z + threadIdx.z >= c_Size.z)
        return;

    // Compute norm and apply threshold logic
    float norm = sqrt(grad_x[id] * grad_x[id] + grad_y[id] * grad_y[id] + grad_z[id] * grad_z[id]);
    if (norm > gamma)
    {
        float ratio = gamma / norm;
        grad_x[id] *= ratio;
        grad_y[id] *= ratio;
        grad_z[id] *= ratio;
    }
}