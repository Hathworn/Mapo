#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_seqrd_kernel(int *buffer, size_t reps, size_t elements)
{
    int errors = 0;
    size_t ofs = blockIdx.x * blockDim.x + threadIdx.x;
    size_t step = blockDim.x * gridDim.x;

    for(size_t j = 0; j < reps; j++) {
        for (size_t idx = ofs; idx < elements; idx += step * 4) { // Process four elements per loop iteration
            // Manually unroll loop to get multiple loads in flight per thread, using vectorized access
            int val1 = buffer[idx];
            int val2 = (idx + step < elements) ? buffer[idx + step] : 0;
            int val3 = (idx + step * 2 < elements) ? buffer[idx + step * 2] : 0;
            int val4 = (idx + step * 3 < elements) ? buffer[idx + step * 3] : 0;
            // Check result of all the reads
            if(val1 != 0) errors++;
            if(val2 != 0) errors++;
            if(val3 != 0) errors++;
            if(val4 != 0) errors++;
        }
    }
    if(errors > 0)
        atomicAdd(&buffer[0], errors); // Use atomicAdd for potential multi-block errors update
}