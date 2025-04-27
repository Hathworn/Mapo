#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reduceVector(float *v1, float *v2, float *res){

    // Get global thread index
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use shared memory for faster access
    extern __shared__ float shared[];

    // Load elements into shared memory
    shared[threadIdx.x] = v1[index];
    __syncthreads();

    // Perform reduction using shared memory
    for (int i = blockDim.x / 2; i > 0; i /= 2) {
        if (threadIdx.x < i) {
            shared[threadIdx.x] += shared[threadIdx.x + i];
        }
        __syncthreads();
    }

    // Write result for this block to global memory
    if (threadIdx.x == 0)
        res[blockIdx.x] = shared[0];
}