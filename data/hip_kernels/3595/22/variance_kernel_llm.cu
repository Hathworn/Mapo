#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void variance_kernel(float *x, float *mean, int batch, int filters, int spatial, float *variance)
{
    // Use shared memory to improve performance
    extern __shared__ float shared_mem[];
    float *partial_sums = shared_mem;   

    float scale = 1.f/(batch * spatial - 1);
    int i = (blockIdx.x + blockIdx.y*gridDim.x) * blockDim.x + threadIdx.x;
    if (i >= filters) return;

    partial_sums[threadIdx.x] = 0.0f;
    
    // Loop unrolling for better performance
    for(int j = 0; j < batch; ++j) {
        int base_index = j*filters*spatial + i*spatial;
        for(int k = 0; k < spatial; k += 2) {
            int index1 = base_index + k;
            int index2 = base_index + k + 1;
            float diff1 = x[index1] - mean[i];
            float diff2 = (k + 1 < spatial) ? x[index2] - mean[i] : 0.0f;
            partial_sums[threadIdx.x] += powf(diff1, 2) + powf(diff2, 2);
        }
    }

    __syncthreads(); // Synchronize threads to ensure shared memory writes are complete

    // Reduction to accumulate partial sums
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
        if (threadIdx.x < stride) {
            partial_sums[threadIdx.x] += partial_sums[threadIdx.x + stride];
        }
        __syncthreads();
    }

    if (threadIdx.x == 0) {
        variance[i] = partial_sums[0] * scale;
    }
}