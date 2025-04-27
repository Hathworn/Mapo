#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void fast_variance_delta_kernel(float *x, float *delta, float *mean, float *variance, int batch, int filters, int spatial, float *variance_delta)
{
    extern __shared__ float local[];  // Allocate shared memory dynamically

    int id = threadIdx.x;
    int filter = blockIdx.x;

    local[id] = 0.0f;  // Initialize shared memory
    __syncthreads();   // Ensure initialization is complete before computation

    // Calculate strides to minimize redundant computations and optimize memory access
    int stride = blockDim.x * gridDim.x;
    int thread_index = filter * spatial + id;

    // Unroll the loop for better warp utilization
    for(int j = 0; j < batch; ++j){
        for(int i = id; i < spatial; i += stride){
            int index = j * spatial * filters + thread_index + i;
            if (i + id < spatial) {
                local[id] += delta[index] * (x[index] - mean[filter]);
            }
        }
    }
    __syncthreads();  // Ensure all thread computations are complete

    // Reduce the results within the block
    if (id == 0) {
        variance_delta[filter] = 0.0f;
        for (int i = 0; i < blockDim.x; ++i) {
            variance_delta[filter] += local[i];
        }
        variance_delta[filter] *= -0.5 * powf(variance[filter] + 1e-6f, -1.5f);
    }
}