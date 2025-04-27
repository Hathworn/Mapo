#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void normal_kernel(int seed, float *data, int n, float mean, float std) {
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    // Check if thread index is within bounds
    if (id >= n) return;
    
    hiprandState state;
    // Initialize state with thread-specific seed for parallel generation
    hiprand_init(seed, id, 0, &state);
    
    // Each thread generates one random normal value
    data[id] = hiprand_normal(&state) * std + mean;
}