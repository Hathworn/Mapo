#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel_forwardElimination( float * fullMatrix, float * B, unsigned int nComp ) {
    unsigned int t = threadIdx.x;
    unsigned int baseIndex = t * nComp * nComp;

    for (unsigned int i = 0; i < nComp - 1; i++) {
        float pivot = fullMatrix[baseIndex + i * nComp + i]; // Cache pivot value
        for (unsigned int j = i + 1; j < nComp; j++) {
            float div = fullMatrix[baseIndex + j * nComp + i] / pivot; // Use cached pivot value
            for (unsigned int k = 0; k < nComp; k++) {
                fullMatrix[baseIndex + j * nComp + k] -= div * fullMatrix[baseIndex + i * nComp + k];
            }
            B[baseIndex + j] -= div * B[baseIndex + i];
        }
    }
}