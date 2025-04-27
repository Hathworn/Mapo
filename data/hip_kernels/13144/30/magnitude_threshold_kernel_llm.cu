#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void magnitude_threshold_kernel(float * grad_x, float * grad_y, float * grad_z, float gamma)
{
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int j = blockIdx.y * blockDim.y + threadIdx.y;
    unsigned int k = blockIdx.z * blockDim.z + threadIdx.z;

    // Check bounds once using a combined condition
    if (i < c_Size.x && j < c_Size.y && k < c_Size.z) 
    {
        long int id = (k * c_Size.y + j) * c_Size.x + i;
        
        // Compute squared norm to reduce calculations
        float grad_x_val = grad_x[id];
        float grad_y_val = grad_y[id];
        float grad_z_val = grad_z[id];
        float norm_squared = grad_x_val * grad_x_val + grad_y_val * grad_y_val + grad_z_val * grad_z_val;

        // Only calculate sqrt if necessary
        if (norm_squared > gamma * gamma)
        {
            float norm = sqrt(norm_squared);
            float ratio = gamma / norm;
            // Apply thresholding with preloaded values
            grad_x[id] = grad_x_val * ratio;
            grad_y[id] = grad_y_val * ratio;
            grad_z[id] = grad_z_val * ratio;
        }
    }
}