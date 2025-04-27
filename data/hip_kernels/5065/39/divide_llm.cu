#include "hip/hip_runtime.h"
#include "includes.h"

#ifdef __cplusplus
extern "C" {
#endif

#ifdef __cplusplus
}
#endif

__global__ void divide(double* VN, const double* max, int size) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    if (i < size) { // Combine condition check to eliminate redundant else
        VN[i] = VN[i] / max[0];
    }
}