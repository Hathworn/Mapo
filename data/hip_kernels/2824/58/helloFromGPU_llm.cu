#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void helloFromGPU()
{
    // Use only the first thread of the first block for printf
    if ( threadIdx.x == 0 && blockIdx.x == 0 ) {
        printf("Hello World from GPU! %d\n", blockIdx.x);
    }
}