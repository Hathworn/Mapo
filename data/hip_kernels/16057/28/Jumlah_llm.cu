#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Jumlah(float *sumMatrix, float *mulMatrix) {
    int Index = blockIdx.x * blockDim.x + threadIdx.x;

    // Load value from global memory to register for faster access
    float value = 0.0f;
    if (Index < 1) {
        value = mulMatrix[0];
        printf("%f", value);
    } else {
        value = mulMatrix[Index];
    }

    // Use atomic add to prevent race conditions while updating sumMatrix
    atomicAdd(&sumMatrix[0], value);
}