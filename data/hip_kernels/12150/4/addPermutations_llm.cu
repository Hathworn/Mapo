#include "hip/hip_runtime.h"
#include "includes.h"

// Macro to check HIP error codes
#define HIP_CHECK(cmd) do { \
  hipError_t result = cmd; \
  if (result != hipSuccess) { \
    printf("error: HIP error '%s' at %s:%d\n", hipGetErrorString(result), __FILE__, __LINE__); \
    exit(result); \
  } \
} while(0)

__global__ void addPermutations(double *determinant, const double *permutations, const int *n) {
    // Use shared memory and registers to improve performance
    extern __shared__ double shared_perm[];

    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    int nn = *n * *n - 1;
    double sum = 0.0;

    // Load permutations into shared memory
    if (idx < nn) {
        shared_perm[threadIdx.x] = permutations[idx];
    }
    __syncthreads();

    // Accumulate sum
    if (idx < nn) {
        sum = shared_perm[threadIdx.x];
    }

    // Atomic addition to prevent data race
    if (idx < nn) {
        atomicAdd(determinant, sum);
    }
}