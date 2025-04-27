#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_pow_grad_device(int *x, int power, int *grad, int *out, bool grad_is_scalar, unsigned int size) {
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int stride = blockDim.x * gridDim.x;

    // Loop unrolling to enhance performance
    for (unsigned int i = idx; i < size; i += stride * 4) {
        if (i < size) {
            float x_val0 = (float) x[i];
            out[i] = grad[(grad_is_scalar) ? 0 : i] * power * (int) powf(x_val0, power - 1);
        }
        if (i + stride < size) {
            float x_val1 = (float) x[i + stride];
            out[i + stride] = grad[(grad_is_scalar) ? 0 : i + stride] * power * (int) powf(x_val1, power - 1);
        }
        if (i + stride * 2 < size) {
            float x_val2 = (float) x[i + stride * 2];
            out[i + stride * 2] = grad[(grad_is_scalar) ? 0 : i + stride * 2] * power * (int) powf(x_val2, power - 1);
        }
        if (i + stride * 3 < size) {
            float x_val3 = (float) x[i + stride * 3];
            out[i + stride * 3] = grad[(grad_is_scalar) ? 0 : i + stride * 3] * power * (int) powf(x_val3, power - 1);
        }
    }
}