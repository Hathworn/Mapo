#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void showProgress(char* trystr, int tam, unsigned long long int id)
{
    int n = 0;

    for (int i = 0; i < tam; i++)
    {
        if ('!' != trystr[i])
        {
            n = 1;
            break;
        }
    }

    if (id % 1000000000 == 0) printf("\n----- Id = %lld\n", id);

    if (n == 0) printf("\n***** %lld, Tam = %d -> ┤%s├\n", id, tam, trystr);
}

__device__ char * id2str(unsigned long long int n)
{
    int b = 96, r, asciChar, count = 0;
    char * a, * res;

    a = (char*) malloc(100);

    do
    {
        r = n % b;
        asciChar = 32 + r;
        a[count] = asciChar;
        count++;
        n = n / b;
    }
    while (n != 0);

    res = (char*) malloc(count + 1);

    for (int i = count - 1; i >= 0; --i) res[count - i - 1] = a[i];

    free(a);

    res[count] = '\0';

    return res;
}

__device__ __host__  int shc(char* ca, int tam)
{
    int h = 0;

    for (int i = 0; i < tam; i++)
    {
        h = 31 * h + ca[i];
    }

    return h;
}

__global__ void findcollisions(int hash, unsigned long long int strLength)
{
    unsigned long long int id = blockDim.x * blockIdx.x + threadIdx.x + strLength;
    char *trystr = id2str(id);
    int hc;

    // Optimize: Use `strlen` for readability and efficiency
    int tam = strlen(trystr); 

    showProgress(trystr, tam, id);

    hc = shc(trystr, tam);

    if (hc == hash)
        printf("Collision found for string ┤%s├. Hashcode %d\n", trystr, hc);

    if (trystr[tam - 1] == ' ')
    {
        char * reverse = (char *) malloc(tam + 1);

        // Optimize: Use `memcpy` and reverse loop
        for (int i = 0; i < tam; ++i)
            reverse[i] = trystr[tam - 1 - i];

        reverse[tam] = '\0';

        hc = shc(reverse, tam);

        if (hc == hash)
            printf("Collision found for string ┤%s├. Hashcode %d\n", reverse, hc);

        free(reverse);
    }
    free(trystr);
}