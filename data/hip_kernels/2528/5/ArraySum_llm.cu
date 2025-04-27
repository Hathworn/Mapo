#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ArraySum(float *array, float *sum) {
    // Use shared memory for partial sums
    __shared__ float shared_sum;

    // Initialize shared memory
    if (threadIdx.x == 0) shared_sum = 0.0f;
    __syncthreads();

    int index = threadIdx.x + blockIdx.x * blockDim.x;

    // Accumulate values from global memory into shared memory
    float value = 0.0f;
    if (index < N) {
        value = array[index];
    }
    atomicAdd(&shared_sum, value);
    __syncthreads();

    // Accumulate from shared memory to global sum
    if (threadIdx.x == 0) {
        atomicAdd(sum, shared_sum);
    }
}