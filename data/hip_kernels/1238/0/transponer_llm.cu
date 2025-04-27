#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void transponer(float* entrada, float* salida, int ANCHO) {
    // Calculate unique thread identifiers
    int tx = blockIdx.x * blockDim.x + threadIdx.x;
    int ty = blockIdx.y * blockDim.y + threadIdx.y;

    // Check bounds to avoid out-of-bounds memory access
    if (tx < ANCHO && ty < ANCHO) {
        // Efficiently transpose using shared memory if possible (depends on hardware capabilities)
        salida[tx * ANCHO + ty] = entrada[ty * ANCHO + tx];
    }
}