#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vc(float *dA, float *dB, int N) {
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Use __restrict__ to avoid pointer aliasing
    float *__restrict__ dA_loc = dA;
    float *__restrict__ dB_loc = dB;

    if (id < N) {
        // Minimize memory access by reading and writing directly
        dA_loc[id] = dB_loc[id];
    }
}