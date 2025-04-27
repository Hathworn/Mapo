#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize: Using a shared state to reduce data access overhead
__global__ void histColorsKernel(float* histColors, hiprandState* states) {
    int bin = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Load state once per thread
    hiprandState localState = states[bin];
    
    histColors[3 * bin + 0] = hiprand_uniform(&localState);
    histColors[3 * bin + 1] = hiprand_uniform(&localState);
    histColors[3 * bin + 2] = hiprand_uniform(&localState);
    
    // Save updated state back
    states[bin] = localState;
}