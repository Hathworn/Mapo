#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void elevar_al_cuadrado(float * d_salida, float * d_entrada) {
    // Calculate global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Load input value
    float f = d_entrada[idx];
    
    // Compute square
    d_salida[idx] = f * f;
}
```
