#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void increment_kernel(int *g_data, int inc_value) {
    // Compute global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Perform increment operation, potentially reducing access latency when memory is aligned
    int value = g_data[idx];
    g_data[idx] = value + inc_value;
}