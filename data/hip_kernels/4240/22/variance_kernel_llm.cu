#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void variance_kernel(float *x, float *mean, int batch, int filters, int spatial, float *variance)
{
    float scale = 1.F/(batch * spatial - 1);
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= filters) return;

    // Declare shared memory for variance computation
    __shared__ float shared_variance[1024];  // Adjust size based on maximum allowable shared memory

    shared_variance[threadIdx.x] = 0;

    // Parallelize inner loops
    for(int j = 0; j < batch; ++j) {
        for(int k = threadIdx.x; k < spatial; k += blockDim.x) {
            int index = j*filters*spatial + i*spatial + k;
            shared_variance[threadIdx.x] += powf((x[index] - mean[i]), 2);
        }
    }
    
    // Reduce shared variance computations
    __syncthreads();
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
        if (threadIdx.x < stride) {
            shared_variance[threadIdx.x] += shared_variance[threadIdx.x + stride];
        }
        __syncthreads();
    }
    
    // Write final reduced result back to global memory
    if (threadIdx.x == 0) {
        variance[i] = shared_variance[0] * scale;
    }
}