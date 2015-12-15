#include <stdint.h>
#include <stdio.h>

float montecarlopi(const int precision);

int main() {

	printf("%f\n", montecarlopi(100000000));

	return 0;
}