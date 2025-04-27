#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_diagdiv_fl(int M, float eps, float *y, float *x) {
    unsigned int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure this thread processes only relevant data
    if (tid < M) {
        float x_val = x[tid];  // Cache x[tid] to reduce memory access
        if (x_val > eps) {
            y[tid] /= x_val;  // Perform division operation in place
        } else {
            y[tid] = 0.0f;
        }
    }
}