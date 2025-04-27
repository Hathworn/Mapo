#include "hip/hip_runtime.h"
#include "includes.h"
#define TILE_WIDTH 32

#define COMMENT "Centrist_GPU"
#define RGB_COMPONENT_COLOR 255

typedef struct {
    unsigned char red, green, blue;
} PPMPixel;

typedef struct {
    int x, y;
    PPMPixel *data;
} PPMImage;

__global__ void mod_CENTRIST(PPMPixel *image_out, PPMPixel *image_cp, int columns, int rows, int *hist, int hist_len) {
    int col = TILE_WIDTH * blockIdx.x + threadIdx.x;
    int row = TILE_WIDTH * blockIdx.y + threadIdx.y;

    __shared__ int hist_private[512];
    int hist_index = (threadIdx.y * TILE_WIDTH + threadIdx.x); //get index in shared histogram
    if(hist_index < hist_len) hist_private[hist_index] = 0;
    __syncthreads();

    if(col < columns && row < rows) {
        // Use shared memory efficiently for image processing
        __shared__ unsigned char image_cp_private[TILE_WIDTH + 2][TILE_WIDTH + 2];
        
        int img_index = row * columns + col; //get index in original image
        int grayscale = (image_cp[img_index].red*299 + image_cp[img_index].green*587 + image_cp[img_index].blue*114) / 1000; //avoid float point errors

        image_cp_private[threadIdx.y + 1][threadIdx.x + 1] = grayscale;
        if(threadIdx.x == 0 && col > 0) {
            int left_grayscale = (image_cp[img_index - 1].red*299 + image_cp[img_index - 1].green*587 + image_cp[img_index - 1].blue*114) / 1000;
            image_cp_private[threadIdx.y + 1][threadIdx.x] = left_grayscale;
        }
        if(threadIdx.x == TILE_WIDTH - 1 && col < columns - 1) {
            int right_grayscale = (image_cp[img_index + 1].red*299 + image_cp[img_index + 1].green*587 + image_cp[img_index + 1].blue*114) / 1000;
            image_cp_private[threadIdx.y + 1][threadIdx.x + 2] = right_grayscale;
        }
        if(threadIdx.y == 0 && row > 0) {
            int top_grayscale = (image_cp[img_index - columns].red*299 + image_cp[img_index - columns].green*587 + image_cp[img_index - columns].blue*114) / 1000;
            image_cp_private[threadIdx.y][threadIdx.x + 1] = top_grayscale;
        }
        if(threadIdx.y == TILE_WIDTH - 1 && row < rows - 1) {
            int bottom_grayscale = (image_cp[img_index + columns].red*299 + image_cp[img_index + columns].green*587 + image_cp[img_index + columns].blue*114) / 1000;
            image_cp_private[threadIdx.y + 2][threadIdx.x + 1] = bottom_grayscale;
        }
        __syncthreads();

        if(col < columns - 1 && row < rows - 1) { //ignore first/last row/column
            float mean = 0.0f;
            for(int r = 0; r < 3; ++r) {
                for(int c = 0; c < 3; ++c) {
                    mean += image_cp_private[threadIdx.y + r][threadIdx.x + c];
                }
            }
            mean /= 9.0f;
            int value = 0, k = 8;
            for(int r = 0; r < 3; ++r) {
                for(int c = 0; c < 3; ++c) {
                    if(image_cp_private[threadIdx.y + r][threadIdx.x + c] >= mean) {
                        value |= 1 << k;
                    }
                    k--;
                }
            }

            int img_out_ind = row * (columns - 1) + col; //get index in output original
            image_out[img_out_ind].red = image_out[img_out_ind].blue = image_out[img_out_ind].green = value;
            atomicAdd(&(hist_private[value]), 1);
        }
        __syncthreads();

        if(hist_index == 0) {
            for(int i = 0; i < hist_len; i++) {
                atomicAdd(&(hist[i]), hist_private[i]); //init shared histogram
            }
        }
    }
}