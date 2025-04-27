#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void add_normal_kerneld(int seed, double *data, int n, double mean, double std) {
    // Calculate global thread ID
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Initialize state for each thread
    hiprandState state;
    hiprand_init(seed, idx, 0, &state);
    
    // Use thread ID to access array elements directly
    for (size_t i = idx; i < n; i += gridDim.x * blockDim.x) {
        data[i] += hiprand_normal_double(&state) * std + mean;
    }
}