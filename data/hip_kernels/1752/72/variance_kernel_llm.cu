#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void variance_kernel(float *x, float *mean, int batch, int filters, int spatial, float *variance)
{
    // Pre-calculate constants outside loops for reduced computation.
    float scale = 1.f / (batch * spatial - 1);
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory for variance accumulation.
    __shared__ float shared_variance[1024];
    if (threadIdx.x < filters) shared_variance[threadIdx.x] = 0.0f; 
    __syncthreads();

    if (i < filters) {
        for (int j = 0; j < batch; ++j) {
            for (int k = 0; k < spatial; ++k) {
                int index = j * filters * spatial + i * spatial + k;
                shared_variance[threadIdx.x] += powf((x[index] - mean[i]), 2);
            }
        }
    }
    __syncthreads();

    // Write accumulated variance back to global memory with scale adjustment.
    if (i < filters) {
        variance[i] = shared_variance[threadIdx.x] * scale;
    }
}