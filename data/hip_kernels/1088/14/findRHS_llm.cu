#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void findRHS(double* cOld, double* cCurr, double* cHalf, double* cNonLinRHS, int nx)
{
    // Compute unique global thread index in x and y dimensions
    int globalIdx = blockDim.x * blockIdx.x + threadIdx.x;
    int globalIdy = blockDim.y * blockIdx.y + threadIdx.y;

    // Compute linear index from 2D block
    int index = globalIdy * nx + globalIdx;
    
    // Check if index is within valid range to avoid out-of-bounds access
    if (globalIdx < nx && globalIdy < nx) {
        // Optimize RHS calculation using combined operations
        double delta = (2.0 / 3.0) * (cOld[index] - cCurr[index]);
        cHalf[index] += delta + cNonLinRHS[index];

        // Directly update cOld with cCurr
        cOld[index] = cCurr[index];
    }
}
```
