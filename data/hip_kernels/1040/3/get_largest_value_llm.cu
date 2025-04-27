#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void get_largest_value_device(short *vec, const int vec_length, int *max) {
    for (int i = threadIdx.x; i < vec_length; i += blockDim.x) {
        atomicMax(max, vec[i]);
    }
}

__global__ void get_largest_value(int *vec, const int vec_length, int* max) {
    // Use shared memory for intermediate maximums
    extern __shared__ int shared_max[];
    int local_max = INT_MIN;
    
    // Calculate local maximum
    for (int i = threadIdx.x; i < vec_length; i += blockDim.x) {
        local_max = max(local_max, vec[i]);
    }
    shared_max[threadIdx.x] = local_max;
    __syncthreads();
    
    // Find maximum in shared memory
    for (int stride = blockDim.x / 2; stride > 0; stride /= 2) {
        if (threadIdx.x < stride) {
            shared_max[threadIdx.x] = max(shared_max[threadIdx.x], shared_max[threadIdx.x + stride]);
        }
        __syncthreads();
    }
    
    // Use atomicMax to write the result to global memory
    if (threadIdx.x == 0) {
        atomicMax(max, shared_max[0]);
    }
}