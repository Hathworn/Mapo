#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void variance_kernel(float *x, float *mean, int batch, int filters, int spatial, float *variance)
{
    // Calculate scale once and move it outside kernel loop
    float scale = 1.f / (batch * spatial - 1);
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Bound check for filter range
    if (i >= filters) return;
    
    // Use local variables for variance computation
    float local_variance = 0.0;

    for (int j = 0; j < batch; ++j)
    {
        for (int k = 0; k < spatial; ++k)
        {
            int index = j * filters * spatial + i * spatial + k;
            local_variance += powf((x[index] - mean[i]), 2);
        }
    }

    // Update global variance array with computed variance
    variance[i] = local_variance * scale;
}