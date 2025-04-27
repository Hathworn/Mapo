#include "hip/hip_runtime.h"
#include "includes.h"

extern "C"   // ensure function name to be exactly "eeTanh"
{
}

__global__ void tanhGradient(int N, int M, float *z, float *tanh_grad_z) {
    // Calculate global indices for the current thread
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int j = blockIdx.y * blockDim.y + threadIdx.y;

    if (i < N && j < M) { // Boundary check
        int index = j * N + i;

        // Constants
        float c1 = __fdividef(2.0, 3.0);
        float c2 = 1.7159;

        // Compute and optimize computations within branches
        float el = __fmul_rn(z[index], c1);

        if (el > 4.97) {
            z[index] = c2;
            tanh_grad_z[index] = 0.0f;
        }
        else if(el < -4.97) {
            z[index] = -c2;
            tanh_grad_z[index] = 0.0f;
        }
        else {
            float x2 = __fmul_rn(el, el);
            float a = __fmul_rn(el, __fmaf_rn(x2, __fmaf_rn(x2, __fadd_rn(378.0, x2), 17235.0), 135135.0));
            float b = __fmaf_rn(x2, __fmaf_rn(x2, __fmaf_rn(x2, 28.0, 3150.0), 62370.0), 135135.0);
            float tanh_val = __fdividef(a, b);
            z[index] = __fmul_rn(c2, tanh_val);
            tanh_grad_z[index] = __fmul_rn(c2, __fmul_rn(__fmaf_rn(-tanh_val, tanh_val, 1.0f), c1));
        }
    }
}