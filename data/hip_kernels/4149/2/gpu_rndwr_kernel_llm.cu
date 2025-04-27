#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_rndwr_kernel(int *buffer, size_t reps, size_t steps, size_t elements)
{
    // Use shared memory to cache elements accessed within a warp
    extern __shared__ int sharedBuffer[];

    // Calculate global thread ID
    size_t tId = blockIdx.x * blockDim.x + threadIdx.x;

    // Early exit for threads outside valid range
    if(tId >= elements) return;

    // Initialization of constants for stepping, accessed once per warp
    size_t a = 548191;
    size_t v = 24819 + (threadIdx.x >> 5);  // Ensure velocity is different for each warp

    // Loop over repetitions
    for(size_t j = 0; j < reps; j++) {
        // Cache data from global to shared memory for current thread
        size_t p = tId;  // Start naturally aligned
        sharedBuffer[threadIdx.x] = buffer[p];

        // Inner stepping loop
        for(size_t i = 0; i < steps; i++) {
            size_t prev = p;
            p = (p + (v << 5)) % elements;  // Maintain warp convergence
            v = (v + a) % elements;        // Velocity update
            buffer[prev] = p;              // Store result back to global memory
        }
    }
}