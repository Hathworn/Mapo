#include "hip/hip_runtime.h"
#include "includes.h"

#define N (4096*4096)
#define HILOS_POR_BLOQUE 512

__global__ void sumaenlagpu(int *a, int *b, int *c, int n) {
    // Calculate the global index for the thread
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Loop unrolling to optimize memory access and arithmetic latency
    if (index < n) {
        int stride = blockDim.x * gridDim.x;
        for (int i = index; i < n; i += stride) {
            c[i] = a[i] + b[i];
        }
    }
}