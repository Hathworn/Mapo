#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaSaccumulate_kernel(float* x, int* y, unsigned int size) {
    unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int stride = blockDim.x * gridDim.x;

    // Use shared memory to reduce global memory accesses
    extern __shared__ int shared_y[];
    if (index < size) {
        shared_y[threadIdx.x] = y[index];
        __syncthreads();

        for (unsigned int i = index; i < size; i += stride) {
            x[i] += shared_y[threadIdx.x]; // Use shared memory value
        }
    }
}