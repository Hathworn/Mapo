#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void BpropH(const float* layer1, float* dlayer1, const float* synH, float* dsynH, const float alpha, const int offset)
{
    int i = blockDim.x * blockIdx.x + threadIdx.x; // 256
    int j = blockDim.y * blockIdx.y + threadIdx.y; // 256

    // Early exit if thread indices are out of bounds
    if (i >= 256 || j >= 256) return;

    float val1 = dlayer1[offset * 256 + j] * layer1[(offset - 1) * 256 + i] * alpha;
    float val2 = layer1[offset * 256 + j] * synH[i * 256 + j];

    // Use shared memory to reduce atomic operations (only local optimization can be applied in global memory context)
    __shared__ float shared_dsynH[256 * 256];
    __shared__ float shared_dlayer1[256 * 256];

    atomicAdd(&shared_dsynH[i * 256 + j], val1);
    atomicAdd(&shared_dlayer1[(offset - 1) * 256 + i], val2);

    __syncthreads();

    if (i == 0 && j == 0) { // Only one thread writes back to global memory to reduce atomic operations
        for (int x = 0; x < 256; x++) {
            for (int y = 0; y < 256; y++) {
                atomicAdd(&dsynH[x * 256 + y], shared_dsynH[x * 256 + y]);
                atomicAdd(&dlayer1[(offset - 1) * 256 + x], shared_dlayer1[(offset - 1) * 256 + x]);
            }
        }
    }
}