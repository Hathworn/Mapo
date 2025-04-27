#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kBesselRatioActivation(float* mat, float* target, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    // Use grid-stride loop for better performance.
    for (unsigned int i = idx; i < len; i += stride) {
        float r = mat[i];

        // Efficiently compute Bessel ratio and store result.
        float i1 = cyl_bessel_i1f(r);
        float i0 = cyl_bessel_i0f(r);
        target[i] = i1 / i0;
    }
}