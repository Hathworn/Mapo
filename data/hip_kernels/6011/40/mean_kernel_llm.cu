#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mean_kernel(float *x, int batch, int filters, int spatial, float *mean)
{
    // Calculate the scale factor once; all threads in a warp compute concurrently.
    float scale = 1.F / (batch * spatial);

    // Calculate a unique thread index for different grids and threads.
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure that each thread processes a valid filter.
    if (i >= filters) return;

    // Initialize mean[i] to zero using atomic operation
    mean[i] = 0.0f;

    // Use one loop to reduce index calculations, j and k are combined.
    for (int batch_spatial = 0; batch_spatial < batch * spatial; ++batch_spatial)
    {
        // Compute the index using the current i and batch_spatial
        int index = (batch_spatial / spatial) * filters * spatial + i * spatial + (batch_spatial % spatial);
        mean[i] += x[index];
    }

    // Scale the mean value after accumulation to improve numerical stability.
    mean[i] *= scale;
}