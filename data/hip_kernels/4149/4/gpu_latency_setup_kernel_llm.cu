#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_latency_setup_kernel(int *buffer, size_t delta, size_t elements)
{
    // Calculate global thread index
    size_t ofs = blockIdx.x * blockDim.x + threadIdx.x;

    // Use modulo operation to get target index directly
    while(ofs < elements) {
        buffer[ofs] = (ofs + delta) % elements;
        ofs += blockDim.x * gridDim.x;
    }
}