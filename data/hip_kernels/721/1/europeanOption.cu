#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void europeanOption( int size, int iterations, float *d_price, float initialPrice, float strikePrice, hiprandState_t *d_state)
{
int tid = threadIdx.x + blockDim.x * blockIdx.x;

if (tid < size)
{

for (int i = 0; i < iterations; i++)
{
initialPrice *= 1 + mu / timespan + hiprand_normal(&d_state[tid])*sigma/sqrt(timespan);
}

d_price[tid] = initialPrice - strikePrice;
if (d_price[tid] < 0)
{
d_price[tid] = 0;
}
}

}