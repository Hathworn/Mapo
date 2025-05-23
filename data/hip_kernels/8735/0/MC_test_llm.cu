```c
#include "hip/hip_runtime.h"
#include "includes.h"

/**************************************
***************************************
* Code Can be compiled using --> nvcc kernel5.cu -lcurand if the cuRand lib is the envirement PATH
* else use nvcc kernel5.cu -L</path/to/the/lib> -lcurand
***************************************
**************************************/

__global__ void MC_test(unsigned int seed, hiprandState *states, unsigned int numsim, unsigned int *results) {
    extern __shared__ int sdata[];
    int nthreads = gridDim.x * blockDim.x;
    unsigned int innerpoint = 0;
    int tx = threadIdx.x;
    int idx = blockIdx.x * blockDim.x + tx;
    hiprandState state;
    float x, y, l2norm2;

    hiprand_init(seed, idx, 0, &state);
    for (int i = idx; i < numsim; i += nthreads) {
        x = hiprand_uniform(&state);
        y = hiprand_uniform(&state);
        l2norm2 = x * x + y * y;
        if (l2norm2 < 1.0f) {
            innerpoint++;
        }
    }

    sdata[tx] = innerpoint;
    __syncthreads();

    // Reduction
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tx < s) {
            sdata[tx] += sdata[tx + s];
        }
        __syncthreads();
    }

    if (tx == 0) {
        results[blockIdx.x] = sdata[0];
    }
}