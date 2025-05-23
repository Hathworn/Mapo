#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void Divide( float * x, size_t idx, size_t N, float W0, float W1)
{
for (int i = blockIdx.x * blockDim.x + threadIdx.x; i < N; i += blockDim.x * gridDim.x)
{
if (abs(x[(idx-2)*N+i]) > 0.00000001)
x[(idx-2)*N+i] = ((W0*x[(idx-1)*N+i]) / (W1*x[(idx-2)*N+i]));
else
x[(idx-2)*N+i] = 1.0 ;
//printf("Result is %f\n", x[(idx-2)*N+i]);
}
return;
}