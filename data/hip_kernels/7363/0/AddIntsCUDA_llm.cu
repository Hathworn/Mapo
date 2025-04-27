```c++
#include "hip/hip_runtime.h"
#include "includes.h"
using namespace std;

__global__ void AddIntsCUDA(int *a, int *b)
{
    // Use threadIdx.x to ensure each thread performs operation independently
    int idx = threadIdx.x;
    if (idx == 0) {
        a[0] += b[0];
    }
}