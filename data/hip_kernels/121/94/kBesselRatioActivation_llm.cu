#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kBesselRatioActivation(float* mat, float* target, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;
    // Unrolling loop to improve performance
    for (unsigned int i = idx; i < len; i += stride * 4) {
        if (i < len) {
            float r1 = mat[i];
            target[i] = cyl_bessel_i1f(r1) / cyl_bessel_i0f(r1);
        }
        if (i + stride < len) {
            float r2 = mat[i + stride];
            target[i + stride] = cyl_bessel_i1f(r2) / cyl_bessel_i0f(r2);
        }
        if (i + 2 * stride < len) {
            float r3 = mat[i + 2 * stride];
            target[i + 2 * stride] = cyl_bessel_i1f(r3) / cyl_bessel_i0f(r3);
        }
        if (i + 3 * stride < len) {
            float r4 = mat[i + 3 * stride];
            target[i + 3 * stride] = cyl_bessel_i1f(r4) / cyl_bessel_i0f(r4);
        }
    }
}