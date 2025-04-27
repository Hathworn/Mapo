#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void factorKernel(float *w, int N)
{
    int ix  = blockIdx.x * blockDim.x + threadIdx.x;
    int idx = ix * 2;
    int izx = N + idx;

    // Use constant memory for Pi and precompute aw
    const float pi = 3.141592653589793238462643383;
    float aw = (2.0 * pi) / N;
    
    if (idx < N) {
        float arg = aw * ix;  // Compute only when needed within boundary
        float cos_val = cos(arg);
        float sin_val = sin(arg);
        
        // Load values once and reuse
        w[idx] = cos_val;
        w[idx + 1] = sin_val;
        w[izx] = -cos_val;
        w[izx + 1] = -sin_val;
    }
}