#include "hip/hip_runtime.h"
#include "includes.h"
__global__  void sway_and_flip_weights_kernel(const float *src_weight_gpu, float *weight_deform_gpu, int nweights, int n, int kernel_size, int angle, int reverse)
{
const int index = blockIdx.x*blockDim.x + threadIdx.x;
const int kernel_area = kernel_size * kernel_size;
const int i = index * kernel_area;

const int stage_step = (nweights / kernel_area) / 4;  // 4 stages
const int stage_id = index / stage_step;

// nweights = (c / groups) * n * size * size;
// kernel_area = size*size

if (i < nweights)
{

if (stage_id == 0) {
// simple copy
for (int x = 0; x < kernel_size; ++x) {
for (int y = 0; y < kernel_size; ++y) {
weight_deform_gpu[x + y*kernel_size + i] = src_weight_gpu[x + y*kernel_size + i];
}
}
}
else if (stage_id == 1 || stage_id == 2)
{
// rotate left or right
if (stage_id == 2) angle = -angle;
if (reverse) angle = -angle;

const float cos_a = cosf(angle * 3.14159265 / 180);
const float sin_a = sinf(angle * 3.14159265 / 180);
const int x_c = kernel_size / 2;
const int y_c = kernel_size / 2;

float dropout_sum = 0;

for (int y = 0; y < kernel_size; ++y) {
for (int x = 0; x < kernel_size; ++x) {
// Xsource = x*cos(alpha) + y*sin(alpha)
// Ysource = -x*sin(alpha) + y*cos(alpha)

float x_s = x_c + (x - x_c)*cos_a + (y - y_c)*sin_a;
float y_s = y_c - (x - x_c)*sin_a + (y - y_c)*cos_a;

int x_0 = floor(x_s);   // round down
int x_1 = ceil(x_s);    // round up
if (x_0 == x_1) x_1 = x_0 + 1;
int y_0 = floor(y_s);
int y_1 = ceil(y_s);
if (y_0 == y_1) y_1 = y_0 + 1;

float c_x_0 = x_1 - x_s;
float c_x_1 = x_s - x_0;
float c_y_0 = y_1 - y_s;
float c_y_1 = y_s - y_0;

float val = 0;
if (x_0 >= 0 && x_0 < kernel_size && y_0 >= 0 && y_0 < kernel_size) val += src_weight_gpu[x_0 + y_0*kernel_size + i] * c_x_0 * c_y_0;
else dropout_sum += c_x_0 * c_y_0;

if (x_1 >= 0 && x_1 < kernel_size && y_0 >= 0 && y_0 < kernel_size) val += src_weight_gpu[x_1 + y_0*kernel_size + i] * c_x_1 * c_y_0;
else dropout_sum += c_x_1 * c_y_0;

if (x_0 >= 0 && x_0 < kernel_size && y_1 >= 0 && y_1 < kernel_size) val += src_weight_gpu[x_0 + y_1*kernel_size + i] * c_x_0 * c_y_1;
else dropout_sum += c_x_0 * c_y_1;

if (x_1 >= 0 && x_1 < kernel_size && y_1 >= 0 && y_1 < kernel_size) val += src_weight_gpu[x_1 + y_1*kernel_size + i] * c_x_1 * c_y_1;
else dropout_sum += c_x_1 * c_y_1;

weight_deform_gpu[x + y*kernel_size + i] = val;
}
}

// compensate for dropped items
const float coef = (kernel_size*kernel_size) / (kernel_size*kernel_size - dropout_sum);
for (int y = 0; y < kernel_size; ++y) {
for (int x = 0; x < kernel_size; ++x) {
weight_deform_gpu[x + y*kernel_size + i] *= coef;
}
}
}
else if (stage_id == 3)
{
// flip
for (int y = 0; y < kernel_size; ++y) {
for (int x = 0; x < kernel_size; ++x) {
weight_deform_gpu[(kernel_size - x - 1) + y*kernel_size + i] = src_weight_gpu[x + y*kernel_size + i];
}
}
}
}
}