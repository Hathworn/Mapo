#include "hip/hip_runtime.h"
#include "includes.h"

#define TB 128
#define GS(x) (((x) - 1) / TB + 1)

__global__ void downsample_(float *input, float *output, int factor, int size3, int size)
{
    // Calculate global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory to optimize atomic operations
    __shared__ float shared_output[TB];
    int tid = threadIdx.x;
    shared_output[tid] = 0.0f;

    if (id < size) {
        int dim3 = id % size3;
        int dim2 = id / size3;
        // Accumulate in shared memory to reduce atomic contention
        atomicAdd(&shared_output[tid], input[id] / (factor * factor));
    }

    __syncthreads();

    // Flush results from shared memory to output using atomicAdd
    if (tid == 0) {
        for (int i = 0; i < TB && (blockIdx.x * TB + i) < size; i++) {
            int idx = blockIdx.x * TB + i;
            int dim3 = idx % size3;
            int dim2 = idx / size3;
            atomicAdd(output + ((dim2 / factor) * (size3 / factor) + (dim3 / factor)), shared_output[i]);
        }
    }
}