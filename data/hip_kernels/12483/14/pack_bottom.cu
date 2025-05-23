#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void pack_bottom( const int x, const int y, const int halo_depth, double* field, double* buffer, const int depth)
{
const int x_inner = x - 2*halo_depth;

const int gid = threadIdx.x+blockDim.x*blockIdx.x;
if(gid >= x_inner*depth) return;

const int lines = gid / x_inner;
const int offset = x*halo_depth + lines*2*halo_depth;
buffer[gid] = field[offset+gid];
}