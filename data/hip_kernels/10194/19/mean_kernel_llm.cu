#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mean_kernel(float *x, int batch, int filters, int spatial, float *mean)
{
    // Calculate scale outside of the kernel for efficient reuse
    extern __shared__ float shared_data[];
    
    float scale = 1.0 / (batch * spatial);
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use stride to cover all filters
    for (; i < filters; i += blockDim.x * gridDim.x) {
        shared_data[threadIdx.x] = 0;

        // Accumulate sum in shared memory
        for (int j = 0; j < batch; ++j) {
            for (int k = 0; k < spatial; ++k) {
                int index = j * filters * spatial + i * spatial + k;
                shared_data[threadIdx.x] += x[index];
            }
        }

        // Reduce shared memory sums to a single value per thread block
        __syncthreads();
        if (threadIdx.x == 0) {
            float block_sum = 0;
            for (int t = 0; t < blockDim.x; ++t) {
                block_sum += shared_data[t];
            }
            mean[i] = block_sum * scale;
        }
    }
}