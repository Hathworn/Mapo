#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float sigmoid(float a) {
    return 1.0 / (1.0 + exp(-a));
}

__global__ void sigmoid_kernel(float *vec, int len) {
    // Using shared memory to improve memory access latency
    extern __shared__ float shared_vec[];

    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index < len) {
        shared_vec[threadIdx.x] = vec[index];
        __syncthreads(); // Ensure shared memory is fully loaded

        // Compute sigmoid in shared memory
        shared_vec[threadIdx.x] = sigmoid(shared_vec[threadIdx.x]);

        __syncthreads(); // Ensure all computations are done
        vec[index] = shared_vec[threadIdx.x]; // Write back to global memory
    }
}