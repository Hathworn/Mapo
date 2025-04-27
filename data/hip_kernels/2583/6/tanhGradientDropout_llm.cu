#include "hip/hip_runtime.h"
#include "includes.h"

extern "C"   // ensure function name to be exactly "eeTanh"
{
}

__global__ void tanhGradientDropout(int N, int M, float *z, float *tanh_grad_z, int seed, float D) {
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int j = blockIdx.y * blockDim.y + threadIdx.y;

    if (i >= N || j >= M) return;  // Efficient boundary check

    int index = j * N + i;
    float c1 = __fdividef(2.0, 3.0);
    float scaleFactor1 = __fdividef(1.7159, __fsub_rn(1.0, D));
    float scaleFactor2 = __fdividef(-1.7159, __fsub_rn(1.0, D));

    // Initialize random state
    hiprandState_t state;
    hiprand_init((seed << 20) + index, 0, 0, &state);

    // Generate a uniform random number
    float F = hiprand_uniform(&state);

    if (F < D) {
        z[index] = 0.0;
        tanh_grad_z[index] = 0.0;
    } else {
        float el = __fmul_rn(z[index], c1);
        if (el > 4.97) {
            z[index] = scaleFactor1;
            tanh_grad_z[index] = 0.0;
        } else if (el < -4.97) {
            z[index] = scaleFactor2;
            tanh_grad_z[index] = 0.0;
        } else {
            float x2 = __fmul_rn(el, el);
            float a = __fmul_rn(el, __fmaf_rn(x2, __fmaf_rn(x2, __fadd_rn(378.0, x2), 17235.0), 135135.0));
            float b = __fmaf_rn(x2, __fmaf_rn(x2, __fmaf_rn(x2, 28.0, 3150.0), 62370.0), 135135.0);
            float tanh = __fdividef(a, b);
            z[index] = __fmul_rn(scaleFactor1, tanh);
            tanh_grad_z[index] = __fmul_rn(scaleFactor1, __fmul_rn(__fmaf_rn(-tanh, tanh, 1.0), c1));
        }
    }
}