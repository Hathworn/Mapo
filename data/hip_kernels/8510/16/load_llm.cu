#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void load(int size, const long *in) {
    // Calculate the global thread ID
    const int ix = threadIdx.x + blockIdx.x * blockDim.x;

    // Ensure index is within bounds
    if (ix < size) {
        // Prefetching data into registers to reduce memory latency
        long data = in[ix];
        // Here, you can perform some operations on `data` if needed
        // Currently `data` is loaded into register but not used
    }
}
