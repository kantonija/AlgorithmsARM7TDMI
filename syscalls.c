
int _write(int file, char *ptr, int len) {
    return len;  
}

void _exit(int status) {
    while (1) {} 
}

char* _sbrk(int incr) {
    return (char*) -1;  
}

int _close(int file) { return -1; }
int _fstat(int file, void *st) { return 0; }
int _isatty(int file) { return 1; }
int _lseek(int file, int ptr, int dir) { return 0; }
int _read(int file, char *ptr, int len) { return 0; }
