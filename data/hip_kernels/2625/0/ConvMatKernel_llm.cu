#include "hip/hip_runtime.h"
#include "includes.h"

typedef struct bmpFileHeaderStruct {
    uint32_t size;      
    uint16_t resv1;     
    uint16_t resv2;     
    uint32_t offset;    
} bmpFileHeader;

typedef struct bmpInfoHeaderStruct {
    uint32_t headersize;
    uint32_t width;     
    uint32_t height;    
    uint16_t planes;    
    uint16_t bpp;       
    uint32_t compress;  
    uint32_t imgsize;   
    uint32_t bpmx;      
    uint32_t bpmy;      
    uint32_t colors;    
    uint32_t imxtcolors;
} bmpInfoHeader;

__global__ void ConvMatKernel(unsigned char *img_device, unsigned char *img_device2, uint32_t width_image, uint32_t height_image, int j, float *mat) {
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if thread is within image bounds
    if (row >= height_image || col >= width_image) return;

    float avgB = 0.0f, avgG = 0.0f, avgR = 0.0f;

    // Apply convolution only if pixel is within bounds
    for (int x = -1; x <= 1; x++) {
        for (int y = -1; y <= 1; y++) {
            int newRow = row + x;
            int newCol = col + y;
            if (newRow >= 0 && newRow < height_image && newCol >= 0 && newCol < width_image) {
                avgB += img_device[(newCol*3) + (newRow*width_image*3) + 0] * mat[(x + 1) * 3 + (y + 1)];
                avgG += img_device[(newCol*3) + (newRow*width_image*3) + 1] * mat[(x + 1) * 3 + (y + 1)];
                avgR += img_device[(newCol*3) + (newRow*width_image*3) + 2] * mat[(x + 1) * 3 + (y + 1)];
            }
        }
    }

    int imgIndex = col*3 + row*width_image*3;
    img_device2[imgIndex + 0] = avgB;
    img_device2[imgIndex + 1] = avgG;
    img_device2[imgIndex + 2] = avgR;
}