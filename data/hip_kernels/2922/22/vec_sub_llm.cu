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
__global__ void vec_sub(const float* A, const float* B, float* C, int N) {
    // Calculate global thread index
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Optimize condition check by placing it inside the if block
    if (i < N) {
        C[i] = A[i] - B[i];
    }
}