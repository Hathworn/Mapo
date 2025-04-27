#include "hip/hip_runtime.h"
#include "includes.h"

//#define ITEM_COUNT 2
#define _PI 3.14159265358979323846
#define _PI2 1.57079632679489661923
#define _RAD 6372795

using namespace std;

hipError_t addWithCuda(int *c, const int *a, const int *b, unsigned int size);

__global__ void d_cudainit(int *a, int *b)
{
    // Use blockIdx.x and blockDim.x for scalability
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Unified condition check for all threads
    if (i < 2) 
    {
        b[i] = a[i] * 2;
    }
}