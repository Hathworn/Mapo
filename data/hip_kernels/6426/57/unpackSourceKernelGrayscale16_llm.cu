#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void unpackSourceKernelGrayscale16(uint16_t* __restrict__ dst, unsigned pitch, const hipSurfaceObject_t src, unsigned width, unsigned height) {
    // Pre-calculate indices
    const unsigned x = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned y = blockIdx.y * blockDim.y + threadIdx.y;

    // Check bounds only once
    if (x < width && y < height) {
        float val;
        // Coalesced access and use shared memory for surf2Dread if possible
        __shared__ float shared_val[BLOCK_SIZE_X][BLOCK_SIZE_Y]; // Assume BLOCK_SIZE_X and BLOCK_SIZE_Y are defined
        surf2Dread(&shared_val[threadIdx.y][threadIdx.x], src, x * sizeof(float), y);
        __syncthreads(); // Ensure all threads read the surface before proceeding

        // Convert directly without intermediate steps
        const uint16_t u16 = __float2half_rn(fmaxf(0.f, fminf((float)USHRT_MAX, shared_val[threadIdx.y][threadIdx.x] * 1000.f)));
        // Reduce global memory write by using a register
        dst[y * pitch + x] = u16;
    }
}