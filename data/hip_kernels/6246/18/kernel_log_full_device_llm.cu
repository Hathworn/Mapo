#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_log_full_device(int *x, int *out, unsigned int size, int epsilon) {

    unsigned int idx = blockDim.x * blockIdx.x + threadIdx.x;
    unsigned int stride = blockDim.x * gridDim.x;

    // Unroll the loop to improve performance
    for (unsigned int i = idx; i < size; i += stride * 4) {
        if (i < size) {
            out[i] = (int) logf((float) x[i] + epsilon);
        }
        if (i + stride < size) {
            out[i + stride] = (int) logf((float) x[i + stride] + epsilon);
        }
        if (i + 2 * stride < size) {
            out[i + 2 * stride] = (int) logf((float) x[i + 2 * stride] + epsilon);
        }
        if (i + 3 * stride < size) {
            out[i + 3 * stride] = (int) logf((float) x[i + 3 * stride] + epsilon);
        }
    }
}