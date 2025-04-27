#include "hip/hip_runtime.h"
#include "includes.h"
__device__ int f () { return 21; }
__global__ void sample()
{
    int a = blockIdx.x;
    int b = blockIdx.y;
    int c = threadIdx.x;
    double x = 1;

    // Optimize pow(0.0, x) to 0 and pow(x, 2.0) to x * x
    double result = a + b * x + c * (x * x);

    if(result == 10)
        printf("a=%d, b=%d, c=%d\n", a, b, c);
}