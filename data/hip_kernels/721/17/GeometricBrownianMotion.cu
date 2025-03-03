#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void GeometricBrownianMotion( float *d_a, float mu, float sigma, float dt, hiprandState_t *states, unsigned int size)
{
int i = threadIdx.x + blockDim.x * blockIdx.x;
if (i < size)
{
d_a[i] += d_a[i] * ( (dt*mu) + (sigma*sqrt(dt)*hiprand_normal(&states[i])));
}
}