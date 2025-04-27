#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void incrValue(float *data, int idx, float value) {
    // Use atomicAdd to handle potential race conditions
    atomicAdd(&data[idx], value);
}