#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vc(float *dA, float *dB, int N) {
    // Calculate id only if there is work to be done
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= N) return;
    
    // Efficient memory access
    dA[id] = dB[id];
}