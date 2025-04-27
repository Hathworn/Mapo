#include "hip/hip_runtime.h"
#include "includes.h"
extern "C" {
}

#define IDX2C(i, j, ld) ((j)*(ld)+(i))
#define SQR(x)      ((x)*(x))                        // x^2

__global__ void multiply_arrays(double* signals, double const* weights) {
    // Calculate the global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Perform the multiplication if within bounds
    if (idx < N) {
        signals[idx] *= weights[idx];
    }
}
```
