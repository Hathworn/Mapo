#include "hip/hip_runtime.h"
#include "includes.h"

#define TB 128
#define DISP_MAX 256

__global__ void subpixel_enchancement(float *d0, float *c2, float *out, int size, int dim23, int disp_max) {
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if id is within bounds
    if (id >= size) return;

    int d = d0[id];
    out[id] = d;

    // Ensure d is within valid range for subpixel enhancement calculation
    if (1 <= d && d < disp_max - 1) {
        float cn = c2[(d - 1) * dim23 + id];
        float cz = c2[d * dim23 + id];
        float cp = c2[(d + 1) * dim23 + id];
        
        // Calculate denominator and adjust with threshold check
        float denom = 2 * (cp + cn - 2 * cz);
        if (denom > 1e-5) {
            float adjustment = (cp - cn) / denom;
            
            // Clamp adjustment value and update output
            out[id] = d - fminf(1.0f, fmaxf(-1.0f, adjustment));
        }
    }
}