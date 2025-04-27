#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void modcpy(void *destination, void *source, size_t destination_size, size_t source_size) {
    // Calculate thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Divide sizes by sizeof(int4) once to avoid redundant computations
    int ds = destination_size / sizeof(int4);
    int ss = source_size / sizeof(int4);

    // Optimize loop by eliminating division inside the loop
    for (int i = idx; i < ds; i += gridDim.x * blockDim.x) {
        int pos = i % ss; // Compute source position once per iteration
        reinterpret_cast<int4*>(destination)[i] = reinterpret_cast<int4*>(source)[pos]; // Copy data
    }
}