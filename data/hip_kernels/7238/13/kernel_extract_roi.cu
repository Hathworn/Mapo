#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel_extract_roi(float* input, float* output, char* mean, const int input_w, const int output_w, const int output_h, const int in_plane_r, const int in_plane_g, const int in_plane_b, const int out_plane_r, const int out_plane_g, const int out_plane_b, const int bbox_x, const int bbox_y, const int bbox_w, const int bbox_h)
{
uint x = blockIdx.x * blockDim.x + threadIdx.x;
uint y = blockIdx.y * blockDim.y + threadIdx.y;

if( x < output_w && y < output_h)
{
float r[2] = { float(x) * bbox_w / output_w + bbox_x,
float(y) * bbox_h / output_h + bbox_y };

int   pos[4][2] = { { int(floor(r[0])), int(floor(r[1])) },
{ int( ceil(r[0])), int(floor(r[1])) },
{ int(floor(r[0])),  int(ceil(r[1])) },
{ int( ceil(r[0])),  int(ceil(r[1])) } };

float u = r[0]-floor(r[0]);
float v = r[1]-floor(r[1]);

float s[4] = { (1-u)*(1-v), u*(1-v), (1-u)*v, u*v };

int map[4] = { pos[0][1]*input_w + pos[0][0], pos[1][1]*input_w + pos[1][0],
pos[2][1]*input_w + pos[2][0], pos[3][1]*input_w + pos[3][0]};

int idx = y * output_w + x;
output[idx+out_plane_r] = round( s[0]*input[map[0]+in_plane_r]
+ s[1]*input[map[1]+in_plane_r]
+ s[2]*input[map[2]+in_plane_r]
+ s[3]*input[map[3]+in_plane_r] );// float(mean[idx+out_plane_r]));
output[idx+out_plane_g] = round( s[0]*input[map[0]+in_plane_g]
+ s[1]*input[map[1]+in_plane_g]
+ s[2]*input[map[2]+in_plane_g]
+ s[3]*input[map[3]+in_plane_g] );//float(mean[idx+out_plane_g]));
output[idx+out_plane_b] = round( s[0]*input[map[0]+in_plane_b]
+ s[1]*input[map[1]+in_plane_b]
+ s[2]*input[map[2]+in_plane_b]
+ s[3]*input[map[3]+in_plane_b] );//float(mean[idx+out_plane_b]));
}
}