#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cheby_calc_u( const int x_inner, const int y_inner, const int halo_depth, const double* p, double* u)
{
const int gid = threadIdx.x+blockIdx.x*blockDim.x;
if(gid >= x_inner*y_inner) return;

const int x = x_inner + 2*halo_depth;
const int col = gid % x_inner;
const int row = gid / x_inner;
const int off0 = halo_depth*(x + 1);
const int index = off0 + col + row*x;

u[index] += p[index];
}