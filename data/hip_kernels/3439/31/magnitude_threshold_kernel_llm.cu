#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void magnitude_threshold_kernel(float *grad_x, float *grad_y, float *grad_z, float gamma)
{
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int j = blockIdx.y * blockDim.y + threadIdx.y;
    unsigned int k = blockIdx.z * blockDim.z + threadIdx.z;

    // Exit if out of bounds
    if (i >= c_Size.x || j >= c_Size.y || k >= c_Size.z)
        return;

    // Calculate unique index using existing approach.
    long int id = (k * c_Size.y + j) * c_Size.x + i;

    // Compute norm using local registers to minimize memory access
    float gx = grad_x[id];
    float gy = grad_y[id];
    float gz = grad_z[id];
    float norm = sqrt(gx * gx + gy * gy + gz * gz);

    if (norm > gamma)
    {
        float ratio = gamma / norm;
        // Perform scaled assignment in place
        grad_x[id] = gx * ratio;
        grad_y[id] = gy * ratio;
        grad_z[id] = gz * ratio;
    }
}