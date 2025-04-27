#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void chooseSample (const int nDB, const int si, const float *EE, float *EBV) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Efficient memory access with appropriate bounds checking
    if (i < nDB) {
        EBV[i] = EE[i + si * nDB];
    }
}