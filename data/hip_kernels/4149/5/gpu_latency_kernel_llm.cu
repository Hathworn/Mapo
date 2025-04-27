#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_latency_kernel(int *buffer, size_t reps, size_t steps, size_t elements)
{
    int errors = 0;

    int p_init = threadIdx.x; // Initialize unique p for each thread
    for (size_t j = 0; j < reps; j++) {
        int p = p_init; // Use the initial p value

        for (size_t i = 0; i < steps; i++) {
            int next = __ldg(&buffer[p]); // Use __ldg for read-only data optimization

            if ((next >= 0) && (next < elements)) {
                p = next;
            } else {
                atomicAdd(&errors, 1); // Use atomic operation to handle errors concurrently
            }
        }
    }

    if ((errors > 0) && (reps > elements))
        atomicExch(&buffer[0], errors); // Use atomicExch to update buffer safely
}