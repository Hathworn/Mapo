#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void minValue(int *source, int *val) {
    __shared__ int temp[1];

    int currentValue = source[threadIdx.x];

    // Use atomic operation to update shared memory safely
    if (currentValue > -1) {
        atomicMin(temp, currentValue);
    }

    __syncthreads();

    // Only one thread writes back the minimum value
    if (threadIdx.x == 0) {
        atomicMin(val, temp[0]);
    }
}