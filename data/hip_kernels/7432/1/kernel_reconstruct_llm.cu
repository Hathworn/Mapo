#include "hip/hip_runtime.h"
#include "includes.h"
#ifdef OCTOTIGER_HAVE_CUDA


#endif
__global__ void kernel_reconstruct(double *Q, double *D1, double *U_, double *X, double omega) {
    if (threadIdx.x == 0 && threadIdx.y == 0 && threadIdx.z == 0 && blockIdx.x == 0 && blockIdx.y == 0 && blockIdx.z == 0) {
        // Print statement executed only once using a single condition
        printf("Hello reconstruct");
    }
}