#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _l1reg32(int n, double l1, float *w, float *dw) {
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x; // Calculate stride once to avoid recomputation
    for (; i < n; i += stride) { // Use for loop for better readability
        float wi = w[i]; // Cache value to reduce global memory access
        if (wi > 0) {
            dw[i] += l1;
        } else if (wi < 0) {
            dw[i] -= l1;
        }
    }
}