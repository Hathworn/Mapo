#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void elevar_al_cuadrado(float * d_salida, float * d_entrada){
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Modify index calculation for full grid
    if (idx < N) { // Add boundary check to prevent out-of-bounds
        float f = d_entrada[idx];
        d_salida[idx] = f * f;
    }
}