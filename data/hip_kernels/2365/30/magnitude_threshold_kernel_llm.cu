#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void magnitude_threshold_kernel(float * grad_x, float * grad_y, float * grad_z, float gamma)
{
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int j = blockIdx.y * blockDim.y + threadIdx.y;
    unsigned int k = blockIdx.z * blockDim.z + threadIdx.z;

    // Ensure index is within bounds
    if (i >= c_Size.x || j >= c_Size.y || k >= c_Size.z)
        return;

    // Compute unique ID using 1D indexing
    long int id = (k * c_Size.y + j) * c_Size.x + i;

    // Use fast math operations for computing norm
    float norm = __fsqrt_rn(grad_x[id] * grad_x[id] + grad_y[id] * grad_y[id] + grad_z[id] * grad_z[id]);
    
    if (norm > gamma)
    {
        float ratio = gamma / norm;
        // Apply ratio using in-place operations
        grad_x[id] *= ratio;
        grad_y[id] *= ratio;
        grad_z[id] *= ratio;
    }
}