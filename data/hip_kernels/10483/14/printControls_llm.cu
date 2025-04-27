#include "hip/hip_runtime.h"
#include "includes.h"

// ERROR CHECKING MACROS //////////////////////////////////////////////////////

__global__ void printControls(int noPaths, int path, int nYears, int* controls) {
    int ii = threadIdx.x + blockIdx.x * blockDim.x;  // Calculate global thread index
    if (ii < nYears) {  // Ensure within bounds
        printf("%d %d\n", ii, controls[path * nYears + ii]);
    }
}