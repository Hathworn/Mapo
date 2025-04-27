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

__global__ void vec_fma(const float* A, const float* B, float* C, float* D, int N) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Add check to ensure boundary
    if (i >= N) return;

    // Combine addition and multiplication calculation
    D[i] = __fmul_rn(B[i], C[i]) + A[i];
}