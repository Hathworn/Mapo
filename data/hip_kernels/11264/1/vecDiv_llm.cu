#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vecDiv(float* a, float* b, float* c, const int N) {
    // Calculate global thread index
    const int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;
    
    // Perform division if within bounds
    if(i < N) { 
        c[i] = a[i] / b[i]; 
        // c[i] = __fdividef(a[i], b[i]);  // Uncomment for faster, less-accurate divide
    }
}