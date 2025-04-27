#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void generateCurve(float t, float dx, float* out, const float ZMIN, const size_t ZSIZE) {
    // Calculate the global thread index
    int offset = blockIdx.x * blockDim.x + threadIdx.x;

    // Pre-calculate values used multiple times
    float z = ZMIN + offset * dx;
    float z_t = z * t + t;
    float reciprocal_z = 1.0f / z;
    float sin_t_scaled = 0.1f * sin(t);

    // Ensure thread index is within bounds
    if (offset < ZSIZE) {
        // Store results in the output array
        out[3 * offset]     = cos(z_t) * reciprocal_z;
        out[3 * offset + 1] = sin(z_t) * reciprocal_z;
        out[3 * offset + 2] = z + sin_t_scaled;
    }
}