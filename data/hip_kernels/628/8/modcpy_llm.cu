#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void modcpy(void *destination, void *source, size_t destination_size, size_t source_size) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x; // Cache grid stride for efficiency

    int ds = destination_size / sizeof(int4);
    int ss = source_size / sizeof(int4);

    // Use unrolled loop for better performance
    for (int i = idx; i < ds; i += stride) {
        int pos = i % ss;
        reinterpret_cast<int4*>(destination)[i] = reinterpret_cast<int4*>(source)[pos];
    }
}