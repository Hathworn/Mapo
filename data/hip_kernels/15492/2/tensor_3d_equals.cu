#include "hip/hip_runtime.h"
#include "includes.h"
extern "C" {

#ifndef DTYPE
#define DTYPE float
#endif






}
__global__ void tensor_3d_equals (const int n, const int c, const int h, const DTYPE* x, const int offset_x, const int n_x, const int c_x, const int h_x, const DTYPE* y, const int offset_y, const int n_y, const int c_y, const int h_y, int* eq_flag) {
const int gid_n = blockIdx.x * blockDim.x + threadIdx.x;
const int gid_c = blockIdx.y * blockDim.y + threadIdx.y;
const int gid_h = blockIdx.z * blockDim.z + threadIdx.z;
const bool valid = (gid_n < n) && (gid_c < c) && (gid_h < h);
if (valid) {
const int ix = offset_x + gid_n * n_x + gid_c * c_x + gid_h * h_x;
const int iy = offset_y + gid_n * n_y + gid_c * c_y + gid_h * h_y;
if (x[ix] != y[iy]){
eq_flag[0]++;
}
}
}