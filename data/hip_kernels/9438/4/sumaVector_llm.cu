#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sumaVector(float *v1, float *v2, float *res) {
    // Calculate global index
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    // Unroll loop for performance improvement, assume TAM_V is divisible by block size
    #pragma unroll
    for (int i = index; i < TAM_V; i += blockDim.x * gridDim.x) {
        res[i] = v1[i] + v2[i];
    }
}