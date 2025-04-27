#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;

#define checkCudaErrors(err)  __checkCudaErrors (err, __FILE__, __LINE__)

__global__ void sayHi()
{
    // Use thread block and thread index for potential use or future extensibility
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx == 0)  // Limit printf usage to a single thread to avoid cluttered output
    {
        printf("Cuda Kernel Hello World.\n");
    }
}