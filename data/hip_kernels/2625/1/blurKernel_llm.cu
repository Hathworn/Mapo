```c
#include "hip/hip_runtime.h"
#include "includes.h"

typedef struct bmpFileHeaderStruct {
/* 2 bytes de identificación */
uint32_t size;        /* Tamaño del archivo */
uint16_t resv1;       /* Reservado */
uint16_t resv2;       /* Reservado */
uint32_t offset;      /* Offset hasta hasta los datos de imagen */
} bmpFileHeader;

typedef struct bmpInfoHeaderStruct {
uint32_t headersize;  /* Tamaño de la cabecera */
uint32_t width;       /* Ancho */
uint32_t height;      /* Alto */
uint16_t planes;      /* Planos de color (Siempre 1) */
uint16_t bpp;         /* bits por pixel */
uint32_t compress;    /* compresion */
uint32_t imgsize;     /* tamaño de los datos de imagen */
uint32_t bpmx;        /* Resolucion X en bits por metro */
uint32_t bpmy;        /* Resolucion Y en bits por metro */
uint32_t colors;      /* colors used en la paleta */
uint32_t imxtcolors;  /* Colores importantes. 0 si son todos */
} bmpInfoHeader;

__global__ void blurKernel(unsigned char *img_device, unsigned char *img_device2, uint32_t width_image, uint32_t height_image) {

    int x, y;
    int blurSize = 10;
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int i = width_image * row + col;

    if (row < height_image && col < width_image) { // Check bounds for threads
        int avgR = 0, avgG = 0, avgB = 0, ile = 0;

        // Optimize loop bounds calculation
        int startX = max(0, col - blurSize / 2);
        int startY = max(0, row - blurSize / 2);
        int endX = min(width_image, col + blurSize / 2 + 1);
        int endY = min(height_image, row + blurSize / 2 + 1);

        for (x = startX; x < endX; x++) {
            for (y = startY; y < endY; y++) {
                int idx = (x * 3) + (y * width_image * 3);
                avgB += img_device2[idx + 0];
                avgG += img_device2[idx + 1];
                avgR += img_device2[idx + 2];
                ile++;
            }
        }

        avgB /= ile;
        avgG /= ile;
        avgR /= ile;

        int outIdx = (col * 3) + (row * width_image * 3);
        img_device[outIdx + 0] = avgB;
        img_device[outIdx + 1] = avgG;
        img_device[outIdx + 2] = avgR;
    }
}