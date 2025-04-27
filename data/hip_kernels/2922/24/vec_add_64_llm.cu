#include "hip/hip_runtime.h"
#include "includes.h"

#ifdef __cplusplus
extern "C" {
#endif

/****** Single precision *****/





/****** Double precision *****/






#ifdef __cplusplus
}
#endif

__global__ void vec_add_64(const double* A, const double* B, double* C, int N) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Ensure thread does useful work within bounds
    if (i < N) {
        // Perform efficient memory access and vector addition
        C[i] = A[i] + B[i];
    }
}