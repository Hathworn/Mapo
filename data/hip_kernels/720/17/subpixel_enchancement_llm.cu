#include "hip/hip_runtime.h"
#include "includes.h"

#define TB 128

#define DISP_MAX 256

__global__ void subpixel_enchancement(float *d0, float *c2, float *out, int size, int dim23, int disp_max) {
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Early exit if id is out of bounds
    if (id >= size) return;

    // Pre-calculated index for c2 array
    int d = d0[id];
    int baseDim23 = d * dim23 + id;

    out[id] = d;

    // Check valid disparity range
    if (1 <= d && d < disp_max - 1) {
        // Load neighboring values of c2
        float cn = c2[(d - 1) * dim23 + id];
        float cz = c2[baseDim23];
        float cp = c2[(d + 1) * dim23 + id];

        // Calculate denominator and check its validity
        float denom = 2 * (cp + cn - 2 * cz);
        if (denom > 1e-5) {
            // Compute sub-pixel enhancement
            out[id] = d - min(1.0f, max(-1.0f, (cp - cn) / denom));
        }
    }
}