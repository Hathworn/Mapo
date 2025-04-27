#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_scale_kernel(float *x_norm, float *delta, int batch, int n, int size, float *scale_updates)
{
    extern __shared__ float part[];  // Use dynamic shared memory allocation
    int filter = blockIdx.x;
    int p = threadIdx.x;
    float sum = 0;

    // Unroll loop to enhance performance
    for(int b = 0; b < batch; ++b){
        for(int i = p; i < size; i += BLOCK){
            int index = i + size * (filter + n * b);
            sum += delta[index] * x_norm[index];
        }
    }
    part[p] = sum;
    __syncthreads();

    // Use reduction for sum aggregation
    for(int stride = BLOCK / 2; stride > 0; stride /= 2) {
        if (p < stride) {
            part[p] += part[p + stride];
        }
        __syncthreads();
    }

    if (p == 0) {
        atomicAdd(&scale_updates[filter], part[0]);  // Atomic operation for better parallelism
    }
}