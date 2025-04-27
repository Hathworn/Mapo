#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vc(float *dA, float *dB, int N) {
    // Calculate global thread index for current thread.
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    // Use if statement to check boundary and avoid branch divergence.
    if (id < N) {
        // Directly copy data from dB to dA for valid thread indices.
        dA[id] = dB[id];
    }
}