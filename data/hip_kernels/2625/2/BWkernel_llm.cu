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


__global__ void BWkernel(unsigned char *img_device, uint32_t n) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n) {
        // Perform the conversion in one step to save computation time
        unsigned char r = img_device[i * 3 + 0];
        unsigned char g = img_device[i * 3 + 1];
        unsigned char b = img_device[i * 3 + 2];
        unsigned char color = static_cast<unsigned char>(0.299 * b + 0.587 * g + 0.114 * r);
        
        // Directly assign the converted grayscale value to RGB components
        img_device[i * 3 + 0] = color;
        img_device[i * 3 + 1] = color;
        img_device[i * 3 + 2] = color;
    }
}