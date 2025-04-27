#include "hip/hip_runtime.h"
#include "includes.h"

__device__ int blockSum(int *b, int size) {
    int sum = 0;
    for (int i = 0; i < size; ++i) {
        sum += b[i];
    }
    return sum;
}

__global__ void computeSumPerBlock(int *a, int N) {
    extern __shared__ int sdata_a[];
    unsigned int tid = threadIdx.x;
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;

    if (i < N) {
        // Load element from global to shared memory
        sdata_a[tid] = a[i];
    } else {
        sdata_a[tid] = 0; // Ensures out-of-bounds access is safe
    }
    
    __syncthreads(); // Ensure shared memory is fully populated
    
    // Use reduction to sum values in shared memory
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tid < s) {
            sdata_a[tid] += sdata_a[tid + s];
        }
        __syncthreads(); // Ensure all additions at this stage are done
    }
    
    // Write the result for this block to global memory
    if (tid == 0) {
        a[blockIdx.x] = sdata_a[0];
    }
}