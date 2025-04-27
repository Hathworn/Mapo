#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _kpolymap64(int n, double *k, double c, double d) {
    // Use shared memory for storing computation results
    extern __shared__ double sharedMem[];

    int i = threadIdx.x + blockIdx.x * blockDim.x;

    // Loop unrolling optimization
    while (i < n) {
        sharedMem[threadIdx.x] = pow(k[i] + c, d);

        // Store computed value back to global memory
        k[i] = sharedMem[threadIdx.x];

        i += blockDim.x * gridDim.x;
    }
}