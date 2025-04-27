#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_rndrd_kernel(int *buffer, size_t reps, size_t steps, size_t elements)
{
    // Optimize: Restrict loop iterations and unroll for better throughput
    int errors = 0;
    size_t tid = blockIdx.x * blockDim.x + threadIdx.x;

    if (tid < elements) {  // Prevents out-of-bound access
        for (size_t j = 0; j < reps; ++j) {
            size_t p = tid;
            size_t a = 548191;
            size_t v = 24819 + (p >> 5);

            #pragma unroll 8  // Unroll loop to increase ILP and hide latency
            for (size_t i = 0; i < steps; i += 4) {
                size_t p0 = p;
                p = (p + (v << 5)) % elements;
                v = (v + a) % elements;
                size_t p1 = p;
                p = (p + (v << 5)) % elements;
                v = (v + a) % elements;
                size_t p2 = p;
                p = (p + (v << 5)) % elements;
                v = (v + a) % elements;
                size_t p3 = p;
                p = (p + (v << 5)) % elements;
                v = (v + a) % elements;

                int v0 = buffer[p0];
                int v1 = buffer[p1];
                int v2 = buffer[p2];
                int v3 = buffer[p3];

                if (v0 != p1) errors++;
                if (v1 != p2) errors++;
                if (v2 != p3) errors++;
                if (v3 != p) errors++;
            }
        }
        if ((errors > 0) && (reps > elements))
            atomicAdd(&buffer[0], errors);  // Use atomic to avoid race conditions
    }
}