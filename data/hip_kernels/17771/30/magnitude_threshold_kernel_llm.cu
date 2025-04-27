#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void magnitude_threshold_kernel(float * grad_x, float * grad_y, float * grad_z, float gamma)
{
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int j = blockIdx.y * blockDim.y + threadIdx.y;
    unsigned int k = blockIdx.z * blockDim.z + threadIdx.z;

    // Ensure thread only operates within valid bounds
    if (i < c_Size.x && j < c_Size.y && k < c_Size.z) 
    {
        long int id = (k * c_Size.y + j) * c_Size.x + i;

        // Compute magnitude using more efficient intrinsic functions
        float norm = sqrtf(grad_x[id] * grad_x[id] + grad_y[id] * grad_y[id] + grad_z[id] * grad_z[id]);
        
        // Perform threshold operation based on norm
        if (norm > gamma)
        {
            float ratio = gamma / norm;
            grad_x[id] *= ratio;
            grad_y[id] *= ratio;
            grad_z[id] *= ratio;
        }
    }
}