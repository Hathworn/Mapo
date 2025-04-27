#include "hip/hip_runtime.h"
#include "includes.h"
extern "C" {
}

#define TB 128
#define DISP_MAX 256

__global__ void subpixel_enchancement(float *d0, float *c2, float *out, int size, int dim23, int disp_max) {
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Process only if within valid range
    if (id >= size) return;

    int d = d0[id];
    out[id] = d;

    // Optimize memory access by evaluating condition first
    if (1 <= d && d < disp_max - 1) {
        float cn = c2[(d - 1) * dim23 + id];
        float cz = c2[d * dim23 + id];
        float cp = c2[(d + 1) * dim23 + id];
        
        // Combine computations to reduce repeated operations
        float denom = cp + cn - 2 * cz;
        
        if (denom > 5e-6) { // Slightly adjust threshold for numerical stability
            out[id] = d - min(1.0f, max(-1.0f, 0.5f * (cp - cn) / denom));
        }
    }
}