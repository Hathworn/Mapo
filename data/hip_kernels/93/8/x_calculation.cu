#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void x_calculation(float * x ,float * r,float * r_squared ,int size)
{
int index = blockDim.x * blockIdx.x + threadIdx.x ;
if (index < size)
{
float alpha = r_squared[0] ;
x[index] = x[index] + alpha * r[index] ;
}
}