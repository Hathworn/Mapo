#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void calcSoftmaxSumForwardGPU(float *array, float *out, float *max, float *sum, int *mutex, int batch_size, int in_size_x, unsigned n)
{
    unsigned int index = threadIdx.x + blockIdx.x * blockDim.x;
    unsigned int stride = gridDim.x * blockDim.x;

    // Use dynamic shared memory allocation
    extern __shared__ float cache[];

    float temp = 0.0;

    // Optimize by removing the offset variable and using stride with index directly
    for (unsigned int i = index; i < n; i += stride) {
        float v = exp(array[i] - max[blockIdx.x]); // Read max with blockIdx.x
        out[i] = v;
        temp += v;
    }

    // Store to cache using the available index
    cache[threadIdx.x] = temp;

    __syncthreads();

    // Perform reduction using shared memory with stride
    for (unsigned int i = blockDim.x / 2; i > 0; i /= 2) {
        if (threadIdx.x < i) {
            cache[threadIdx.x] += cache[threadIdx.x + i];
        }
        __syncthreads();
    }

    // Use atomic operations for writing the result to global memory
    if (threadIdx.x == 0) {
        while (atomicCAS(mutex, 0, 1) != 0); // Lock using atomic
        sum[blockIdx.x] += cache[0];         // Write the sum result of the block
        atomicExch(mutex, 0);                // Unlock using atomic
    }
}