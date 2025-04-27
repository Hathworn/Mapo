#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void clip_kernel(float *v, int n, float limit) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Return early if index is out of bounds
    if (x >= n) return;

    float val = v[x];
    
    // Simplify condition for clarity and potential optimization
    if (val > limit) {
        v[x] = limit;
    } else if (val < -limit) {
        v[x] = -limit;
    }
}