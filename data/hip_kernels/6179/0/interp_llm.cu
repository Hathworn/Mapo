#include "hip/hip_runtime.h"
#include "includes.h"
texture<float, 1, hipReadModeElementType> tex_sin;
texture<float, 1, hipReadModeElementType> tex_sin2;
texture<float, 1, hipReadModeElementType> tex_sin3;

__global__ void interp(float* out, float *out2, int N) {
    int idx = blockDim.x * blockIdx.x + threadIdx.x;

    if (idx < N) {
        float normalizedIdx = (float)idx / N; // Precompute normalized index
        out[idx] = tex1D(tex_sin3, normalizedIdx);
        out2[idx] = tex1D(tex_sin, normalizedIdx);
    }
}