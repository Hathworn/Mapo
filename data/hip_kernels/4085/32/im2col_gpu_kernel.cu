#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void im2col_gpu_kernel(const int n, const float* data_im, const int height, const int width, const int ksize, const int pad, const int stride, const int height_col, const int width_col, float *data_col) {
int index = blockIdx.x*blockDim.x + threadIdx.x;
for (; index < n; index += blockDim.x*gridDim.x) {
int w_out = index % width_col;
int h_index = index / width_col;
int h_out = h_index % height_col;
int channel_in = h_index / height_col;
int channel_out = channel_in * ksize * ksize;
int h_in = h_out * stride - pad;
int w_in = w_out * stride - pad;
float* data_col_ptr = data_col;
data_col_ptr += (channel_out * height_col + h_out) * width_col + w_out;
const float* data_im_ptr = data_im;
data_im_ptr += (channel_in * height + h_in) * width + w_in;
for (int i = 0; i < ksize; ++i) {
for (int j = 0; j < ksize; ++j) {
int h = h_in + i;
int w = w_in + j;

*data_col_ptr = (h >= 0 && w >= 0 && h < height && w < width) ?
data_im_ptr[i * width + j] : 0;

//data_im[(channel_in * height + h_in) * width + w_in + i * width + j];
//*data_col_ptr = data_im_ptr[ii * width + jj];

data_col_ptr += height_col * width_col;
}
}
}
}